import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/utils/password_strength/procedure.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EmailFormField extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;
  const EmailFormField(
      {super.key, required this.title, required this.textEditingController});

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  bool isEmailCorrect = true;
  bool isChecked = false;
  var regExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
  bool regEmailValue(String val) {
    var regExp1 = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (regExp1.hasMatch(val)) {
      setState(() {
        isChecked = true;
      });
      return true;
    } else {
      setState(() {
        isChecked = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: AppColors.green),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                enabled: true,

                onChanged: (val) {
                  setState(() {
                    isEmailCorrect = regEmailValue(val);
                  });
                },
                validator: (value) {
                  if (
                      //value!.isEmpty
                      !isEmailCorrect) {
                    return 'Invalid Email format';
                  } else if (value!.isEmpty) {
                    return "fieldRequired";
                  } else {
                    return null;
                  }
                },
                style: kSubtitleStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 14),
                controller: widget.textEditingController,
                cursorColor: AppColors.grey,
                decoration: InputDecoration(


                    enabled: true,
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: isEmailCorrect == false
                                ? AppColors.red
                                : AppColors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isEmailCorrect == false
                              ? AppColors.red
                              : AppColors.green,
                          width: 0.3),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 7.0,
                          color: isEmailCorrect == false
                              ? AppColors.red
                              : AppColors.dark),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isEmailCorrect == false
                                ? AppColors.red
                                : AppColors.green)),
                    hintText: widget.title,
                    hintStyle: kSubtitleStyle.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    // icon: Image(
                    //   image: AssetImage(image),
                    //   width: deviceW / 20,
                    //   height: deviceH / 20,
                    // ),

                    // icon: Image.asset("name"),
                    //border: InputBorder.none,
                    errorStyle: kTitleStyle.copyWith(
                        fontSize: 12.0, color: AppColors.red),
                    filled: false)),
          )
        ],
      ),
    );
  }
}

