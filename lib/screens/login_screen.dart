import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/screens/regstration_screen.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              // Container(
              //   alignment: Alignment.topRight,
              //   child: IconButton(
              //     onPressed: () {
              //
              //     },
              //     icon: const Icon(
              //       Icons.cancel,
              //       size: 40,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 80,),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    // Switch(value: false, onChanged: (value) {}),
                    // const Text(
                    //   'Remind me',
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    // const Spacer(),
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                    navigatePush(context, const Dashboard());
                    },
                  )),

              const SizedBox(height: 80,),
              Row(
                children: <Widget>[
                  const Text('Don\'t have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      navigatePush(context, const RegistrationScreen());
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
