import 'package:flutter/material.dart';
import 'package:grofast/Pages/HomePage/Products_list_Page.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import '../../Components/state_widget.dart';



class GeneralPage extends StatefulWidget {

  const GeneralPage({Key? key}) : super(key: key);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int barIndex=0;
  List<IndexedStackChild> listOfPage =[
  IndexedStackChild(child: ProductListPage()),
  IndexedStackChild(child: Container()),
  IndexedStackChild(child: Container()),
  IndexedStackChild(child: Container()),
  IndexedStackChild(child: Container()),
  ];
  List<int> isClicked = [1, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      favourites: [],
      child: Scaffold(
        backgroundColor: Colors.grey,
        body:  ProsteIndexedStack(
          index: barIndex,
          children: listOfPage,
        ),
        bottomNavigationBar:Container(
          height: 80,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  height: 80,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 15,
                left: -5,
                right: -5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isClicked.length; i++) {
                          if (isClicked[i] == 1) {
                            isClicked[i] = 0;
                          }
                        }
                        barIndex=0;
                        isClicked[0] = 1;
                        setState(() {});
                      },
                      child: isClicked[0] == 1
                          ? Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            child: Container(
                              margin: const EdgeInsets.only(left: 18),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 9,
                                      left: 25,
                                      right: 10,
                                      top: 10),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1.58),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.0585),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 7.2),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.09),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 18.23),
                                        blurRadius: 28.34,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.1215),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.green.shade600,
                                          Colors.green.shade400,
                                        ]),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              bottom: 15, left: 10, right: 10, top: 10),
                          child: Icon(
                            Icons.home,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isClicked.length; i++) {
                          if (isClicked[i] == 1) {
                            isClicked[i] = 0;
                          }
                        }
                        barIndex=1;
                        isClicked[1] = 1;
                        setState(() {});
                      },
                      child: isClicked[1] == 1
                          ? Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            child: Container(
                              margin: const EdgeInsets.only(left: 18),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 9,
                                      left: 25,
                                      right: 10,
                                      top: 10),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1.58),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.0585),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 7.2),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.09),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 18.23),
                                        blurRadius: 28.34,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.1215),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.green.shade600,
                                          Colors.green.shade400,
                                        ]),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              bottom: 15, left: 10, right: 10, top: 10),
                          child: Icon(
                            Icons.message,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isClicked.length; i++) {
                          if (isClicked[i] == 1) {
                            isClicked[i] = 0;
                          }
                        }
                        barIndex=2;
                        isClicked[2] = 1;

                        setState(() {});
                      },
                      child: isClicked[2] == 1
                          ? Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            child: Container(
                              margin: const EdgeInsets.only(left: 18),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 9,
                                      left: 25,
                                      right: 10,
                                      top: 10),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1.58),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.0585),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 7.2),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.09),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 18.23),
                                        blurRadius: 28.34,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.1215),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.green.shade600,
                                          Colors.green.shade400,
                                        ]),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              bottom: 15, left: 10, right: 10, top: 10),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isClicked.length; i++) {
                          if (isClicked[i] == 1) {
                            isClicked[i] = 0;
                          }
                        }
                        barIndex=3;
                        isClicked[3] = 1;
                        setState(() {});
                      },
                      child: isClicked[3] == 1
                          ? Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            child: Container(
                              margin: const EdgeInsets.only(left: 18),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 9,
                                      left: 25,
                                      right: 10,
                                      top: 10),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1.58),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.0585),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 7.2),
                                        blurRadius: 3.76,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.09),
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 18.23),
                                        blurRadius: 28.34,
                                        color: const Color(0xff369246)
                                            .withOpacity(0.1215),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.green.shade600,
                                          Colors.green.shade400,
                                        ]),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              bottom: 15, left: 10, right: 10, top: 10),
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isClicked.length; i++) {
                          if (isClicked[i] == 1) {
                            isClicked[i] = 0;
                          }
                        }
                        barIndex=4;
                        isClicked[4] = 1;
                        setState(() {});
                      },
                      child: isClicked[4] == 1
                          ? Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            child: Container(
                              margin: const EdgeInsets.only(left: 18),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 9, left: 25, right: 10, top: 10),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 1.58),
                                    blurRadius: 3.76,
                                    color: const Color(0xff369246)
                                        .withOpacity(0.0585),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(0, 7.2),
                                    blurRadius: 3.76,
                                    color: const Color(0xff369246)
                                        .withOpacity(0.09),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(0, 18.23),
                                    blurRadius: 28.34,
                                    color: const Color(0xff369246)
                                        .withOpacity(0.1215),
                                  ),
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.green.shade600,
                                      Colors.green.shade400,
                                    ]),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              bottom: 15, left: 10, right: 10, top: 10),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
