import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/presentation/widgets/button.dart';
import 'package:todo/core/presentation/widgets/todo_textfield.dart';

import '../../../../core/presentation/widgets/todo_rounded_icon.dart';

class AddTasks extends StatelessWidget {
  final String category;
  const AddTasks({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TodoRoundedIcon(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.x),
                width: 35,
                backgroundColor: locator.get<AppTheme>().genericGrey,
              ),
              SizedBox(height: 20.h),
              Text(
                "New Tasks",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              SizedBox(height: 20.h),
              TodoTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                hintText: "Category",
              ),
              TodoTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                hintText: "description",
              ),
              SizedBox(height: 20.h),
              TodoButton(
                onPressed: () {},
                buttonStyle: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(locator.get<AppTheme>().genericBlackColor),
                ),
                height: 60.h,
                child: Text(
                  "create",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: locator.get<AppTheme>().genericWhiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
