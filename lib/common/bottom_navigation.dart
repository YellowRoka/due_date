import 'package:flutter/material.dart';

class ButtomNavigator extends StatefulWidget {
  const ButtomNavigator({Key? key}) : super(key: key);

  @override
  State<ButtomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0,-20),
            color: Colors.grey.shade200
          )
        ]
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (value) =>setState(() => currentIndex = value ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.add_alert_outlined, color: Colors.black,),
            icon: Icon(Icons.add_alert_outlined,  color: Colors.grey.shade200 ),
            label: ""
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.home_outlined, color: Colors.black,),
            icon: Icon(Icons.home_outlined,  color: Colors.grey.shade200 ),
            label: ""
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.account_circle_outlined, color: Colors.black,),
            icon: Icon(Icons.account_circle_outlined,  color: Colors.grey.shade200 ),
            label: ""
          ),
        ],
      ),
    );
  }
}