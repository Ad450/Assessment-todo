// import 'package:flutter/material.dart';

// class BuildTile extends StatefulWidget {
//   final String tasksTitle;

//   const BuildTile({required this.super.key});

//   @override
//   State<BuildTile> createState() => _BuildTileState();
// }

// class _BuildTileState extends State<BuildTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.taskTitle),
//       onLongPress: (){
//          _showBottomSheet(theme,
//             isUpdate: true,
//             button: BlocListener<TasksBloc, TaskState>(
//               listener: (_, state) => state.maybeMap(
//                 orElse: () => {},
//                 updateTaskError: (state) => showToast(state.message),
//                 updateTaskSuccess: (state) {
//                   context.read<TasksBloc>().add(FetchTaskEvent());
//                   Navigator.pop(context);
//                   return;
//                 },
//               ),
//               child: TodoButton(
//                 onPressed: () {
//                   context.read<TasksBloc>().add(UpdateTaskEvent(widget.category.title));
//                   Navigator.pop(context);
//                 },
//                 buttonStyle: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll<Color>(locator.get<AppTheme>().genericBlackColor),
//                 ),
//                 height: 60.h,
//                 child: Text(
//                   "Update",
//                   style: theme.textTheme.bodyLarge?.copyWith(
//                     color: locator.get<AppTheme>().genericWhiteColor,
//                   ),
//                 ),
//               ),
//             ));
//       },
//       leading: Checkbox(
//         value: completed ? true : isCompleted,
//         onChanged: (value) {
//           context.read<TasksBloc>().add(
//                 MarkTaskAsCompleteEvent(
//                   categoryTitle: categoryTitle,
//                   taskTitle: taskTitle,
//                 ),
//               );
//           setState(() {
//             isCompleted = true;
//           });
//         },
//       ),
//     );
//   }
// }
// }