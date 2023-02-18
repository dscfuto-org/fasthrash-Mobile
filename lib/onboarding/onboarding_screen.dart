
import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/auth/regstration_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white70),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView(controller: controller, children: const [

                  Page(
                    id: 1,
                    text1: 'Have Trash? Schedule a Pickup',
                    text2: 'Select a collector of your choice and preferred time of pickup, take a snapshot and confirm pickup ',
                  ),
                  Page(
                      id: 2,
                      text1:
                          'Choose a Trash Collector',
                      text2: 'Many Collectors will be available in your location, Select preferred collector'),
                 Page(id: 3, text1: 'Earn Incentives', text2: 'Earn some incentive for every bottle recycled while keeping the environment in good condition!'),
                ]),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      decoration:const  BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors:  [
                          AppColors.green,
                          AppColors.yellow,
                        ],
                        // transform: GradientRotation(pi/4)
                      )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue
                            ),
                            child: const Text('Register'),
                            onPressed: () => navigatePush(context, const RegistrationScreen()),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue
                            ),
                            child: const Text('Login'),
                            onPressed: () => navigatePush(context, const LoginScreen()),
                          ),
                        ),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           'Singnup with email',
                        //           style: TextStyle(
                        //               fontSize: 15, color: Colors.white),
                        //         ),
                        //       ),
                        //       const Text(
                        //         '/',
                        //         style: TextStyle(
                        //             fontSize: 15, color: Colors.white),
                        //       ),
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           'Social media',
                        //           style: TextStyle(
                        //               fontSize: 15, color: Colors.white),
                        //         ),
                        //       ),
                        //     ])
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int id;
  final String text1, text2;

  const Page({
    super.key,
    required this.id,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  constraints: const BoxConstraints.expand(
                    height: 200,
                  ),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Image.asset('assets/images/onboarding_image$id.png'),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
                      child: Text(
                        text1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      text2, textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
