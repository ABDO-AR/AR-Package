import 'package:flutter/material.dart';

class ARAnimation {
  static Future<dynamic> popPageTransition(
    BuildContext context,
    Widget page,
    int tSeconds,
  ) async {
    return await Navigator.of(context).push(
      PageRouteBuilder(
        /// Duration:
        transitionDuration: Duration(seconds: tSeconds),

        /// AnimationBuilder:
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child,
        ) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticInOut,
          );

          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        },

        /// PageBuilder:
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return page;
        },
      ),
    );
  }
}
