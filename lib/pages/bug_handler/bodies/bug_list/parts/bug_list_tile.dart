import 'package:flutter/material.dart';

import '../../../../../db_hive/data_model/data_object.dart';

class BugListTile extends StatelessWidget {
  final BugDataObject bugData;

  const BugListTile({Key? key, required this.bugData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB( 16, 8, 16, 8 ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 24 ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              offset:     const Offset(0, 20),
              color:    Colors.grey.shade200,
            )
          ]
        ),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Bug date:"),
                Text("Turnaround time:"),
                Text("Fix date:"),
              ],
            ),
      
            const Spacer(),

            Column( 
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text( _dateToString( bugData.bugDate ) ),
                Text( "${bugData.turnroundTime} Hours" ),
                Text( _dateToString( bugData.fixDate ) ),
              ]
            )
      
          ],
        ),
      ),
    );
  }
  String _dateToString( DateTime? time ){
    if(time == null) return "";
    return "${time.year}-${time.month}-${time.day}-${time.hour}:${time.minute}";
  }
}
