import 'dart:convert';

import 'package:todolist/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  final String addurl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getUnCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);
      if (!(task.isCompleted ?? false)) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<List<Todo>> getCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);
      if (task.isCompleted ?? false) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<String> addTodo(Todo newtodo) async {
  try {
    final response = await http.post(
      Uri.parse(addurl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'todo': newtodo.todo,
        'completed': newtodo.isCompleted,
        'userId': newtodo.userID,
      }),
    );

    print('Response: ${response.body}');
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to add todo: ${response.body}');
    }
  } catch (e) {
    print('Error adding todo: $e');
    throw e;
  }
}
}
