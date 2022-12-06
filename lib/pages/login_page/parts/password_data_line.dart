import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class PassWordDataLine extends StatelessWidget {
  const PassWordDataLine({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 12 ),
        color:      Colors.white,
        boxShadow: [
          BoxShadow(
            color:    Colors.grey.shade300,
            blurStyle:  BlurStyle.normal,
            offset:     const Offset( 0, 10 ),
            blurRadius: 20
          )
        ]
      ),

      child: FormBuilderTextField(
        name:      "pass",
        validator: ( value ){
          if( value == null || value.isEmpty ){
            return 'Please fill it';
          }
          return null;
        },

        obscureText:        true,
        //obscuringCharacter: "*",
        cursorColor:      Colors.black,
        decoration:         const InputDecoration(
          prefix:   SizedBox( width: 10 ),
          hintText: "Password",
          border:   InputBorder.none,
        )
      ),

    );
  }
}
