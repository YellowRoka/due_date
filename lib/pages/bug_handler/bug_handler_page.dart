//import 'package:animations/animations.dart';
import 'package:due_date/common_widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../db_hive/data_model/data_object.dart';
import '../../state_machine/state_manager_bloc.dart';

import 'bodies/bug_creator_body/bug_creator_body.dart';
import 'bodies/bug_list/bug_list_body.dart';
import '../../common_widgets/sliver_head_bar.dart';

class BugHandlerPage extends StatefulWidget {
  const BugHandlerPage({Key? key}) : super(key: key);

  @override
  State<BugHandlerPage> createState() => _BugHandlerPageState();
}

class _BugHandlerPageState extends State<BugHandlerPage>  with SingleTickerProviderStateMixin{
  List<BugDataObject>? bugDataList;

  late AnimationController animationController;
  late Animation<Offset>   offsetAnimation;

  late List<Widget> body;
  late int bodyIndex;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    bodyIndex = 1;

    body = [ 
      const BugCreateBody(),
      BugListBody( bugDataList: bugDataList ),
    ];

    animationController = AnimationController( 
      duration: const Duration( milliseconds: 800 ), 
      vsync:    this 
    );

    offsetAnimation = Tween< Offset >(
        begin: const Offset( 1.5, 0.0 ),
        end:   const Offset( 0.0, 0.0 ),
      )
      .animate( 
        CurvedAnimation(
          parent: animationController,
          curve:  Curves.ease,
        )
      );

    animationController.value = 0.0;
    animationController.forward();
  }
  
  @override
  Widget build( BuildContext context ){
    if(bugDataList == null){
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventGetBugList() );
    }
    else{
      body[1] = BugListBody( bugDataList: bugDataList );
    }
 
    return Scaffold(
      body: BlocListener< StateManagerBloc, StateManagerState >(

        listener: ( context, state ) {
          if( state is StateManagerStateAddedBug ){
            bugDataList = state.newList ?? [];
          }
          if( state is StateManagerStatetGetBugList ){
            bugDataList = state.bugList;
          }

          if( state is StateManagerStatetToBugList ){
            bodyIndex = 1;
            animationController.value = 0.0;
            animationController.forward();
          }

          if( state is StateManagerStateToCreateBug ){
            bodyIndex = 0;
            animationController.value = 0.0;
            animationController.forward();
          }

          setState(() {});
        },

        child: Scaffold(
          body: Center(
            child: FormBuilder(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverHeadBar( functionIndex: bodyIndex ),

                  SliverAnimatedList(
                      initialItemCount: 1,
                      itemBuilder:      ( context, index, animation ) => FadeTransition(
                        opacity:        animation,
                        child:          SlideTransition(
                          position: offsetAnimation,
                          child:    body[ bodyIndex ]
                          )
                      )
                  )
                ]
              ),
            ),
          ),
        )

      ),
      bottomNavigationBar: const ButtomNavigator()
    );
  }
}
