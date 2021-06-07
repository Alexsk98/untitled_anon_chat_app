import 'package:anon_chat/Controllers/AuthController.dart';
import 'package:anon_chat/Screens/HomeScreen.dart';
import 'package:anon_chat/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class LoginWrapper extends StatefulWidget {
  const LoginWrapper({ Key? key }) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user != null ? HomeScreen() : LoginScreen();
    });
  }
}