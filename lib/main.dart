import 'package:app1only/screen/forget.dart';
import 'package:app1only/screen/listview.dart';
import 'package:app1only/screen/splashscreen.dart';
import 'package:app1only/screen/loginpage.dart';
import 'package:app1only/screen/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen', //'splashscreen'
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'login': (context) => LoginForm(),
        'register': (context) => Register(),
        'forget': (context) => ForgetPass(),
        'listview': (context) => ListViewBuilder()
      }));
}
