import 'package:flutter/cupertino.dart';

class SizeTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  SizeTransitionRoute(this.widget)
      : super(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
        );
}
