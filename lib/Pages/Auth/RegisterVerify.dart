import 'package:flutter/material.dart';

import 'BottomSheet.dart';
import 'TermandCondition.dart';

class VerifyPage extends StatefulWidget {
  final String name;
  const VerifyPage({Key? key, required this.name}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: const Color(0xff777777).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff777777),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 170),
                        child: Text(
                          "Verify your Identity",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Color(0xff194B38),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Text(
                          "We have just sent a code to hello.john@email.com",
                          style: TextStyle(
                              color: Color(0xff9C9C9C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i=0;i< 4;i++)
                          Container(
                            margin: const EdgeInsets.only(right: 10,),
                            height: 60,
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xff194B38).withOpacity(0.06),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color:
                                    const Color(0xff194B38).withOpacity(0.06),
                              ),
                            ),
                            child:   Center(
                              child: Text(
                                "${i+1}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4B4B4B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                              text: "Didn’t receive the code?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9C9C9C),
                              ),
                              children: [
                                TextSpan(
                                  text: " Resend Code",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4CBB5E),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                              context: context, builder: (context){
                                  return BottomSheets(name: widget.name,);
                          });
                          setState(() {});
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xff26AD71),
                                  Color(0xff32CB4B),
                                ]),
                          ),
                          child: const Center(
                            child: Text(
                              "Verification",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60,right: 60),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const TermPage(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                  text: "By Signin up, you agree to our  ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9C9C9C),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Term and Conditions  ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4CBB5E),
                                      ),
                                    ),
                                  ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
