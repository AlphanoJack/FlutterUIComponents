import 'package:custom_bottom_bars/CustomBottomBar.dart';
import 'package:custom_bottom_bars/GlowingBottomBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.black,
      ),
      bottomNavigationBar: GlowingBottomNavigationBar(),

    );
  }
}
