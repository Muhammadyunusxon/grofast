import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 37, top: 42),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'images/avatar.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff777777).withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "${"Name"}’s Home",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff9C9C9C),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset("images/icon/down.png"),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.notifications,
                  color: Color(0xff777777),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 39),
            children: [
              const Text(
                "Hey ${"Name"} 👋 ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(
                    0xff194B38,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Find fresh groceries you want",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff9C9C9C),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search fresh groceries",
                          hintStyle: TextStyle(
                            color: const Color(0xff194B38).withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 11),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff4CBB5E),
                          ),
                          fillColor: const Color(0xff194B38).withOpacity(0.06),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xff26AD71),
                              Color(0xff32CB4B),
                            ]),
                        borderRadius: BorderRadius.circular(18)),
                    child: const Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 18),
                        padding: EdgeInsets.symmetric(
                          vertical: 23,
                          horizontal: 21,
                        ),
                        height: 150,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Member",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: Color(0xff194B38)),
                            ),
                            const  SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "discount",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff194B38),
                              ),
                            ),
                            const  SizedBox(
                              height: 1,
                            ),
                            const Text(
                              "40%",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28,
                                  color: Color(0xff194B38)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 24,
                              width: 73,
                              decoration: BoxDecoration(
                                color: const Color(0xff4CBB5E),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child:  const Center(
                                  child: Text(
                                "claim now",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Categories",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xff194B38)),),
                Text("see all",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff4CBB5E),),)
                ],
              ),
               const SizedBox(height: 14,),
            ],
          )),
        ],
      ),
    );
  }
}
