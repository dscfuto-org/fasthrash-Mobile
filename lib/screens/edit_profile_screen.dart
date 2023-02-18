import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit_Profile_screen extends StatelessWidget {
  Edit_Profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
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
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(1, 2, 2, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  // padding: const EdgeInsets.all(2),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Edit Account',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                TextButton(
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    //signup screen
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Change Photo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white10,
              alignment: Alignment.topLeft,
              height: 40,
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'PERSONAL INFO',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  )),
            ),
            Expanded(
              child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  children: <Widget>[
                    
                    FormFeilds(labelText: 'First Name'),
                    FormFeilds(labelText: 'Last Name'),
                    FormFeilds(labelText: 'Date of Birth'),
                    FormFeilds(labelText: 'Mobile'),
                    FormFeilds(labelText: 'Home'),
                    FormFeilds(labelText: 'Work'),


                    Container(
                      color: Colors.white10,
                      alignment: Alignment.topLeft,
                      height: 40,
                      child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'ADDRESS',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          )),
                    ),
                    
                    FormFeilds(labelText: 'Street',),
                    FormFeilds(labelText: 'Town'),


                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important_outlined),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class FormFeilds extends StatelessWidget {
  String labelText;
  FormFeilds({
    super.key,
    required this.labelText,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
