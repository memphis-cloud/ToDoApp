import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

import 'package:todo_list_app/widgets/main_widget.dart';
import 'package:todo_list_app/widgets/to_do_subtitle/to_do_subtitle_widget.dart';
import 'package:todo_list_app/widgets/to_do_title/to_do_title_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD6D7EF),
      child: Stack(alignment: Alignment.bottomRight, children: [
        TasksListWidget(),
        AddTaskButtonWidget(),
      ]),
    );
  }
}

class TasksListWidget extends StatefulWidget {
  TasksListWidget({
    super.key,
  });

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  final TaskDecoration = BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  );
  final TaskDecoration1 = BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 2,
        offset: Offset(0, 6),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    final dateTime = context.read<Model>().dateTime;
    final dateTimeNow = DateTime.now();
    final box1 = [];
    context.watch<Model>().ActivesTasks.values.forEach((element) {
      final date = DateTime(
          int.parse(element.date.split(".")[2]),
          int.parse(element.date.split(".")[1]),
          int.parse(element.date.split(".")[0]));
      if (date.isBefore(
          DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 1))) {
        box1.add(element);
      }
    });
    return Stack(
      children: [
        ListView.builder(
          itemCount: box1.length,
          padding: EdgeInsets.only(top: 56),
          itemBuilder: (BuildContext context, int index) {
            final ActiveTasks = box1.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(right: 4, left: 4, bottom: 21),
              child: Container(
                height: 82,
                decoration: TaskDecoration,
                child: Slidable(
                  endActionPane: ActionPane(
                      motion: BehindMotion(),
                      extentRatio: 0.24,
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          backgroundColor: Colors.red.shade400,
                          // foregroundColor: AppColors.LightPurple,
                          // icon: Icons.delete,
                          label: "Удалить",
                          onPressed: (context) =>
                              {context.read<Model>().deleteTask(index)},
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 25, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ToDoTitleWidget(
                                title: ActiveTasks.title,
                              ),
                              if (ActiveTasks.subtitle != null) ...[
                                ToDoSubtitleWidget(
                                  subtitle: ActiveTasks.subtitle,
                                )
                              ],
                              Row(
                                children: [
                                  if (ActiveTasks.date != null) ...[
                                    Text(
                                      ActiveTasks.date,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Jost",
                                        color: (DateTime(
                                                        int.parse(ActiveTasks.date
                                                            .split(".")[2]),
                                                        int.parse(ActiveTasks.date
                                                            .split(".")[1]),
                                                        int.parse(ActiveTasks.date
                                                            .split(".")[0]))
                                                    .isBefore(DateTime(
                                                  dateTime.year,
                                                  dateTime.month,
                                                  dateTime.day,
                                                )) &
                                                DateTime(
                                                        int.parse(ActiveTasks.date
                                                            .split(".")[2]),
                                                        int.parse(ActiveTasks.date.split(".")[1]),
                                                        int.parse(ActiveTasks.date.split(".")[0]))
                                                    .isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)))
                                            ? Color.fromARGB(255, 251, 1, 1)
                                            : Color(0xFF000000),
                                      ),
                                    ),
                                    if (ActiveTasks.time != null) ...[
                                      RichText(
                                          text: TextSpan(
                                              text: ', ',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Jost",
                                                color: (DateTime(
                                                                int.parse(ActiveTasks.date.split(
                                                                    ".")[2]),
                                                                int.parse(ActiveTasks.date.split(
                                                                    ".")[1]),
                                                                int.parse(ActiveTasks.date.split(
                                                                    ".")[0]))
                                                            .isBefore(DateTime(
                                                          dateTime.year,
                                                          dateTime.month,
                                                          dateTime.day,
                                                        )) &
                                                        DateTime(int.parse(ActiveTasks.date.split(".")[2]), int.parse(ActiveTasks.date.split(".")[1]), int.parse(ActiveTasks.date.split(".")[0])).isBefore(DateTime(
                                                            DateTime.now().year,
                                                            DateTime.now().month,
                                                            DateTime.now().day)))
                                                    ? Color.fromARGB(255, 251, 1, 1)
                                                    : Color(0xFF000000),
                                              ),
                                              children: [
                                            TextSpan(
                                                text: '${ActiveTasks.time}',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost",
                                                  color: (DateTime(
                                                                  int.parse(ActiveTasks.date.split(
                                                                      ".")[2]),
                                                                  int.parse(ActiveTasks.date.split(
                                                                      ".")[1]),
                                                                  int.parse(ActiveTasks.date.split(
                                                                      ".")[0]))
                                                              .isBefore(
                                                                  DateTime(
                                                            dateTime.year,
                                                            dateTime.month,
                                                            dateTime.day,
                                                          )) &
                                                          DateTime(
                                                                  int.parse(ActiveTasks.date.split(".")[2]),
                                                                  int.parse(ActiveTasks.date.split(".")[1]),
                                                                  int.parse(ActiveTasks.date.split(".")[0]))
                                                              .isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)))
                                                      ? Color.fromARGB(255, 251, 1, 1)
                                                      : Color(0xFF000000),
                                                )),
                                          ]))
                                    ],
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            EditTaskButtonWidget(
                              index: index,
                            ),
                            CloseTaskButtonWidget(
                              index: index,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
          child: Container(
              width: double.infinity,
              decoration: TaskDecoration1,
              child: (dateTime.isAtSameMomentAs(DateTime(dateTimeNow.year,
                      dateTimeNow.month, dateTimeNow.day, 0, 0, 0, 0, 0)))
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        'Задачи на сегодня',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Jost",
                          color: Color(0xFF000000),
                        ),
                      ),
                    )
                  : (DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0,
                              0, 0, 0)
                          .isAtSameMomentAs(DateTime(
                              dateTimeNow.year,
                              dateTimeNow.month,
                              dateTimeNow.day + 1,
                              0,
                              0,
                              0,
                              0,
                              0)))
                      ? Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Задачи до завтра',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Jost",
                              color: Color(0xFF000000),
                            ),
                          ),
                        )
                      : (DateTime(dateTime.year, dateTime.month, dateTime.day,
                                  0, 0, 0, 0, 0)
                              .isAtSameMomentAs(DateTime(
                                  dateTimeNow.year,
                                  dateTimeNow.month,
                                  dateTimeNow.day + 2,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0)))
                          ? Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text(
                                'Задачи до послезавтра',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Jost",
                                  color: Color(0xFF000000),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 18, top: 8, bottom: 8),
                              child: Text(
                                'Задачи до ${dateTime.day}.${dateTime.month}.${dateTime.year}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Jost",
                                  color: Color(0xFF000000),
                                ),
                              ),
                            )),
        )
      ],
    );
  }
}

class AddTaskButtonWidget extends StatelessWidget {
  const AddTaskButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 70,
        onPressed: () {
          Navigator.pushNamed(context, '/main/add_task');
        },
        icon: Icon(
          Icons.add_circle_outlined,
          color: Color(0xFF9395D3),
        ));
  }
}

class CloseTaskButtonWidget extends StatelessWidget {
  CloseTaskButtonWidget({
    super.key,
    this.index,
  });
  final index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: AppColors.LightPurple,
        onPressed: () => context.read<Model>().closeTask(index),
        icon: Icon(
          Icons.check_circle_outline_outlined,
          size: 25,
          color: AppColors.LightPurple,
        ));
  }
}

class EditTaskButtonWidget extends StatefulWidget {
  const EditTaskButtonWidget({
    super.key,
    this.index,
  });
  final index;

  @override
  State<EditTaskButtonWidget> createState() => _EditTaskButtonWidgetState();
}

class _EditTaskButtonWidgetState extends State<EditTaskButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main/edit_task',
              arguments: widget.index);
        },
        icon: Icon(
          Icons.mode_edit_outline_outlined,
          size: 25,
          color: AppColors.LightPurple,
        ));
  }
}
