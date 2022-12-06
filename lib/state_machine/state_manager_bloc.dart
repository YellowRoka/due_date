import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../db_hive/data_object.dart';
import '../db_hive/hive_control.dart';
import '../firebase/autentication/authentication_data_source.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  AuthenticationDataSource autDataSource = AuthenticationDataSource();
  HiveController           hive          = HiveController();
  List<BugDataObject>?     bugList       = [];
  
  StateManagerBloc() : super( const StateManagerStateInitial() ){

    on<StateManagerEventInit>( (event, emit) async {
      await hive.initHiveDB();
      emit( const StateManagerStateInited() );
    });

    on<StateManagerEventLoginRQ>( (event, emit) async {
      //bugList = await hive.getAllBug() ?? [];

      try{
        await autDataSource.signIn(event.mail,event.password);
        emit( const StateManagerStatetLoginSucces() );
        
        emit( const StateManagerStatetToBugList() );

        
        //emit( StateManagerStatetGetBugList( bugList! ) );
      }
      catch(e){
        print(e);
        emit( const StateManagerStatetLoginFailed() );
      }
      //emit( const StateManagerStatetBase() );
      
    });

    on<StateManagerEventGetBugList>( (event, emit) async {
      bugList = await hive.getAllBug() ?? [];
      emit( StateManagerStatetGetBugList( bugList! ) );
    });

    on<StateManagerEventToCreateBug>( (event, emit){
      emit( const StateManagerStateToCreateBug() );
      //emit( const StateManagerStatetBase() );
    });

    on<StateManagerEventAddBug>( (event, emit) async {
      DateTime calculatedDate = _calculateDueDate( event.bugDate, event.turnTime );

      final int calculatedID = hive.getDBSize() + 1;

      hive.addBug( calculatedID, BugDataObject( event.bugDate,calculatedDate,event.turnTime ) );
      
      bugList = await hive.getAllBug() ?? [];
      
      emit( StateManagerStateAddedBug( bugList ) );
      //emit( const StateManagerStatetBase() );
      emit( const StateManagerStateBacked() );
    });

    on<StateManagerEventBack>( (event, emit){
      emit( const StateManagerStateBacked() );
    });

  }

  @override
  void onEvent( StateManagerEvent event ){
    print("selected on SM Bloc: $event");
    super.onEvent(event);
  }
  
  DateTime _calculateDueDate( DateTime bugDate, int turnTime ){
    int days  = turnTime ~/ 8;
    int hours = turnTime  % 8;

    return DateTime(
      bugDate.year,
      bugDate.month,
      bugDate.day  + days, //TODO: recalculate to work hours/days!!!
      bugDate.hour + hours,
      bugDate.minute,
      bugDate.millisecond,
      bugDate.microsecond
    );
  }
  void recalculateTurnTime( int turnTime ){

  }
}
