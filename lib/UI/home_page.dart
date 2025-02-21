import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todolist/constants/tasktype.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/service/todo_service.dart';
import '../constants/constans.dart';
import 'todolist.dart';
import 'add_new_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> todoList = [
    Task(
        type: TaskType.note,
        title: "Study Lessons",
        description: "Study Less",
        isCompleted: false),
    Task(
        type: TaskType.calender,
        title: "Run 5k",
        description: "Run",
        isCompleted: false),
    Task(
        type: TaskType.contest,
        title: "Go To Party",
        description: "Party",
        isCompleted: false),
  ];

  List<Task> completedList = [
    Task(
        type: TaskType.note,
        title: "Study Lessons",
        description: "Study Lessons",
        isCompleted: false)
  ];

  void addnewTask(Task newtask) {
    setState(() {
      todoList.add(newtask);
    });
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodods();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            //Header
            Container(
              width: deviceWidth,
              height: deviceHeight * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Header/Header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Todo List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            //Top column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: todoService.getTodods(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: todoList.length,
                          itemBuilder: (context, index) {
                            return TodoList(task: todoList[index]);
                          });
                    },
                  ),
                ),
              ),
            ),
            //Completed Tasks
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Completed Tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //Bottom Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: completedList.length,
                          itemBuilder: (context, index) {
                            return TodoList(task: completedList[index]);
                          })),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTask(
                            addnewTask: (newTask) => addnewTask(newTask),
                          )));
                },
                child: Text('Add New'))
          ],
        ),
      ),
    );
  }
}
