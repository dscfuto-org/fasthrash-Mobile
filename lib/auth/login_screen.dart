import 'package:fastrash/auth/forgot_password.dart';
import 'package:fastrash/auth/regstration_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/dto/login_dto.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:fastrash/utils/text_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController(text: DummyData.emailAddress);
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  var isLoading = false;
  LoginDto loginDto = LoginDto();

  var _textName;
  void updateFormText(value){
    setState(() {
      _textName = value;
    });
  }

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
              const SizedBox(
                height: 80,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(height: 40),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   child: TextField(
              //     controller: emailController,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'User Name',
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //   child: TextField(
              //     obscureText: true,
              //     controller: passwordController,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Password',
              //     ),
              //   ),
              // ),
              Form(key: _formKey, child: _emailPasswordWidget()),
              TextButton(
                onPressed: () {
                  navigatePush(context, ForgotPasswordScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    // Switch(value: false, onChanged: (value) {}),
                    // const Text(
                    //   'Remind me',
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    // const Spacer(),
                    Text(
                      'Forgot Password?',
                    ),

                    // Text(
                    //   'Forgot Password? is $_textName',
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              isLoading
                  ? const Center(child: loaderOne)
                  :submitButton(),
              const SizedBox(
                height: 80,
              ),
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

  //Control Statement
  Future<void> _submitRequest() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!_formKey.currentState!.validate()) {
    } else {
      loginDto.email = emailController.text;
      loginDto.password = passwordController.text;
      setState(() {
        isLoading = true;
      });

      try {
        logger.d(loginDto.email);
        logger.d(loginDto.password);
        await AuthBackend().login(context, loginDto);
      } catch (e) {
        setState(() {
          isLoading = false;
        });

        rethrow;
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _entryField(String title, TextEditingController textEditingController,
      {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          obscureText: isPassword ? _obscureText : false,
          enabled: true,
          validator: (value) {
            if (value!.isEmpty) {
              return fieldRequired;
            }
            return null;
          },
          onChanged: (value){
           updateFormText(value);

          },
          style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w400, fontSize: 14),
          controller: textEditingController,
          cursorColor: AppColors.green,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(20),
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              focusedBorder: focusedBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.3),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 7.0, color: AppColors.green),
              ),
              hintText: title,
              hintStyle: kSubtitleStyle.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              suffixIcon: SizedBox(
                height: 17.5,
                width: 17.5,
                child: InkWell(
                  onTap: () {
                    _toggle();
                  },
                  child: isPassword
                      ? _obscureText
                          ? Icon(
                              Icons.visibility,
                              color: AppColors.grey,
                              size: 17.5,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: AppColors.grey,
                              size: 17.5,
                            )
                      : null,
                ),
              ),
              // icon: Image.asset("name"),
              //border: InputBorder.none,
              //fillColor: Color(0xfff3f3f4),
              errorStyle:
                  kTitleStyle.copyWith(fontSize: 12.0, color: AppColors.red),
              filled: false)),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email", emailController),
        SizedBox(
          height: 10,
        ),
        _entryField(
          "Password", passwordController,
          isPassword: true,
          //imageIcon: homeIcon
        ),
      ],
    );
  }

  submitButton() {
    return Container(
        height: 60,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            _submitRequest();
          },
        ));
  }
}
