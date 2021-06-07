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

  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _passwordConfirmKey = GlobalKey<FormState>();
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
                key: _emailKey, 
                controller: emailController,
                validator: (value) {
                  if (value == null) {
                    return 'please enter your email';
                  }
                  else if (value.length < 5)
                  {
                    return 'email too short';
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
              
              // Password Text Box
              TextFormField(
                key: _passwordKey, 
                controller: passwordController,
                validator: (value) {
                  if (passwordController.value.text == null) {
                    return 'please enter your password';
                  }
                  else if (passwordController.value.text != passwordConfirmController.value.text){
                    return 'passwords do not match';
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
              TextFormField(
                key: _passwordConfirmKey, 
                controller: passwordConfirmController,
                validator: (value) {
                  if (passwordConfirmController.value.text == null) {
                    return 'please confirm your password';
                  }
                  else if(passwordConfirmController.value.text != passwordController.value.text){
                    return 'passwords do not match';
                  }
                  return null;
                },
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
                    // if(_emailKey.currentState!.validate() && _passwordKey.currentState!.validate() && _passwordConfirmKey.currentState!.validate())
                    // {
                    //   AuthController _auth = AuthController();
                    //   _auth.registerUser(emailController.text, passwordController.text);
                    // }
                    _auth.registerUser(emailController.text, passwordController.text);
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