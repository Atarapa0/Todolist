import 'dart:convert';

import 'package:todolist/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";

 Future <List<Todo>>  getTodods()async {
  final response = await http.get(Uri.parse(url));
  List<dynamic> resp= jsonDecode(response.body)["todos"];  
  List<Todo> todos =List.empty(growable: true);

  for (var element in resp) {
    todos.add(Todo.fromJson(element));
  }
  return todos;
 }
}