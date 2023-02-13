import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_screen extends StatefulWidget {
  const Onboarding_screen({Key? key}) : super(key: key);

  @override
  _Onboarding_screenState createState() => _Onboarding_screenState();
}

class _Onboarding_screenState extends State<Onboarding_screen> {
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
                flex: 4,
                child: PageView(controller: controller, children: const [
                  Page(
                    id: 1,
                    text1: 'Welcome to edufly School ebooks store',
                    text2: 'Welcome to edufly School ebooks store',
                  ),
                  Page(
                      id: 2,
                      text1:
                          'Find out about your children\'s book with a click',
                      text2: 'Choosing the right books at one place'),
                 Page(id: 3, text1: 'The edufly eBook Store offers you millions', text2: 'Millions of titles across Categories like Children\'s book'),
                ]),
              ),
              Container(
                height: 50,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff2F83D9),
                          Color(0xff00E0AA),
                        ],
                        // transform: GradientRotation(pi/4)
                      )),
                    ),
                    Column(
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
                            child: const Text('Sign Up as a User'),
                            onPressed: () => 0,
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
                            child: const Text('Sign Up as a Collector'),
                            onPressed: () => 0,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Singnup with email',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              const Text(
                                '/',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Social media',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ])
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
                      text2,
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
