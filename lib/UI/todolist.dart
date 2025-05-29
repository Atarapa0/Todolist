import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.task});
  final Todo task;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    // Başlangıçta isChecked değerini task'in completed durumuna göre ayarla
    isChecked = widget.task.isCompleted ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /* TODOÇ Firebase işlemlerinde düzeltilecek
            widget.task.type == TaskType.note
                ? Image.asset("assets/Icons/Category.png")
                : widget.task.type == TaskType.calender
                    ? Image.asset("assets/Icons/Category-2.png")
                    : Image.asset("assets/Icons/Category.png"),*/
            Image.asset("assets/Icons/Category.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                        decoration: (widget.task.isCompleted  ?? false)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text("UserID: ${widget.task.userID ?? 'No ID'}"),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = !(widget.task.isCompleted ?? false);
                    isChecked = val!;
                  },
                )
              },
            )
          ],
        ),
      ),
    );
  }
}
