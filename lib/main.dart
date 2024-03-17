import 'package:flutter/material.dart';
import 'package:srs5/pages/bottom_bar_page.dart';
import 'package:srs5/pages/language_selection_page.dart';
import 'package:srs5/pages/homepage.dart'; // Импортируем вашу страницу аутентифицированных пользователей
import 'package:srs5/service/shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init().then((_) {
    bool isAuthenticated = SharedPreferenceHelper.isAuthenticated();
    runApp(MyApp(isAuthenticated: isAuthenticated));
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selection',
      home: isAuthenticated ? BottomBarPage(name: 'Nazyken', email: 'anazyken@gmail.com', phoneNumber: '87478424543') : LanguageSelectionPage() ,
    );
  }
}