class PhoneFormField extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;

  const PhoneFormField(
      {super.key, required this.title, required this.textEditingController});

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {
  bool isValidState = true;
  bool isChecked = false;
  bool isEmptyField = false;
  bool onError = false;

  var regExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
  bool regPhoneValue(String val) {
    var regExp1 = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
    if (regExp1.hasMatch(val)) {
      setState(() {
        isChecked = true;
      });
      return true;
    } else {
      setState(() {
        isChecked = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: AppColors.dark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                enabled: true,
                keyboardType: TextInputType.phone,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(phoneNumber)
                // ], // Only numbers can be entered
                onChanged: (val) {
                  setState(() {
                    isValidState = regPhoneValue(val);
                  });
                },
                validator: (value) {
                  if (
                      //value!.isEmpty
                      !isValidState) {
                    return 'Invalid Phone Number format';
                  } else if (value!.isEmpty) {
                    return fieldRequired;
                  } else {
                    return null;
                  }
                },
                // onChanged: (val) {
                //   setState(() {
                //     isValidState = regPhoneValue(val);
                //   });
                // },
                // // validator: (value) {
                // //   if (value!.isEmpty) {
                // //     return fieldRequired;
                // //   }
                // //   return null;
                // // },
                // validator: (value) {
                //   setState(() {
                //     onError = false;
                //   });
                //   if (
                //       //!regExp.hasMatch(value!)
                //       !isValidState) {
                //     setState(() {
                //       onError = true;
                //     });

                //     return 'Invalid Phone Format';
                //   }
                //   return fieldRequired;
                // },
                style: kSubtitleStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 14),
                controller: widget.textEditingController,
                cursorColor: AppColors.dark,
                decoration: InputDecoration(
                    enabled: true,
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: isValidState == false
                                ? AppColors.red
                                : AppColors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isValidState == false
                              ? AppColors.red
                              : AppColors.green,
                          width: 0.3),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 7.0,
                          color: isValidState == false
                              ? AppColors.red
                              : AppColors.green),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isValidState == false
                                ? AppColors.red
                                : AppColors.green)),
                    hintText: widget.title,
                    hintStyle: kSubtitleStyle.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    errorStyle: kTitleStyle.copyWith(
                        fontSize: 12.0, color: AppColors.red),
                    filled: false)),
          )
        ],
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final Color unselectedColor;
  final String title;
  final TextEditingController textEditingController;
  final LinearGradient weakGradient, fairGradient, strongGradient;
  const PasswordFormField({
    super.key,
    required this.title,
    required this.textEditingController,
    this.weakGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xffff3346),
          const Color(0xFFFFCDD2),
        ]),
    this.fairGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xFFFFCDD2),
          const Color(0xfffff633),
        ]),
    this.strongGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xFFFFCDD2),
          const Color(0xfffff633),
          const Color(0xff39ff33),
        ]),
    this.unselectedColor = const Color(0xFFD6D6D6),
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;
  bool isPassword = true;
  bool isValidState = true;
  String check = "weak";
  var regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  void passwordToggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  bool regValue(String val) {
    var regExp1 =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (regExp1.hasMatch(val)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    return Theme(
      data: ThemeData(primaryColor: AppColors.dark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                enabled: true,
                obscureText: isPassword ? obscureText : false,
                onChanged: (val) {
                  setState(() {
                    isValidState = regValue(val);
                    check = strengthPassword(val);
                  });
                },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return fieldRequired;
                //   }
                //   return null;
                // },

                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (!regExp.hasMatch(value)) {
                      return "Password should have at least one upper and lower case letter, one symbol @, #, % etc and number";
                    } else {
                      return null;
                    }
                  } else {
                    setState(() {
                      isValidState = true;
                    });
                  }
                  return fieldRequired;
                },
                style: kSubtitleStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 14),
                controller: widget.textEditingController,
                cursorColor: AppColors.dark,
                decoration: InputDecoration(
                    enabled: true,
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: isValidState == false
                                ? AppColors.red
                                : AppColors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green, width: 0.3),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 7.0, color: AppColors.green),
                    ),
                    focusedErrorBorder: OutlineInputBorder(

                        //borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: isValidState == false
                                ? AppColors.red
                                : AppColors.green)),
                    //fillColor: Color(0xfff3f3f4),

                    hintText: widget.title,
                    hintStyle: kSubtitleStyle.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    // icon: Image(
                    //   image: AssetImage(image),
                    //   width: deviceW / 20,
                    //   height: deviceH / 20,
                    // ),
                    suffixIcon: SizedBox(
                      height: 17.5,
                      width: 17.5,
                      child: InkWell(
                        onTap: () {
                          passwordToggle();
                        },
                        child: isPassword
                            ? obscureText
                                ? Icon(
                                    Icons.visibility,
                                    color: AppColors.dark,
                                    size: 17.5,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: AppColors.dark,
                                    size: 17.5,
                                  )
                            : null,
                      ),
                    ),
                    // icon: Image.asset("name"),
                    //border: InputBorder.none,
                    //fillColor: Color(0xfff3f3f4),
                    errorStyle: kTitleStyle.copyWith(
                        fontSize: 10.0, color: AppColors.red),
                    filled: false)),
          ),
          SizedBox(
            /// height: widget.spacebetween,
            height: 10,
          ),
          SizedBox(
            width: deviceW,
            child: Visibility(
              visible:
                  widget.textEditingController.text.length != 0 ? true : false,
              child: StepProgressIndicator(
                totalSteps: 9,
                currentStep: check == "weak"
                    ? 3
                    : check == "fair"
                        ? 6
                        : 9,
                // size: widget.spacebetween,
                size: 10,
                selectedGradientColor: check == "weak"
                    ? widget.weakGradient
                    : check == "fair"
                        ? widget.fairGradient
                        : widget.strongGradient,
                unselectedColor: widget.unselectedColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
