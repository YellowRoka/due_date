import 'package:flutter/material.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical( top:Radius.circular(48), bottom:Radius.circular(24) ),
      child: Container(
        padding:   const EdgeInsets.fromLTRB( 26, 0, 0, 26 ),
        alignment: Alignment.bottomLeft,
        color:   const Color.fromARGB(255, 148, 136, 250),
        height:    250,
        child:     const Text( "Login", style: TextStyle( color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1, fontFamily: "Calibri Light" ) ),
      )
    );
  }
}
