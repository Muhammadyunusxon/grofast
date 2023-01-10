import 'package:flutter/material.dart';
import 'package:grofast/Pages/HomePage/GeneralPage.dart';

class BottomSheets extends StatelessWidget {
  final String name;
  const BottomSheets({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Positioned(
            left: -100,
            right: -100,
            child: Container(
              height: 419,
              width: 633,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.elliptical(300, 111)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 122,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff4CBB5E).withOpacity(0.1),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff4CBB5E).withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 38,
                      color: Color(0xff4CBB5E),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              const Text(
                "Success!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(0xff4b4b4b),
                ),
              ),
               const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  "You have successfully created your account.!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff4b4b4b),
                  ),textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32,),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GeneralPage(name: name),),);
                  },
                  child: Container(
                    height: 52,
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
                        "Browse Home",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36,),

            ],
          )
        ],
      ),
    );
  }
}
