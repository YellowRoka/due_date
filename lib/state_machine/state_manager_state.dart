part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();
  
  List<Object> get props => [];
}

class StateManagerStateInitial extends StateManagerState {
  const StateManagerStateInitial();
}

class StateManagerStateInited extends StateManagerState {
  const StateManagerStateInited();
}

class StateManagerStatetLoginSucces extends StateManagerState {
  const StateManagerStatetLoginSucces();
}

class StateManagerStatetLoginFailed extends StateManagerState {
  const StateManagerStatetLoginFailed();
}

class StateManagerStatetToBugHandler extends StateManagerState {
  const StateManagerStatetToBugHandler();
}

class StateManagerStatetToBugList extends StateManagerState {
  const StateManagerStatetToBugList();
}

class StateManagerStatetGetBugList extends StateManagerState {
  final List<BugDataObject> bugList;
  
  const StateManagerStatetGetBugList(this.bugList);
  @override
  List<Object> get props => [ bugList ];
}

class StateManagerStateToCreateBug extends StateManagerState {
  const StateManagerStateToCreateBug();
}

class StateManagerStateAddedBug extends StateManagerState {
  final List<BugDataObject>? newList;

  const StateManagerStateAddedBug( this.newList );

  @override
  List<Object> get props => [ newList! ];
}

class StateManagerStateLogout extends StateManagerState {
  const StateManagerStateLogout();
}
