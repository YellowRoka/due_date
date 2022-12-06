import 'package:due_date/state_machine/state_manager_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'db_hive/hive_control.dart';
import 'dynamic_routes/routes.dart';
import 'firebase/config.dart';
import 'pages/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.firebaseConfigWeb );
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider( create: (context) => StateManagerBloc()..add( const StateManagerEventInit() ) ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
    
        onGenerateRoute: ( settings ){
          if( settings.name?.startsWith( '/bugs_list_page' )?? false ){
            return animatedRouteToBugList( settings );
          }
    
          if( settings.name?.startsWith( '/add_bug_page' )?? false ){
            return animatedRouteToCreateReport( settings );
          }
    
          return null;
        },
        
        /*
        routes: {
          '/login_page': (context) => const LoginPage(),
        },
        */
    
        title: 'Due Date',
        home: Scaffold(
          body: BlocListener<StateManagerBloc, StateManagerState>(
            listener: ( context, state ){
              if( state is StateManagerStatetToBugList ){
                Navigator.pushNamed( context, '/bugs_list_page' );
              }
            
              if( state is StateManagerStatetLoginFailed ){
                const snackBar = SnackBar( content: Text('wrong data! Maybe are you a new user?') );
                ScaffoldMessenger.of( context ).showSnackBar( snackBar );
              }
            
              if( state is StateManagerStateToCreateBug ){
                Navigator.pushNamed( context, '/add_bug_page' );
              }
            
              if( state is StateManagerStateBacked ){
                Navigator.pop(context);
              }
            
            },
            child: const LoginPage()
          ),
        ),
      ),
    );
  }

}
