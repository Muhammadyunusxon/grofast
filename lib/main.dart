import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grofast/Pages/ProductTour/SplashScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'Style/style.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 873),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return RefreshConfiguration(
            headerBuilder: () => const WaterDropMaterialHeader(
              backgroundColor: Style.primaryColor,
            ),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Pinance',
                home: WelcomePage()),
          );
        });
  }
}
