import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTasksTile extends StatelessWidget {
  final bool isEven;
  final Widget child;
  final VoidCallback tileTapped;
  const TodoTasksTile({
    required this.isEven,
    required this.child,
    required this.tileTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: tileTapped,
      child: Container(
        width: double.infinity,
        height: 280.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isEven
                ? [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(0.7)]
                : [theme.colorScheme.onPrimary, theme.colorScheme.onPrimary.withOpacity(0.7)],
          ),
        ),
        child: Card(
          color: isEven ? theme.colorScheme.primary : theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
          margin: EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
