import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class BugDateLine extends StatefulWidget {
  const BugDateLine({Key? key}) : super(key: key);

  @override
  State<BugDateLine> createState() => _BugDateLineState();
}

class _BugDateLineState extends State<BugDateLine> {
  TextEditingController dateInputController = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    dateInputController.text = "";
  }

  @override
  void dispose() {
    dateInputController.dispose();
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
        name:        "bug_date",
        controller:  dateInputController,
        readOnly:    true,
        validator:   (value) => _validateField( value ),
        cursorColor: Colors.black,

        decoration: const InputDecoration(
          prefix:   SizedBox( width: 10 ),
          hintText: "Bug Date",
          border:   InputBorder.none,
        ),

        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context:     context, 
            initialDate: DateTime.now(),
            firstDate:   DateTime.now(),// - not to allow to choose before today.
            lastDate:    DateTime( 2100 ),

            selectableDayPredicate: ( DateTime date ){
              if( (date.weekday == DateTime.saturday) || (date.weekday == DateTime.sunday) ){
                return false;
              }
              return true;
            },
          );
            
          
          if( pickedDate != null ){
              DateTime nowTime     = DateTime.now();
              DateTime finalTime   = DateTime.utc( pickedDate.year, pickedDate.month,pickedDate.day, nowTime.hour, nowTime.minute, nowTime.second, nowTime.millisecond, nowTime.microsecond );
              String formattedDate = DateFormat( 'yyyy-MM-dd hh:mm' ).format( finalTime ); 
              
              setState( () => dateInputController.text = formattedDate );       
          }
        },
      ),
    );
  }

  String? _validateField( String? value ){
    DateTime selectedData = DateTime.parse(value??"");
    if( value == null || value.isEmpty ){
      return 'Select date';
    } 
    else if((selectedData.hour < 9) || (selectedData.hour > 17)){
      return 'Bug can reported between 09:00-17:00';
    }
    else {
      return null;
    }
  }
}
