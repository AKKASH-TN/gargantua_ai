import 'package:flutter/material.dart';
import 'package:perplexity_app/theme/colors.dart';
import 'package:perplexity_app/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: Colors.white,
            size: isCollapsed ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
                SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.search,
                    text: "Search"),
                SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.language,
                    text: "Spaces"),
                SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.auto_awesome,
                    text: "Discover"),
                SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.cloud_outlined,
                    text: "Library"),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 14),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right_outlined
                    : Icons.keyboard_arrow_left_outlined,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
