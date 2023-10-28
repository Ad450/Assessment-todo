import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/app_locator.dart';
import '../../app/app_theme.dart';

class TodoRoundedIcon extends StatelessWidget {
  final VoidCallback onTap;
  final FaIcon icon;
  final double? width;
  final Color? backgroundColor;
  const TodoRoundedIcon({
    required this.onTap,
    required this.icon,
    this.width,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: width ?? 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? locator.get<AppTheme>().genericWhiteColor,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
