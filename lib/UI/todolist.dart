import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/constants/tasktype.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.task});
  final Task task;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset("assets/Icons/Category.png")
                : widget.task.type == TaskType.calender
                    ? Image.asset("assets/Icons/Category-2.png")
                    : Image.asset("assets/Icons/Category.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Checkbox(
                value: isChecked,
                onChanged: (val) => {
                      setState(() {
                        isChecked = val!;
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
