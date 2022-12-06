import 'package:due_date/pages/create_bug_page/parts/turnaround_time_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../common/bottom_navigation.dart';

import 'parts/bug_date_line.dart';
import 'parts/calculate_button.dart';
import 'parts/sliver_head_bar.dart';

class CreateBugPage extends StatelessWidget {
  const CreateBugPage({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      body: Center(
        child: FormBuilder(
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverHeadBar(),

              SliverPadding(
                padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      SizedBox( height: 200 ), BugDateLine(),
                      SizedBox( height: 30 ),  TurnaroundTimeLine(),
                      SizedBox( height: 60 ),  CalculateButton(),
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      ),

      bottomNavigationBar: const ButtomNavigator()
    );

  }
}