import 'package:devvault/Storage/code_storage.dart';
import 'package:devvault/code_Page.dart';
import 'package:flutter/material.dart';
import 'package:devvault/formCode.dart';

class Dartpage extends StatefulWidget {
  final List<Map<String, dynamic>>? codes;
  const Dartpage({super.key, this.codes});

  @override
  State<Dartpage> createState() => _DartpageState();
}

class _DartpageState extends State<Dartpage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(255, 5, 2, 49),
          body: Column(
            children: [
              SizedBox(height: 50),

              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Snippet List",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              Container(
                width: 390,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: StreamBuilder(
                  stream: CodeStorage().getCode(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Codes Yet"));
                    }

                    // ["fhfhf", "jjdjdj"];
                    final codes = snapshot.data!;

                    return ListView.builder(
                      itemCount: codes.length,
                      itemBuilder: (context, index) {
                        final code = codes[index];

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CodePage(
                                    codeName: code["codeName"],
                                    code: code["code"],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 87, 3, 184),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset("images/dart.png"),
                                    SizedBox(width: 10),
                                    Text(
                                      code["codeName"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await CodeStorage().deleteCode(
                                              code['id'],
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Formcode()),
                );
              },
              backgroundColor: const Color.fromARGB(255, 0, 4, 255),
              child: Image.asset("images/plus.png"),
            ),
          ),
        ),
      ],
    );
  }
}
