part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent {
  const StateManagerEvent();

  List<Object> get props => [];
}


class StateManagerEventInit extends StateManagerEvent {
  const StateManagerEventInit();
}

class StateManagerEventLoginRQ extends StateManagerEvent {
  final String mail;
  final String password;
  
  const StateManagerEventLoginRQ(this.mail, this.password);

  @override
  List<Object> get props => [ mail, password ];
}

class StateManagerEventAddBug extends StateManagerEvent {
  final DateTime bugDate;
  final int      turnTime;
  const StateManagerEventAddBug( {required this.bugDate, required this.turnTime});

    @override
  List<Object> get props => [ bugDate, turnTime ];
}

class StateManagerEventEntered extends StateManagerEvent {
  const StateManagerEventEntered();
}

class StateManagerEventBack extends StateManagerEvent {
  const StateManagerEventBack();
}

class StateManagerEventToCreateBug extends StateManagerEvent{
  const StateManagerEventToCreateBug();
}

class StateManagerEventGetBugList extends StateManagerEvent{
  const StateManagerEventGetBugList();
}
