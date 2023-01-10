import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  const TermPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 41),
                child: Row(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    const Text(
                      'Term and agreement',
                      style: TextStyle(
                        color: Color(0xff4B4B4B),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 88,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  children: const [
                    Text(
                      "1. YOUR AGREEMENT",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "By using this Site, you agree to be bound by, and to comply with, these Terms and Conditions. If you do not agree to these Terms and Conditions, please do not use this site.",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff9C9C9C),),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "PLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at any time. Unless otherwise indicated, amendments will become effective immediately. Please review these Terms and Conditions periodically. Your continued use of the Site following the posting of changes and/or modifications will constitute your acceptance of the revised Terms and Conditions and the reasonableness of these standards for notice of changes. For your information, this page was last updated as of the date at the top of these terms and conditions.",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff9C9C9C),),
                    ),
                    SizedBox(height: 35,),

                    Text(
                      "2. PRIVACY",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "Please review our Privacy Policy, which also governs your visit to this Site, to understand our practices.",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff9C9C9C),),
                    ),
                    SizedBox(height: 25,),

                    Text(
                      "3. LINKED SITES",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "This Site may contain links to other independent third-party Web sites ('Linked Sites'). provided solely as a convenience to our visitors. ",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff9C9C9C),),
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
