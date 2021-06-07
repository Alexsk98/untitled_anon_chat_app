import 'package:anon_chat/Controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController _auth = Get.find<AuthController>();
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Home Screen'),
              TextButton(child: Text('Sign Out'),
              onPressed: () {
                _auth.signOut();
              })
          ]
          ,)
        ),
      ),
    );
  }
}