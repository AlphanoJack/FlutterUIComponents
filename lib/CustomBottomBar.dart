import 'package:custom_bottom_bars/BeamPaionter.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1; // Heart icon selected by default
  final List<GlobalKey> _keys = List.generate(5, (index) => GlobalKey());


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - 32; // 좌우 마진 16씩 제외
        final itemWidth = availableWidth / 5;

        return Stack(
          children: [
            // Bottom Navigation Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      width: itemWidth,
                      child: _buildIcon(index, _getIconData(index)),
                    );
                  }),
                ),
              ),
            ),
            // Top red indicator
            Positioned(
              top: 14,
              left: 16, // 컨테이너의 좌측 마진과 동일
              right: 16, // 컨테이너의 우측 마진과 동일
              child: SizedBox(
                height: 4,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 0),
                      left: itemWidth * _selectedIndex + (itemWidth - 30) / 2,
                      child: Container(
                        width: 30,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.favorite_outline;
      case 2:
        return Icons.add_circle_outline;
      case 3:
        return Icons.person_outline;
      case 4:
        return Icons.notifications_none;
      default:
        return Icons.home_outlined;
    }
  }

  Widget _buildIcon(int index, IconData icon) {
    bool isSelected = _selectedIndex == index;

    return IconButton(
      key: _keys[index],
      onPressed: () => setState(() => _selectedIndex = index),
      icon: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Positioned(
              top: -20,
              child: SizedBox(
                height: 70,
                width: 90,
                child: CustomPaint(
                  painter: BeamPainter(),
                ),
              ),
            ),
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.grey,
            size: 28,
          ),
        ],
      ),
    );
  }
}