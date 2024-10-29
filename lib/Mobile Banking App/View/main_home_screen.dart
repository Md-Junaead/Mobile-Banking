import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black45,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.orange[900]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.white,
            ],
            radius: 1.5,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Badge(
                              child: Icon(
                                Icons.notification_add,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//03: 29
