import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/utils/helper_functions.dart';
import 'package:todo/features/home/tasks/screens/add_tasks.dart';
import 'package:todo/features/home/tasks/state/task_events.dart';
import 'package:todo/features/home/tasks/state/tasks_bloc.dart';
import 'package:todo/features/home/tasks/state/tasks_state.dart';

import '../../../../core/app/app_locator.dart';
import '../../../../core/app/app_theme.dart';
import '../../../../core/presentation/widgets/button.dart';
import '../../../../core/presentation/widgets/todo_rounded_icon.dart';
import '../../../../core/presentation/widgets/todo_task_percentage.dart';
import '../../../../core/presentation/widgets/todo_textfield.dart';

class TileDetails extends StatefulWidget {
  final bool isEven;
  final dynamic category;
  const TileDetails({
    required this.isEven,
    required this.category,
    super.key,
  });

  @override
  State<TileDetails> createState() => _TileDetailsState();
}

class _TileDetailsState extends State<TileDetails> {
  bool isCompleted = false;

  Widget _buildTile({required categoryTitle, required String taskTitle, required bool completed}) {
    return ListTile(
      title: Text(taskTitle),
      leading: Checkbox(
        value: completed ? true : isCompleted,
        onChanged: (value) {
          context.read<TasksBloc>().add(
                MarkTaskAsCompleteEvent(
                  categoryTitle: categoryTitle,
                  taskTitle: taskTitle,
                ),
              );
          setState(() {
            isCompleted = true;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                colors: widget.isEven
                    ? [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(0.7)]
                    : [theme.colorScheme.onPrimary, theme.colorScheme.onPrimary.withOpacity(0.7)],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodoRoundedIcon(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 20),
                      width: 40),
                  SizedBox(height: 40.h),
                  Text(
                    widget.category.title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: locator.get<AppTheme>().genericWhiteColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TodoTasksPercentage(
                    completedTasks: widget.category.tasks.where((e) => e.completed == true).length,
                    total: widget.category.tasks.length,
                    indicatorColor: widget.isEven ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 10.h,
            ),
            child: Text(
              "Your uncompleted todos",
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
            ),
          ),
          Expanded(
            child: BlocListener<TasksBloc, TaskState>(
              listener: (_, state) => state.maybeMap(
                orElse: () => {},
                deleteTaskError: (state) {
                  if (mounted) {
                    showToast(state.message);
                  }
                  return;
                },
                deleteTaskSuccess: (state) => showToast("Tasks deleted Successfully"),
              ),
              child: ListView.builder(
                itemCount: widget.category.tasks.length,
                itemBuilder: (_, i) => Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {
                        context.read<TasksBloc>().add(DeleteTaskEvent());
                      }),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            context.read<TasksBloc>().add(DeleteTaskEvent());
                          },
                          backgroundColor: theme.colorScheme.onPrimary,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: BlocConsumer<TasksBloc, TaskState>(
                      listener: (_, state) => state.maybeMap(
                          orElse: () => {},
                          markAsCompleteError: (state) {
                            if (mounted) {
                              showToast(state.message);
                            }
                            return;
                          }),
                      builder: (_, state) => state.maybeMap(
                          orElse: () => _buildTile(
                                taskTitle: widget.category.tasks[i].title,
                                categoryTitle: widget.category.title,
                                completed: widget.category.tasks[i].completed,
                              ),
                          markAsCompleteSuccess: (_) => _buildTile(
                                taskTitle: widget.category.tasks[i].title,
                                categoryTitle: widget.category.title,
                                completed: widget.category.tasks[i].completed,
                              )),
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: TodoRoundedIcon(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => SizedBox(
                //height: 200.h,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                    top: 30.h,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(children: [
                    TodoTextField(
                      controller: context.read<TasksBloc>().taskTitleController,
                      keyboardType: TextInputType.text,
                      hintText: "todo title",
                    ),
                    BlocListener<TasksBloc, TaskState>(
                      listener: (_, state) => state.maybeMap(
                        orElse: () {},
                        addToOldCategoryError: (state) => showToast(state.message),
                        addToOldCategorySuccess: (state) => context.read<TasksBloc>().add(FetchTaskEvent()),
                      ),
                      child: TodoButton(
                        onPressed: () {
                          context.read<TasksBloc>().add(AddToOldCategoryEvent(widget.category.title));
                          Navigator.pop(context);
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
                      ),
                    )
                  ]),
                ),
              ),
            );
          },
          icon: const FaIcon(FontAwesomeIcons.plus)),
    );
  }
}
