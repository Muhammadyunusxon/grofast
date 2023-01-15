import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Components/state_widget.dart';
import 'package:grofast/Pages/HomePage/GeneralPage.dart';


void main() {
  runApp(const MainPage());
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 8126),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  StateWidget(
            child: Builder(
              builder: (context) {
                return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'GroFast',
                      home: GeneralPage());
              }
            ),
          );
        });
  }
}
