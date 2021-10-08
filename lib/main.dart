import 'package:calcu_app/Screens/launch_screen.dart';
import 'package:calcu_app/pages/home_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/home_page': (context) => HomePage(),

      },
    );
  }
}