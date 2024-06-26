import 'package:flutter/material.dart';
import 'package:ride_hailing_app/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
  }) : super(
          key: key,
        );

  final String title;

  final IconData leadingIcon;

  final IconData trailingIcon;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height ?? 56,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(leadingIcon),
            onPressed: () {
              // Handle left icon tap
            },
          ),
          Text(title),
          IconButton(
            icon: Icon(trailingIcon),
            onPressed: () {
              // Handle right icon tap
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
