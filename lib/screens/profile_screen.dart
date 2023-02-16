import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'My Account',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              TextButton(
                                child: Text(
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
                          const Spacer(),
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                          ),
                          const Spacer(),
                          const Text(
                            'Muhamed Hamiz',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                    color: Colors.white12,
                    alignment: Alignment.topLeft,
                    height: 50,
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'INFORMATION',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        )),
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Name',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                          Text(
                            'Muhamed Hamiz',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Parents Mobile',
                            style:
                            TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                          Text(
                            '08023576109',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Home',
                            style:
                            TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                          Text(
                            '0908373773',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                ],
              ),
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
