import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  int count;
  Widget child;
  bool tabbar;
  Badges({@required this.count, @required this.child, this.tabbar = false});

  Widget number(int number) {
    if (number < 10) {
      return Text(number.toString(), style: TextStyle(color: Colors.white));
    } else {
      if (tabbar) return Text(number > 9 ? "9+":number.toString(), style: TextStyle(color: Colors.white, fontSize: 10));
      return Text(number > 99 ? "99+":number.toString(), style: TextStyle(color: Colors.white, fontSize: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (count != null && count > 0) {
      return Badge(
        badgeColor: Theme.of(context).primaryColor,
        badgeContent: number(count),
        child: child,
      );
    } return child;
  }
}