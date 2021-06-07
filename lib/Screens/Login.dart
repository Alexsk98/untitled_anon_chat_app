import 'package:anon_chat/Controllers/AuthController.dart';
import 'package:anon_chat/Data/Data.dart';
import 'package:anon_chat/Screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  
  @override
  Widget build(BuildContext context) {
    AuthController _auth = Get.find<AuthController>(); 
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/20),
              Text('Login Here'),
              SizedBox(height: MediaQuery.of(context).size.height/40),

              // Email Input 
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null) {
                    return 'please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'email',
                  hintStyle: TextStyle(color: primaryBlue),
                  fillColor: Colors.grey[200],
                  filled: true, 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ), 
              SizedBox(height: MediaQuery.of(context).size.height/40),
              // Password Input
              TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null) {
                    return 'please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: TextStyle(color: primaryBlue),
                  fillColor: Colors.grey[200],
                  filled: true, 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40),
              Container(
                child: TextButton(
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.lightBlue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print(_auth.user);
                    _auth.login(emailController.value.text, passwordController.value.text);
                  }
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40),
              Container(
                child: TextButton(
                  child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.lightBlue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  }
                ),
              ),
            ],
          ) 
          
        ),
      ),
    );
  }
}