import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:todo_list/UI/consants/color_file.dart';
=======
import 'package:hexcolor/hexcolor.dart';
import 'package:todolist/constants/tasktype.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/service/todo_service.dart';
import '../constants/constans.dart';
import 'todolist.dart';
import 'add_new_task.dart';
>>>>>>> 096663da6ae9fab85d69aa4131df3813ad0814ae

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
<<<<<<< HEAD
  double offsetY = 0; // Container'ların dikey hareketi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu), // Sol tarafta menü butonu
          onPressed: () {
            // Menü sayfasına gitme işlemi
          },
        ),
        title: Text('TaskNest'),
        backgroundColor: ColorFile.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // Sağ tarafta ayarlar butonu
            onPressed: () {
              // Ayarlar sayfasına gitme işlemi
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: ColorFile.loveColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  color: ColorFile.starColor,
                                  child: Column(
                                    children: [
                                      Text('Başlık & Görevler'),
                                      Text('Not içenriği'),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  color: ColorFile.starColor,
                                  child: Column(
                                    children: [
                                      Text('Başlık & Görevler'),
                                      Text('Not içeği'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //Dönen notlar yada görevler olan Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: ColorFile.starColor,
                      child: Column(
                        children: [
                          Text('3 seçenekli bar'),
                          
                        ],
                      ),
                    ),
                  ],
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/50),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: ColorFile.backgroundColor,
                      child: Column(
                        children: [
                          Text('Tasklar olacak '),
                        ],
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          )
        ],
=======
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
    todoService.getUnCompletedTodos();
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
                    future: todoService.getUnCompletedTodos(),
                    builder: (context, snapshot) {
                      if(snapshot.data==null){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else{
                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TodoList(task: snapshot.data![index]);
                          });
                      }
                      
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
                  child: FutureBuilder(
                    future: todoService.getCompletedTodos(),
                    builder: (context, snapshot) {
                      if(snapshot.data==null){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else{
                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TodoList(task: snapshot.data![index]);
                          });
                      }
                      
                    },
                  ),
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
>>>>>>> 096663da6ae9fab85d69aa4131df3813ad0814ae
      ),
    );
  }
}
