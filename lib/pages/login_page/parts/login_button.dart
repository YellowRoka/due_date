import 'package:due_date/state_machine/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Builder(
      builder: ( context ) => GestureDetector(
        onTap: (){
          var form = FormBuilder.of( context )!;

          if( form.saveAndValidate() ){
              String mail = form.value[ 'mail' ];
              String pass = form.value[ 'pass' ];

              BlocProvider.of<StateManagerBloc>( context ).add( StateManagerEventLoginRQ( mail, pass ) );
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
            child: Text( 'Login', style: TextStyle( color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 2, fontFamily: "Calibri Light" ) ) 
          ),

        ),

      ),
    );
  }
}
