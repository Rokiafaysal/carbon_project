import 'package:carbon/Components/appColor.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final List<BottomNavItemData> items;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;

   CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = AppColors.darkBottomBar,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: selectedIndex,
      onTap: onItemSelected,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: items
          .map((item) => _buildNavItem(
                icon: item.icon,
                label: item.label,
                index: items.indexOf(item),
              ))
          .toList(),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    return BottomNavigationBarItem(

      label: label,
      icon: isSelected
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: selectedColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: selectedColor),
            )
          : Icon(icon),
    );
  }
}

// Data class for each navigation item
class BottomNavItemData {
  final IconData icon;
  final String label;

  BottomNavItemData({
    required this.icon,
    required this.label,
  });
}
