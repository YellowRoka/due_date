import 'package:flutter/material.dart';

import '../../../../db_hive/data_model/data_object.dart';
import 'parts/bug_list_tile.dart';


class BugListBody extends StatelessWidget {
  final List<BugDataObject>? bugDataList;

  const BugListBody({Key? key, required this.bugDataList}) : super(key: key);


  @override
  Widget build( BuildContext context ){
    final List<BugDataObject> empthyList = [];
/*
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        ( context, index ) => BugListTile( bugData: (bugDataList != null )?(bugDataList![ index ]):(empthyList[index]) ),
        childCount: bugDataList?.length??0,
      ),
    );
*/
    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: ListView.builder(
        itemBuilder: ( context, index ) => BugListTile( bugData: (bugDataList != null )?(bugDataList![ index ]):(empthyList[index]) ),
        itemCount:   bugDataList?.length??0,
      ),
    );
  }
}
