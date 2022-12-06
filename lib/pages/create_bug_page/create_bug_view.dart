import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../db_hive/data_object.dart';
import '../bug_list_page/parts/bottom_navigation.dart';
import '../bug_list_page/parts/sliver_head_bar.dart';

class CreateBugPage extends StatelessWidget {
  const CreateBugPage({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    List<BugDataObject> bugDataList = [];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverHeadBar(),

          //InputBugDate(),
          //InputTurnAroundTime(),
          //const SizedBox(height:10)
          //CalculateButton()



        ]
      ),

      bottomNavigationBar: ButtomNavigator()
    );

  }
}