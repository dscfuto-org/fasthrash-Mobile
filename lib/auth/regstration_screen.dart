import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/form_fields.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:fastrash/utils/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 /// TextEditingController locationController = TextEditingController(text: DummyData.address);
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool _obscureText = true;
  RegistrationDto registrationDto = RegistrationDto();
  bool _acceptTermsAndPrivacy = false;

  var isLoading = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "user", child: Text("User")),
      const DropdownMenuItem(
          value: "collector", child: Text("Collector")),
    ];
    return menuItems;
  }

  @override
  void initState() {

    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  // static const String _chosenValue = 'Sign Up as';
  // DashBoardDropDownFormField roleSelect = createDropDownList(role, 'Role', [
  //   ''
  // ]);
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    // const String role = 'Sign Up as';
    // DashBoardDropDownFormField roleSelect = createDropDownList(
    //   role,
    //   'Sign Up as',
    //   const [
    //     'Individual',
    //     'Organization',
    //   ],
    // );

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 10.h),
            forms(),

            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Checkbox(
                  value: _acceptTermsAndPrivacy,
                  onChanged: (value) {
                    setState(() {
                      _acceptTermsAndPrivacy = value!;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'I accept the ',
                    style: const TextStyle(
                      color: Colors.black,
                      // fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          // fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Do something when the link is clicked
                            launchInURL(Uri.parse("https://fastrash.vercel.app/legal/terms-of-use"));
                          },
                      ),
                      const TextSpan(
                        text: ' and.',
                        style: TextStyle(
                          color: Colors.black,
                          //fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          // fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Do something when the link is clicked
                            launchInURL(Uri.parse("https://fastrash.vercel.app/legal/privacy-policy"));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            isLoading
                ? const Center(child: loaderOne)
                :Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _acceptTermsAndPrivacy ? AppColors.green: Colors.white , elevation: 3 ),
                  child: Text('Register', style: TextStyle(color:  _acceptTermsAndPrivacy ? Colors.white: AppColors.grey ),),
                  onPressed: () {
                    _acceptTermsAndPrivacy ? submitRequest() : null;
                  },
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: <Widget>[
                const Text('You have an account?'),
                TextButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    navigatePush(context, const LoginScreen());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

  Future<void> submitRequest() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!formKey.currentState!.validate()) {
    } else {
      registrationDto.firstName = firstNameController.text;
      registrationDto.lastName = lastNameController.text;
      registrationDto.location = DummyData.address;
      registrationDto.email = emailController.text;
      registrationDto.phoneNumber = phoneController.text;
      registrationDto.password = passwordController.text;
      registrationDto.passwordConfirm = passwordConfirmController.text;
      registrationDto.role = selectedValue;

      setState(() {
        isLoading = true;
      });

      try {
        logger.d(registrationDto.toJson());
        await AuthBackend().signUpUser(
          context,
          registrationDto,
        );

        // navigatePush(context, LoginScreen());
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

  Widget _entryField(String title, TextEditingController textEditingController,
      {bool isPassword = false}) {
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
              focusedErrorBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.green, ),
              ) ,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 7.0, color: AppColors.green),
              ),
              suffixIcon: SizedBox(
                height: 17.5,
                width: 17.5,
                child: InkWell(
                  onTap: () {
                    _toggle();
                  },
                  child: isPassword
                      ? _obscureText
                      ? const Icon(
                    Icons.visibility,
                    color: AppColors.grey,
                    size: 17.5,
                  )
                      : const Icon(
                    Icons.visibility_off,
                    color: AppColors.grey,
                    size: 17.5,
                  )
                      : null,
                ),
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


  Widget confirmPasswordField(String title, TextEditingController textEditingController,
      {bool isPassword = false, required String pwd}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          obscureText: isPassword ? _obscureText : false,
          enabled: true,
          validator: (value) {
            if (value!.isEmpty) {
              return fieldRequired;
            }
            if (value != pwd ) {
              return "Password doesn't match";
            }
            return null;
          },
          // onChanged: (value){
          //   updateFormText(value);
          //
          // },
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
                      ? const Icon(
                    Icons.visibility,
                    color: AppColors.grey,
                    size: 17.5,
                  )
                      : const Icon(
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



  forms() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            _entryField('First Name', firstNameController),
            _entryField('Last Name', lastNameController),
            EmailFormField(
                title: 'Email', textEditingController: emailController),
            PhoneFormField(
                title: 'Phone Number', textEditingController: phoneController),
            // _entryField('Location', locationController),
            // _entryField('role', roleController),
            roleDropDown(),
            PasswordFormField(
                title: 'Password', textEditingController: passwordController),
            // PasswordFormField(
            //     title: ,
            //     textEditingController: ),
           // _confrimPasswordField('Confirm Password', passwordConfirmController, isPassword: true),
            confirmPasswordField('Confirm Password', passwordConfirmController, isPassword: true,
            pwd: passwordController.text)

          ],
        ));
  }

  // dropDown() {
  //   return Container(
  //     padding: const EdgeInsets.all(0.0),
  //     child: DropdownButtonHideUnderline(
  //       child: DropdownButton<String>(
  //         value: _chosenValue, //elevation: 5,
  //         icon: Image.asset(
  //           'assets/images/9. Plastic waste in developing countries and the global waste trade.jpeg',
  //           height: 20,
  //           width: 20,
  //         ),
  //         style: const TextStyle(
  //           color: Colors.red,
  //           fontSize: 16,
  //           fontFamily: "Poppins",
  //         ),
  //         items: <String>[
  //           'Approved',
  //           'Pending',
  //           'Failed',
  //           'All',
  //         ].map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(
  //               value,
  //               style: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 16,
  //                 fontFamily: "Poppins",
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //         hint: const Text(
  //           "Sort by",
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 16,
  //               fontFamily: "Poppins",
  //               fontWeight: FontWeight.w600),
  //         ),
  //         onChanged: (String? value) {
  //           setState(() {
  //             _chosenValue = value.toString();
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }  // dropDown() {
  //   return Container(
  //     padding: const EdgeInsets.all(0.0),
  //     child: DropdownButtonHideUnderline(
  //       child: DropdownButton<String>(
  //         value: _chosenValue, //elevation: 5,
  //         icon: Image.asset(
  //           'assets/images/9. Plastic waste in developing countries and the global waste trade.jpeg',
  //           height: 20,
  //           width: 20,
  //         ),
  //         style: const TextStyle(
  //           color: Colors.red,
  //           fontSize: 16,
  //           fontFamily: "Poppins",
  //         ),
  //         items: <String>[
  //           'Approved',
  //           'Pending',
  //           'Failed',
  //           'All',
  //         ].map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(
  //               value,
  //               style: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 16,
  //                 fontFamily: "Poppins",
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //         hint: const Text(
  //           "Sort by",
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 16,
  //               fontFamily: "Poppins",
  //               fontWeight: FontWeight.w600),
  //         ),
  //         onChanged: (String? value) {
  //           setState(() {
  //             _chosenValue = value.toString();
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

  roleDropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return fieldRequired;
            }
            return null;
          },
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(18),
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              focusedBorder: focusedBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.green, width: 0.3),
              ),
              focusedErrorBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.green,),
              ) ,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 7.0, color: AppColors.green),
              ),
              hintText: "Select Role",
              hintStyle: kSubtitleStyle.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              errorStyle:
              kTitleStyle.copyWith(fontSize: 12.0, color: AppColors.red),
              filled: false),

          value: selectedValue,
          items: dropdownItems,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              logger.w(selectedValue);
            });
          }),
    );
  }
}
