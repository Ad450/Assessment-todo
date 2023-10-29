import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/presentation/widgets/button.dart';
import 'package:todo/core/presentation/widgets/todo_textfield.dart';
import 'package:todo/features/home/tasks/screens/tasks.dart';
import 'package:todo/features/home/tasks/screens/tile_details.dart';
import 'package:todo/features/home/tasks/state/tasks_bloc.dart';
import 'package:todo/features/home/tasks/state/tasks_state.dart';

import '../../../../core/presentation/widgets/todo_rounded_icon.dart';
import '../../../../core/utils/helper_functions.dart';
import '../state/task_events.dart';

class AddTaskScreen extends StatefulWidget {
  final bool hasCategory;
  final String? category;
  const AddTaskScreen({required this.hasCategory, this.category, super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _focusedDay = DateTime.now();
  // DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocConsumer<TasksBloc, TaskState>(
        listener: (_, state) {
          state.maybeMap(
            orElse: () => {},
            addTasksError: (state) {
              if (mounted) {
                showToast(state.message);
              }
            },
            addTasksSuccess: (state) {
              if (widget.hasCategory) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const TasksScreen()),
                  (route) => false,
                );
              }
            },
          );
        },
        builder: (_, state) => IgnorePointer(
          ignoring: state.maybeMap(orElse: () => false, addTasksLoading: (_) => true),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      TodoRoundedIcon(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: FaIcon(FontAwesomeIcons.x, size: 10.h),
                        width: 35,
                        backgroundColor: locator.get<AppTheme>().genericGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
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
                    focusedDay: _focusedDay,
                    currentDay: _focusedDay,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _focusedDay = selectedDay; // update `_focusedDay` here as well
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  if (!widget.hasCategory)
                    TodoTextField(
                      controller: context.read<TasksBloc>().categoryController,
                      keyboardType: TextInputType.text,
                      hintText: "Category (at most three words)",
                    ),
                  TodoTextField(
                    controller: context.read<TasksBloc>().taskTitleController,
                    keyboardType: TextInputType.text,
                    hintText: "todo title",
                  ),
                  SizedBox(height: 20.h),
                  TodoButton(
                    onPressed: () {
                      final category =
                          widget.hasCategory ? widget.category : context.read<TasksBloc>().categoryController.text;
                      final taskTitle = context.read<TasksBloc>().taskTitleController;

                      if (category!.isNotEmpty && taskTitle.text.isNotEmpty) {
                        context.read<TasksBloc>().add(AddTaskEvent(false));
                      } else {
                        showToast("Please enter a category and title");
                      }
                    },
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
        ),
      ),
    );
  }
}
