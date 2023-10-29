import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/presentation/widgets/todo_task_percentage.dart';
import 'package:todo/core/presentation/widgets/todo_task_tile.dart';
import 'package:todo/features/home/tasks/screens/add_tasks.dart';
import 'package:todo/features/home/tasks/screens/tile_details.dart';
import 'package:todo/features/home/tasks/state/task_events.dart';
import 'package:todo/features/home/tasks/state/tasks_bloc.dart';
import 'package:todo/features/home/tasks/state/tasks_state.dart';
import '../../../../core/presentation/widgets/todo_rounded_icon.dart';
import '../../../../core/utils/helper_functions.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TasksBloc>().add(FetchTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: BlocConsumer<TasksBloc, TaskState>(
      listener: (_, state) {
        state.maybeMap(
          orElse: () => {},
          fetchTasksError: (state) => showToast(state.message),
        );
      },
      builder: (_, state) => Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello,",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "Your\nProjects (4)",
                  "Your\nProjects(${state.maybeMap(
                    orElse: () => "",
                    fetchTasksSuccess: (state) => state.categories.length.toString(),
                  )})",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TodoRoundedIcon(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddTaskScreen(hasCategory: false),
                      ),
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.plus),
                  width: 60,
                  backgroundColor: locator.get<AppTheme>().genericGrey,
                ),
              ],
            ),
            state.maybeMap(
                orElse: () => const SizedBox(),
                fetchTasksLoading: (_) => const CupertinoActivityIndicator(),
                fetchTasksError: (state) => Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async => context.read<TasksBloc>().add(FetchTaskEvent()),
                        child: const SingleChildScrollView(),
                      ),
                    ),
                fetchTasksSuccess: (state) => Expanded(
                      child: ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (_, i) {
                          debugPrint("${state.categories.length}");
                          final categories = state.categories;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TodoTasksTile(
                                isEven: i % 2 == 0,
                                tileTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TileDetails(
                                        isEven: i % 2 == 0,
                                        category: categories[i],
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categories[i].title,
                                        style: theme.textTheme.bodyLarge?.copyWith(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w900,
                                          color: locator.get<AppTheme>().genericWhiteColor,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      TodoTasksPercentage(
                                        completedTasks: categories[i].tasks.where((e) => e.completed == true).length,
                                        total: categories[i].tasks.length,
                                        indicatorColor:
                                            i % 2 == 0 ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(width: 50.w),
                                          TodoRoundedIcon(onTap: () {}, icon: const FaIcon(FontAwesomeIcons.plus))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                            ],
                          );
                        },
                      ),
                    ))
          ],
        ),
      ),
    ));
  }
}
