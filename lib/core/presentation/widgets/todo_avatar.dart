import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoAvatar extends StatelessWidget {
  final Widget child;
  const TodoAvatar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 40.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: child,
    );
  }
}
