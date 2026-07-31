import 'package:devvault/Auth/auth_service.dart';
import 'package:devvault/Home_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onTap;
  const SignupPage({super.key, this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void signup() async {
    try {
      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

      final email = _email.text;
      final password = _password.text;

      if (!emailRegex.hasMatch(email)) {
        throw InvalidEmailException();
      }

      await AuthService().signup(email, password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on EmailAlreadyInuseException {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Email already in use"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    } on WeakPasswordException {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Weak password"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    } on InvalidEmailException {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Invalid Email"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    } on GerneralException {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Something Wrong"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    }
  }

  bool eye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 2, 49),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                "DevVault",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 100),
            Container(
              width: 390,
              height: 548,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 221, 217, 217),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _password,
                      obscureText: eye ? false : true,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          child: eye
                              ? Image.asset("images/eye.png")
                              : Image.asset("images/eyeoff.png"),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 221, 217, 217),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    Container(
                      width: 400,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 98, 0, 255),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: signup,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
