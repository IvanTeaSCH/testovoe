import 'package:flutter/material.dart';
import 'package:testovoe/resources/icons_constants.dart';
import 'package:testovoe/resources/ui_themes.dart';

class BottomNaviBar extends StatelessWidget {
  BottomNaviBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  final Function(int)? onItemTapped;
  final int currentIndex;
  final List<IconData> listIcons = [
    AppIcons.person,
    AppIcons.star,
    AppIcons.setting,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0.5,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: theme.backgroundPrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.textPrimary,
        unselectedItemColor: theme.textGrey,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: [
          ...List.generate(
            listIcons.length,
            (index) => _bottomNavigationBarItem(index),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Icon(listIcons[index]),
      ),
      label: '',
    );
  }
}
