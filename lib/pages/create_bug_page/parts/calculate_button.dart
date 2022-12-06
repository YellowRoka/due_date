import 'package:due_date/state_machine/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Builder(
      builder: ( context ) => GestureDetector(
        onTap: (){
          var form = FormBuilder.of( context )!;

          if( form.saveAndValidate() ){
              DateTime bugDate  = DateTime.parse(form.value[ 'bug_date' ]);
              int      turnTime = int.parse(form.value[ 'turn_time' ]);

              BlocProvider.of<StateManagerBloc>( context ).add( StateManagerEventAddBug( bugDate: bugDate, turnTime: turnTime ) );
          }
        },

        child: Container(
          height: 40,
          width:  double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:  Alignment.centerLeft,
              end:    Alignment.centerRight,
              colors: [
                Colors.pink.shade200,
                Colors.pink.shade200,
                Colors.orange.shade300,
              ],
            ),
            borderRadius: BorderRadius.circular( 12 ),
          ),
          child: const Center(
            child: Text( 'Calculate', style: TextStyle( color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 2, fontFamily: "Calibri Light" ) ) 
          ),

        ),

      ),
    );
  }
}
