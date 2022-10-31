import 'package:clothes_app/users/UserPreferences/user_preferences.dart';
import 'package:clothes_app/users/authentication/login_screen.dart';
import 'package:clothes_app/users/fragments/dashboard_of_fragments.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clothes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(), //to remember user info

          builder: (context, dataSnapShot) {

          if(dataSnapShot.data == null){
            return LoginScreen();
          }else{
            return DashboardOfFragments();
          }

      }),
    );
  }
}
