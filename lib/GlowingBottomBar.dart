import 'package:flutter/material.dart';

class GlowingBottomNavigationBar extends StatefulWidget {
  const GlowingBottomNavigationBar({super.key});

  @override
  State<GlowingBottomNavigationBar> createState() => _GlowingBottomNavigationBarState();
}

class _GlowingBottomNavigationBarState extends State<GlowingBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.favorite,
    Icons.add,
    Icons.person,
    Icons.favorite_border,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _icons.length,
                (index) => GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: _selectedIndex == index ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                    width: 2,
                  ),
                  boxShadow: _selectedIndex == index
                      ? [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ]
                      : [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                  gradient: _selectedIndex == index ? RadialGradient(colors: [
                    Colors.white.withOpacity(0.7),
                    Colors.black.withOpacity(1)
                  ],
                    center: Alignment(0.4, -1.1),
                    radius: 0.5,
                  )
                      : null ,
                  // RadialGradient(colors: [
                  //   Colors.white.withOpacity(0.7),
                  //   Colors.black.withOpacity(1)
                  // ],
                  //   center: Alignment(0.3, -1.1),
                  //   radius: 0.4,
                  // ),

                ),
                child: Icon(
                  _icons[index],
                  color: _selectedIndex == index ? Colors.red : Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}