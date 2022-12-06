import 'package:due_date/state_machine/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverHeadBar extends StatelessWidget {
  const SliverHeadBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      toolbarHeight:   80,
      expandedHeight:  80,
      collapsedHeight: 80,
      leadingWidth:    0,

      floating:        false,
      pinned:          false,
      //flexibleSpace:  FlexibleSpaceBar(title: SizedBox(width: 180, child: Image.asset("assets/logo.png",color: Colors.black, )), titlePadding: EdgeInsetsDirectional.only(start: 10, bottom: 25) ),
      title:   SizedBox(width: 180, child: Image.asset("assets/logo.png",color: Colors.black, )),
      
      leading: const SizedBox(),

      actions: [

        Padding(
          padding: const EdgeInsets.only(right:10.0),
          child:   IconButton(
            onPressed: () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventBack() ), 
            icon: const Icon( 
              Icons.menu_rounded, 
              color: Colors.black, 
              size:  40
            )
          ),
        )

      ],
    );
  }
}