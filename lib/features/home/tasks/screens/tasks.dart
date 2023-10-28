import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/app/app_assets.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/presentation/widgets/todo_task_percentage.dart';
import 'package:todo/core/presentation/widgets/todo_task_tile.dart';
import 'package:todo/features/home/tasks/screens/tile_details.dart';

import '../../../../core/presentation/widgets/todo_avatar.dart';
import '../../../../core/presentation/widgets/todo_rounded_icon.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hello, Emmanuel",
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your\nProjects (4)",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TodoAvatar(
                child: Image.asset(
                  locator.get<Assets>().person_placeholder,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, i) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TodoTasksTile(
                    isEven: i % 2 == 0,
                    tileTapped: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TileDetails(isEven: i % 2 == 0),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Holidays\nIn Norway ",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: locator.get<AppTheme>().genericWhiteColor,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TodoTasksPercentage(
                            completedTasks: 6,
                            total: 10,
                            indicatorColor: i % 2 == 0 ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(width: 50.w),
                             TodoRoundedIcon(onTap: (){}, icon: const FaIcon(FontAwesomeIcons.plus))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
