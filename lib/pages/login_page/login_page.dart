import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'parts/head_widget.dart';
import 'parts/login_button.dart';
import 'parts/mail_data_line.dart';
import 'parts/password_data_line.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      body: Center(
        child: FormBuilder(
          child: ListView(
            children: [
              const HeadWidget(),
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
                child: Column(
                  children: const [
                    SizedBox( height: 100 ), MailDataLine(),
                    SizedBox( height: 30 ), PassWordDataLine(),
                    SizedBox( height: 60 ), LoginButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

} 
