import 'package:due_date/db_hive/data_object.dart';
import 'package:flutter/material.dart';

import '../pages/bug_list_page/bug_list_view.dart';
import '../pages/create_bug_page/create_bug_page.dart';

PageRouteBuilder<dynamic> animatedRouteToMain( RouteSettings settings ){
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => Container(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){
      const begin = Offset(1.0, 0.0);
      const end   = Offset.zero;
      const curve = Curves.easeIn;
      var tween   = Tween( begin: begin, end: end ).chain( CurveTween( curve: curve ) );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  
  );
}

PageRouteBuilder<dynamic> animatedRouteToBugList( RouteSettings settings ){
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const BugListPage(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){
      const begin = Offset(1.0, 0.0);
      const end   = Offset.zero;
      const curve = Curves.easeIn;
      var tween   = Tween( begin: begin, end: end ).chain( CurveTween( curve: curve ) );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  
  );
}

PageRouteBuilder<dynamic> animatedRouteToCreateReport( RouteSettings settings ){
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const CreateBugPage(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){
      const begin = Offset(1.0, 0.0);
      const end   = Offset.zero;
      const curve = Curves.easeIn;
      var tween   = Tween( begin: begin, end: end ).chain( CurveTween( curve: curve ) );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  
  );
}
