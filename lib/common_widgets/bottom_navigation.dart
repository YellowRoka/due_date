import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_machine/state_manager_bloc.dart';

class ButtomNavigator extends StatefulWidget {
  const ButtomNavigator({Key? key}) : super(key: key);

  @override
  State<ButtomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener< StateManagerBloc, StateManagerState >(
      listener: (context, state) {
        if( state is StateManagerStateToCreateBug ){
          currentIndex = 0;
        }

        if( state is StateManagerStatetToBugList ){
          currentIndex = 1;
        }
        setState(() {});
      },

      child: Container(
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.normal,
                offset: const Offset(0,-20),
                color: Colors.grey.shade200
              )
            ]
          ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (value){ 
            if( currentIndex != value ){
              setState(
                (){
                  currentIndex = value;
                  switch( currentIndex ){
                    case 0: BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToCreateBug() ); break;
                    case 1: BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToBugList()   ); break;
                    case 2: BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventLogout()      ); break;
                    default: break;
                  }
                } 
              );
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.add_alert_outlined, color: Colors.black,),
              icon: Icon(Icons.add_alert_outlined,  color: Colors.grey.shade200 ),
              label: ""
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.home_outlined, color: Colors.black,),
              icon: Icon(Icons.home_outlined,  color: Colors.grey.shade200 ),
              label: ""
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.account_circle_outlined, color: Colors.black,),
              icon: Icon(Icons.account_circle_outlined,  color: Colors.grey.shade200 ),
              label: ""
            ),
          ],
        )
      )
    );
  }
}
