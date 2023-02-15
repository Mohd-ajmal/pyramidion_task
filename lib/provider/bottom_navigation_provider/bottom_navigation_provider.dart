import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/home_provider/home_provider.dart';
import 'package:flutter_application_1/provider/upload_provider/upload_provider.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/upload_song/upload_song.dart';
import 'package:provider/provider.dart';

class BottomNavigationProvider extends ChangeNotifier {
  // ---------------------------------------------------- Getters -----------------------------------------------------------------

  int get currentIndex => _currentindex;
  List<Widget> get tabs => _tabs;
  List<BottomNavigationBarItem> get bottomTabs => _bottomTabs;

  // ----------------------------------------------------- Variables ---------------------------------------------------------------

  int _currentindex = 0;
  final List<Widget> _tabs = [
    ChangeNotifierProvider(
        create: (BuildContext context) => HomeProvider(), child: const HomeScreen()),
    ChangeNotifierProvider(
        create: (BuildContext context) => UploadProvider(),
        child: const UploadScreen())
  ];
  final _bottomTabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favourite",
    ),
  ];

  // ---------------------------------------------------- Functionality -----------------------------------------------------------

  screenBody() {
    switch (_currentindex) {
      case 0:
        return ChangeNotifierProvider(
            create: (BuildContext context) => HomeProvider(),
            child: const HomeScreen());
      case 1:
       return ChangeNotifierProvider(
        create: (BuildContext context) => UploadProvider(),
        child: const UploadScreen());
      default:
    }
  }

  onTabChange({required index}) {
    _currentindex = index;
    notifyListeners();
  }
}
