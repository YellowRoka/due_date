import 'package:flutter/material.dart';

import 'parts/bug_date_line.dart';
import 'parts/calculate_button.dart';
import 'parts/turnaround_time_line.dart';


class BugCreateBody extends StatelessWidget {
  const BugCreateBody({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return /*Sliver*/Padding(
      padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
      /*sliver:SliverToBoxAdapter(*/
        child: Column(
          children: const [
            SizedBox( height: 200 ), BugDateLine(),
            SizedBox( height: 30 ),  TurnaroundTimeLine(),
            SizedBox( height: 60 ),  CalculateButton(),
          ],
        ),
      //),
    );
  }
}
