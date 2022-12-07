import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../db_hive/data_model/data_object.dart';
import '../db_hive/db_interfaces.dart';
import '../db_hive/hive_control.dart';
import '../firebase/autentication/authentication_data_source.dart';
import '../functions/date_recalculator.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  AuthenticationDataSource autDataSource = AuthenticationDataSource();
  DBInterfaces             hive          = HiveController();
  List<BugDataObject>?     bugList       = [];
  
  StateManagerBloc() : super( const StateManagerStateInitial() ){

    on<StateManagerEventInit>( (event, emit) async {
      await hive.initHiveDB();
      emit( const StateManagerStateInited() );
    });

    on<StateManagerEventLoginRQ>( (event, emit) async {
      try{
        await autDataSource.signIn(event.mail,event.password);
        emit( const StateManagerStatetLoginSucces() );
        emit( const StateManagerStatetToBugHandler() );
      }
      catch(e){
        //print(e);
        emit( const StateManagerStatetLoginFailed() );
      }
    });

    on<StateManagerEventToBugList>( (event, emit) async {
      emit( const StateManagerStatetToBugList() );
    });

    on<StateManagerEventGetBugList>( (event, emit) async {
      bugList = await hive.getAllBug() ?? [];
      emit( StateManagerStatetGetBugList( bugList! ) );
    });

    on<StateManagerEventToCreateBug>( (event, emit){
      emit( const StateManagerStateToCreateBug() );
    });

    on<StateManagerEventAddBug>( (event, emit) async {
      DateTime calculatedDate = calculateDueDate( event.bugDate, event.turnTime );

      final int calculatedID = hive.getDBSize() + 1;

      hive.addBug( calculatedID, BugDataObject( event.bugDate,calculatedDate,event.turnTime ) );
      
      bugList = await hive.getAllBug() ?? [];
      
      emit( StateManagerStateAddedBug( bugList ) );
      emit( const StateManagerStatetToBugList() );
    });

    on<StateManagerEventLogout>( (event, emit) async {
      emit( const StateManagerStateLogout() );
    });

  }

  @override
  void onEvent( StateManagerEvent event ){
    super.onEvent(event);
    //print("selected on SM Bloc: $event");
  }
  
}
