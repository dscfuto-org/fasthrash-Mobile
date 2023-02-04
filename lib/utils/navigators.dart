//This manages our routing
import 'package:flutter/cupertino.dart';

///This method ensures navigation and kills the previous activity
navigateReplace(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => widget));
}

///This method ensures navigation and does not kill the previous activity
navigatePush(BuildContext context, Widget widget) {

  Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
}

///This method backward navigation
navigateBack(BuildContext context) { Navigator.pop(context); }
