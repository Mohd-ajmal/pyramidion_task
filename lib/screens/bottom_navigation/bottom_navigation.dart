import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context,listen: true);
    return 
      Scaffold(
        appBar: AppBar(
          title: const Text("Task"),
          backgroundColor: Colors.red,
        ),
        body: provider.screenBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          items: provider.bottomTabs,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          onTap: (index){
            provider.onTabChange(index: index);
          },
        ), 
      );
  }
}