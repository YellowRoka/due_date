import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../firebase/autentication/authentication_data_source.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  AuthenticationDataSource autDataSource = AuthenticationDataSource();
  
  StateManagerBloc() : super( const StateManagerStateInitial() ){

    on<StateManagerEventInit>( (event, emit){
      emit( const StateManagerStateInited() );
    });

    on<StateManagerEventLoginRQ>( (event, emit) async {
      try{
        await autDataSource.signIn(event.mail,event.password);
        emit( const StateManagerStatetLoginSucces() );
      }
      catch(e){
        emit( const StateManagerStatetLoginFailed() );
      }
      emit( const StateManagerStatetBase() );
    });

    on<StateManagerEventAddBug>( (event, emit){
      emit( const StateManagerStateAddBug() );
    });

    on<StateManagerEventBack>( (event, emit){
      emit( const StateManagerStateBacked() );
    });

  }

  @override
  void onEvent(StateManagerEvent event) {
    print("selected on SM Bloc: $event");
    super.onEvent(event);
  }
}
