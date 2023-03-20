//This manages our routing
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///This method ensures navigation and kills the previous activity
//  navigateReplace(BuildContext context, Widget widget) {
//   Navigator.pushReplacement(
//       context, CupertinoPageRoute(builder: (context) => widget));
// }


navigateReplace(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, FadeRoute(page: widget));
}


///This method ensures navigation and does not kill the previous activity
navigatePush(BuildContext context, Widget widget) {

  Navigator.push(context, FadeRoute(page: widget));
}

///This method backward navigation
navigateBack(BuildContext context) { Navigator.pop(context); }


class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRoute({required this.page})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}



launchInURL(Uri testUrl) async {
  if (await canLaunchUrl(testUrl)) {
    await launchUrl(
        testUrl,
        mode: LaunchMode.externalApplication
    );
  } else {
    throw 'Could not launch $testUrl';
  }
}
