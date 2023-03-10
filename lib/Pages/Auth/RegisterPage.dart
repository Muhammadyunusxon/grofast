import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'RegisterVerify.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isHidden = true;
  List social = [
    "assets/images/icon/apple.png",
    "assets/images/icon/google.png",
    "assets/images/icon/twitter.png",
    "assets/images/icon/facebook.png",
  ];
  bool emailEmpty = false;
  bool passwordEmpty = false;
  bool fullNameEmpty = false;

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
                      const Text(
                        "Welcome back to Grofast!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: Color(0xff194B38),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Full name",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9C9C9C),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (s) {
                          fullNameEmpty = false;
                          setState(() {});
                        },
                        controller: fullName,
                        cursorColor: const Color(0xff4B4B4B),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Color(
                              0xff4B4B4B,
                            ),
                            size: 20,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF1F5F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xffF1F5F3).withOpacity(0.06),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      fullNameEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                "Full name address is incorrect",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xffEC534A),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        "Email address",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9C9C9C),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (s) {
                          emailEmpty = false;
                          setState(() {});
                        },
                        controller: email,
                        cursorColor: const Color(0xff4B4B4B),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Color(
                              0xff4B4B4B,
                            ),
                            size: 20,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF1F5F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xffF1F5F3).withOpacity(0.06),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      emailEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                "Email address is incorrect",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xffEC534A),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9C9C9C),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (s) {
                          passwordEmpty = false;
                          setState(() {});
                        },
                        obscureText: _isHidden,
                        controller: password,
                        cursorColor: const Color(0xff4B4B4B),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(
                              0xff4B4B4B,
                            ),
                            size: 20,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              _isHidden = !_isHidden;
                              setState(() {});
                            },
                            child: Icon(
                              !_isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.green,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xffF1F5F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xffF1F5F3).withOpacity(0.06),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: const Color(0xff194B38).withOpacity(0.06),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          passwordEmpty
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Text(
                                    "Password is incorrect",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xffEC534A),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          email.text.isNotEmpty &&
                                  password.text.isNotEmpty &&
                                  fullName.text.isNotEmpty
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => VerifyPage(name: fullName.text,),
                                  ),
                                )
                              : fullName.text.isEmpty
                                  ? fullNameEmpty = true
                                  : email.text.isEmpty
                                      ? emailEmpty = true
                                      : passwordEmpty = true;
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
                              "Sign Up",
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
                        height: 17  ,
                      ),
                      const Center(
                        child: Text(
                          "or with",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff4B4B4B),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < social.length; i++)
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xffF1F4F3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(social[i]),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const LoginPage(),),);
                          },
                          child: RichText(
                            text: const TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9C9C9C),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4CBB5E)),
                                  ),
                                ]),
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
