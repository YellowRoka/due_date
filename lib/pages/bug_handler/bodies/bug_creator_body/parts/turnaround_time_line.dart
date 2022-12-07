import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TurnaroundTimeLine extends StatefulWidget {
  const TurnaroundTimeLine({Key? key}) : super(key: key);

  @override
  State<TurnaroundTimeLine> createState() => _TurnaroundTimeLineState();
}

class _TurnaroundTimeLineState extends State<TurnaroundTimeLine> {
  TextEditingController textInputController = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    textInputController.text = "";
  }

  @override
  void dispose() {
    textInputController.dispose();
    super.dispose();
  }

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
        name:       "turn_time",
        controller: textInputController,
        validator:  (value) => _validateField(value),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefix:   SizedBox( width: 10 ),
          hintText: "Turnaround Time",
          border:   InputBorder.none,
        )
      ),

    );
  }

  String? _validateField( String? value ){
    if( value == null || value.isEmpty ){
      return 'Enter number';
    } 
    else {
      return null;
    }
  }
}
