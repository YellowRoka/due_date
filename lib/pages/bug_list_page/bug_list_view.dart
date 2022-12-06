import 'package:due_date/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../db_hive/data_object.dart';
import '../../state_machine/state_manager_bloc.dart';
import 'parts/bug_list_tile.dart';
import 'parts/sliver_head_bar.dart';

class BugListPage extends StatefulWidget {
  const BugListPage({Key? key}) : super(key: key);

  @override
  State<BugListPage> createState() => _BugListPageState();
}

class _BugListPageState extends State<BugListPage> {
  List<BugDataObject>? bugDataList = null;
  List<BugDataObject> empthyList = [];

  @override
  Widget build( BuildContext context ){
    if(bugDataList == null){
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventGetBugList() );
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
          setState(() {});
        },

        child: CustomScrollView(
          slivers: <Widget>[
            const SliverHeadBar(),
  
            SliverList(
              delegate: SliverChildBuilderDelegate(
                ( context, index ) => BugListTile( bugData: (bugDataList != null )?(bugDataList![ index ]):(empthyList[index]) ),
                childCount: bugDataList?.length??0,
              ),
            ),
  
          ]
        )
      ),
      bottomNavigationBar: const ButtomNavigator()
    );
  }
}
