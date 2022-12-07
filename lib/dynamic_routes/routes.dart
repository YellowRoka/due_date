import 'package:flutter/material.dart';

import '../pages/bug_handler/bug_handler_page.dart';

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

PageRouteBuilder<dynamic> animatedRouteToBugHandlerPage( RouteSettings settings ){
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const BugHandlerPage(),
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
