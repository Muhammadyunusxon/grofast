import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool passwordEmpty = false;
  bool confirmEmpty = false;
  bool _isHidden = true;

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
                        padding: EdgeInsets.only(right: 200, top: 8),
                        child: Text(
                          "New Password",
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
                      const Text(
                        "At least 8 characters, with uppercase, lowercase and special character.",
                        style: TextStyle(
                          color: Color(0xff9C9C9C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        "New Password",
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
                        height: 22,
                      ),

                      const Text(
                        "Confirm Password",
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
                          confirmEmpty = false;
                          setState(() {});
                        },
                        obscureText: _isHidden,
                        controller: confirmPassword,
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
                      confirmEmpty
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
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          password.text.isNotEmpty &&
                              confirmPassword.text == password.text && confirmPassword.text.isNotEmpty
                              ? print(true)
                              : password.text.isEmpty
                              ? passwordEmpty = true
                              : confirmEmpty = true ;
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
                              "Send me Link",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
