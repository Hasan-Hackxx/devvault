import 'package:devvault/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:devvault/dartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 2, 49),

      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Categories:",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () async {
                      await AuthService().logout();
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 390,
            height: 563,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dartpage()),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 219, 217, 217),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            "images/dart.png",
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            "Dart",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 219, 217, 217),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Image.asset("images/web.png", width: 100, height: 100),
                        Text(
                          "Web",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 219, 217, 217),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Image.asset("images/lock.png", width: 100, height: 100),
                        Text(
                          "Link",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 219, 217, 217),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Image.asset(
                          "images/security.png",
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          "Security",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
