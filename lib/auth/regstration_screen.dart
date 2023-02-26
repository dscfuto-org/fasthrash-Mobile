import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/dropdown_widget.dart';
import 'package:fastrash/utils/form_fields.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:fastrash/utils/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:fastrash/utils/get_widgets.dart';

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

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with DashBoardWidgets {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool _obscureText = true;
  RegistrationDto registrationDto = RegistrationDto();
  var isLoading = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "user", child: Text("User")),
      const DropdownMenuItem(
          value: "collector", child: Text("Collector")),
    ];
    return menuItems;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  static String _chosenValue = 'Sign Up as';
  // DashBoardDropDownFormField roleSelect = createDropDownList(role, 'Role', [
  //   ''
  // ]);
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    const String role = 'Sign Up as';
    DashBoardDropDownFormField roleSelect = createDropDownList(
      role,
      'Sign Up as',
      const [
        'Individual',
        'Organization',
      ],
    );

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 20),
            forms(),
            const SizedBox(
              height: 30,
            ),
            isLoading
                ? const Center(child: loaderOne)
                :Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    submitRequest();
                  },
                )),
            const SizedBox(
              height: 80,
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
      registrationDto.location = locationController.text;
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
              contentPadding: EdgeInsets.all(20),
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


  Widget _confrimPasswordField(String title, TextEditingController textEditingController,
      {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          enabled: true,
          validator: (value) {
            if (value!.isEmpty) {
              return fieldRequired;
            }else if(passwordController.text != passwordConfirmController.text){
              return 'Password Does Not Match';
            }
            return null;
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
            _entryField('Location', locationController),
            // _entryField('role', roleController),
            roleDropDown(),
            PasswordFormField(
                title: 'Password', textEditingController: passwordController),
            // PasswordFormField(
            //     title: ,
            //     textEditingController: ),
            _confrimPasswordField('Confirm Password', passwordConfirmController, isPassword: true)

          ],
        ));
  }

  dropDwon() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _chosenValue, //elevation: 5,
          icon: Image.asset(
            'assets/images/9. Plastic waste in developing countries and the global waste trade.jpeg',
            height: 20,
            width: 20,
          ),
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontFamily: "Poppins",
          ),
          items: <String>[
            'Approved',
            'Pending',
            'Failed',
            'All',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              ),
            );
          }).toList(),
          hint: const Text(
            "Sort by",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
          onChanged: (String? value) {
            setState(() {
              _chosenValue = value.toString();
            });
          },
        ),
      ),
    );
  }

  roleDropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return fieldRequired;
            }
          },
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(18),
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
              print(selectedValue);
            });
          }),
    );
  }
}
