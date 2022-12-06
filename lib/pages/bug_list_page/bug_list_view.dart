import 'package:due_date/pages/bug_list_page/parts/bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../db_hive/data_object.dart';
import 'parts/bug_list_tile.dart';
import 'parts/sliver_head_bar.dart';

class BugListPage extends StatelessWidget {
  const BugListPage({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    List<BugDataObject> bugDataList = [
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
      BugDataObject(DateTime.now(),DateTime.now(),DateTime.now()),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverHeadBar(),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              ( context, index ) => BugListTile( bugData: bugDataList[ index ] ),
              childCount: bugDataList.length,
            ),
          ),

        ]
      ),

      bottomNavigationBar: const ButtomNavigator()
    );

  }
}