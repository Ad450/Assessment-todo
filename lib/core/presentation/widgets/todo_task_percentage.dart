import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../../app/app_locator.dart';
import '../../app/app_theme.dart';

class TodoTasksPercentage extends StatelessWidget {
  final int completedTasks;
  final Color indicatorColor;
  final int total;
  const TodoTasksPercentage({
    required this.completedTasks,
    required this.indicatorColor,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        VerticalBarIndicator(
          percent: double.parse((completedTasks / total).toStringAsFixed(1)),
          height: 50.h,
          width: 20.w,
          color: [indicatorColor, indicatorColor],
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$completedTasks/$total",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: locator.get<AppTheme>().genericWhiteColor,
              ),
            ),
            Text("tasks", style: theme.textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}
