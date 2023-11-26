import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color(0xffFFFFFF).withOpacity(0.5),
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xffFEDC00),
      selectedIconTheme: const IconThemeData(
        color: Color(0xffFEDC00),
      ),
      onTap: (value) {
        onTap!(value);
      },
      backgroundColor: const Color(0xff2A2A2A),
      currentIndex: currentIndex,
      items: [
        _bottomNavigationBarItem(
          label: 'العملات',
          imagePath: 'assets/images/dollar_circle.png',
        ),
        _bottomNavigationBarItem(
          label: 'الذهب',
          imagePath: 'assets/images/gold.png',
        ),
        _bottomNavigationBarItem(
          label: 'المفضلة',
          imagePath: 'assets/images/heart.png',
        ),
        _bottomNavigationBarItem(
          label: 'البروفايل',
          imagePath: 'assets/images/profile.png',
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required String label,
    String? imagePath,
    Widget? widget,
  }) {
    return BottomNavigationBarItem(
      activeIcon: widget ??
          ImageIcon(
            AssetImage(imagePath ?? ''),
          ),
      label: label,
      icon: widget ??
          ImageIcon(
            AssetImage(imagePath ?? ''),
          ),
    );
  }
}
