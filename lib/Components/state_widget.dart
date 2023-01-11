import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyInheritedWidget extends InheritedWidget {
   MyInheritedWidget(
      {Key? key, required this.child, required this.favourites})
      : super(key: key, child: child);

  @override
  // ignore: overridden_fields
  final Widget child;
  late  List<int> favourites=[];

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}
