import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kanpeki Music",
          style: TextStyle(fontSize: 20, color: whiteColor, fontFamily: "bold"),
        ),
      ),
      body: Container(),
    );
  }
}
