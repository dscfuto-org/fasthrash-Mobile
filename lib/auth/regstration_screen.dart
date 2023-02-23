import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/dropdown_widget.dart';
import 'package:fastrash/utils/navigators.dart';
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  RegistrationDto registrationDto = RegistrationDto();

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
              height: 80,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    navigatePush(context, const LoginScreen());
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
      registrationDto.role = roleController.text;

      setState(() {
        //isLoading = true;
      });

      try {
        logger.d(registrationDto.toJson());
        await AuthBackend().signUpUser(context, registrationDto);

        ///navigatePush(context, LoginScreen());
      } catch (e) {
        setState(() {
          //isLoading = false;
        });

        rethrow;
      }

      setState(() {
        //isLoading = false;
      });
    }
  }
}
