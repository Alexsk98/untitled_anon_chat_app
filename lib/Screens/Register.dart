import 'package:anon_chat/Controllers/AuthController.dart';
import 'package:anon_chat/Data/Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController _auth = Get.find<AuthController>(); 
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/20),
              Text('Register Here'),
              SizedBox(height: MediaQuery.of(context).size.height/40),
              
              // Email Text Box
              TextFormField(
                controller: emailController,
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
              
              // Password Text Box
              TextFormField(
                controller: passwordController,
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
              TextFormField(
                controller: passwordConfirmController,
                decoration: InputDecoration(
                  hintText: 'confirm password',
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
                  child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.lightBlue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if(passwordConfirmController.text == passwordController.text)
                    {
                      AuthController _auth = AuthController();
                      _auth.registerUser(emailController.text, passwordController.text);
                    }
                    else
                    {
                      Get.snackbar('Registeration Error', 'Passwords do not match', snackPosition: SnackPosition.BOTTOM);
                    }
                    
                  }
                ),
              ),
 
            ],
          ),
        ),
      ),
    );
  }
}