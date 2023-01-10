import 'package:flutter/material.dart';
import 'package:grofast/Pages/Login%20and%20Register/LoginPage.dart';
import 'package:grofast/Model/TourModel.dart';

import '../HomePage/GeneralPage.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  List<TourModel> data = [
    TourModel(
      image: "images/tour/tour1.png",
      title: "Fresh groceries to your doorstep!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.",
    ),
    TourModel(
      image: "images/tour/tour2.png",
      title: "Shop your daily necessary!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.",
    ),
    TourModel(
      image: "images/tour/tour3.jpg",
      title: "Fast Shipment to your home!",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.",
    ),

  ];
  final PageController _pageController =PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
              onPageChanged: (i) {
                pageIndex = i;
                setState(() {});
              },
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(data[pageIndex].image),
                  ],
                );
              }),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 45,
            left: -130,
            child: Container(
              height: 419,
              width: 633,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(300, 100))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2 + 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                      MediaQuery.of(context).size.width / 2 - 50),
                  child: pageIndex == 0
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color:
                          const Color(0xff4CBB5E).withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color:
                          const Color(0xff4CBB5E).withOpacity(0.5),
                        ),
                      ),
                    ],
                  )
                      : pageIndex == 1
                      ? Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E)
                              .withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E)
                              .withOpacity(0.5),
                        ),
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E)
                              .withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E)
                              .withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 5.29,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(80),
                          color: const Color(0xff4CBB5E),
                        ),
                      ),
                    ],
                  ),),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 65, right: 65, bottom: 19),
                  child: Text(
                    data[pageIndex].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Color(0xff194B38),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 55),
                  child: Text(
                    data[pageIndex].description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff9C9C9C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    pageIndex==2?
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const GeneralPage(name: '',)))
                        : pageIndex+=1;
                    _pageController.animateToPage(pageIndex, duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                    setState(() {
                    });
                  },
                  child: Container(
                    height: 88,
                    width: 172,
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xff2BAF6F),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(colors: [
                            Color(0xff26AD71),
                            Color(0xff32CB4B),
                          ]),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.76,
                              offset: const Offset(0, 1.58),
                              color: const Color(0xff369246)
                                  .withOpacity(0.0585),
                            ),
                            BoxShadow(
                              blurRadius: 10.56,
                              offset: const Offset(0, 7.2),
                              color: const Color(0xff369246)
                                  .withOpacity(0.09),
                            ),
                            BoxShadow(
                              blurRadius: 28.34,
                              offset: const Offset(0, 18.23),
                              color: const Color(0xff369246)
                                  .withOpacity(0.1215),
                            ),
                            BoxShadow(
                              blurRadius: 65,
                              offset: const Offset(0, 36),
                              color: const Color(0xff369246)
                                  .withOpacity(0.18),
                            ),
                          ]),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
