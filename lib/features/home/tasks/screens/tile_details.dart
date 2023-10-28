import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/features/home/tasks/screens/add_tasks.dart';

import '../../../../core/app/app_locator.dart';
import '../../../../core/app/app_theme.dart';
import '../../../../core/presentation/widgets/todo_rounded_icon.dart';
import '../../../../core/presentation/widgets/todo_task_percentage.dart';

class TileDetails extends StatelessWidget {
  final bool isEven;
  const TileDetails({required this.isEven, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350.h,
            width: double.infinity,
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
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodoRoundedIcon(onTap: () {}, icon: const FaIcon(FontAwesomeIcons.arrowLeft), width: 40),
                  SizedBox(height: 40.h),
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
                    indicatorColor: isEven ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, i) => Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  title: const Text("todo title will come here"),
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: TodoRoundedIcon(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTasks(category: "Holidays In Norway")),
            );
          },
          icon: const FaIcon(FontAwesomeIcons.plus)),
    );
  }
}
