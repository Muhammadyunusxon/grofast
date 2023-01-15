import 'package:flutter/material.dart';

import '../store/LocalStore.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  List<int> favourites = [];

  void addId(int id) async {
    await LocalStore.setLikes(id);
    setState(() => favourites.add(id));
  }
  void removeId(int id) async {
    await LocalStore.removeLikes(id);
    setState(() =>  favourites.removeWhere((element) => element == id));
  }
  void addAll() async {
    favourites= await LocalStore.getLikes();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      child: widget.child,
      favourites: favourites,
      stateWidget: this,
    );
  }
}

// ignore: must_be_immutable
class StateInheritedWidget extends InheritedWidget {
  List<int> favourites = [];
  final _StateWidgetState stateWidget;

  StateInheritedWidget(
      {Key? key,
      required Widget child,
      required this.favourites,
      required this.stateWidget})
      : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!.stateWidget;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return oldWidget.favourites != favourites;
  }
}
