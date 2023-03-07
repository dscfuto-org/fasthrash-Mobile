import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:fastrash/utils/text_fields.dart';
import 'package:flutter/material.dart';

class ResetPasswordEmailScreen extends StatefulWidget {
  const ResetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordEmailScreen> createState() =>
      _ResetPasswordEmailScreenState();
}

class _ResetPasswordEmailScreenState extends State<ResetPasswordEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController =
      TextEditingController(text: DummyData.emailAddress);
  late String email;

  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   'Security',
              //   style: kTitleStyle.copyWith(fontSize: 25),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                    child: Image.asset(
                  'assets/images/forgot.png',
                  width: double.infinity,
                  height: 250,
                )),
              ),

              Center(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Reset Password',
                    style: kTitleStyle.copyWith(fontSize: 23),
                  ),
                )
              ])),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 25.0),
                  child: Text(
                    'Easily reset your account password. Make sure to check your mail',
                    style: kTitleStyle.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: _formKey,
                      child: _entryField('Email', emailController))),
              isLoading
                  ? const Center(child: loaderOne)
                  :submitButton()
            ],
          ),
        ));
  }

  Widget _entryField(String title, TextEditingController textEditingController) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          enabled: true,
          validator: (value) {
            if (value!.isEmpty) {
              return fieldRequired;
            }
            return null;
          },
          style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w400, fontSize: 14),
          controller: textEditingController,
          cursorColor: AppColors.green,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(20),
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              focusedBorder: focusedBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.green, width: 0.3),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 7.0, color: AppColors.green),
              ),
              hintText: title,
              hintStyle: kSubtitleStyle.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              errorStyle:
                  kTitleStyle.copyWith(fontSize: 12.0, color: AppColors.red),
              filled: false)),
    );
  }

  submitButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          child: const Text('Submit'),
          onPressed: () {
            submitRequest();
          },
        ));
  }

  Future<void> submitRequest() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (!_formKey.currentState!.validate()) {

    } else {
      setState(() {isLoading = true;});

      try {
        await AuthBackend().resetPassword(context, emailController.text);
      } catch (e) {
        setState(() {isLoading = false;});

        rethrow;
      }

      setState(() {isLoading = false;});
    }
  }
}
