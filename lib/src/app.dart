import 'package:flutter/material.dart';
import './screens/login.screen.dart';
import './blocs/provider.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding:
        EdgeInsets.only(left: 15.0, right: 15.0, top: 13.0, bottom: 13.0),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 2.0),
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
  ),
);

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: theme,
        title: 'Log Me in',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
