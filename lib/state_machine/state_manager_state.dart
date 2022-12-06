part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();
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
class StateManagerStateAddBug extends StateManagerState {
  const StateManagerStateAddBug();
}
class StateManagerStateBacked extends StateManagerState {
  const StateManagerStateBacked();
}
class StateManagerStatetBase extends StateManagerState {
  const StateManagerStatetBase();
}