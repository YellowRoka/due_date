import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MailDataLine extends StatelessWidget {
  const MailDataLine({Key? key}) : super(key: key);

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
        name:       "mail",
        validator:  (value) => _validateEmail(value),
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          prefix:   SizedBox( width: 10 ),
          hintText: "Email",
          border:   InputBorder.none,
        )
      ),

    );
  }

  String? _validateEmail( String? value ){
    
    String pattern = 
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = RegExp( pattern );

    if( value == null || value.isEmpty || !regex.hasMatch(value) ){
      return 'Enter a valid email address';
    } 
    else {
      return null;
    }

  }

}
