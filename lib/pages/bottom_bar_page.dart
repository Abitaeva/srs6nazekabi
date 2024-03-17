import 'package:flutter/material.dart';
import 'package:srs5/pages/homepage.dart';
import 'package:srs5/pages/language_selection_page.dart';
import 'package:srs5/pages/likepage.dart';
import 'package:srs5/pages/profilepage.dart';
import 'package:srs5/ui/pages/newspage.dart';



class BottomBarPage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  BottomBarPage({required this.name, required this.email, required this.phoneNumber});

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isAuthenticated ? BottomBarPage(name: '', email: '', phoneNumber: '') : LanguageSelectionPage(),
    );
  }
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar'),
        backgroundColor: Colors.pink,
      ),
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home', backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label: 'Likepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Colors.black),
            label: 'NewsPage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'ProfilePage',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SecondPage();
      case 2:
        return ThirdPage();
      case 3:
        return UserInfoPage();
      default:
        return Container();
    }
  }
}
