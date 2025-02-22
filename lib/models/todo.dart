class Todo {

  Todo({
    this.id,
    this.todo,
    this.userID,
    this.isCompleted,
  });

int? id;
String? todo;
int? userID;
bool? isCompleted;

// From Json
Todo.fromJson(Map<String, dynamic> json) {
id = json['id'];
todo = json['todo'];
userID = json['userId'];
isCompleted = json['completed'];
}
// To json
Map<String, dynamic> toJson() {
final Map<String, dynamic> data={};
data['id'] = id;
data['todo'] = todo;
data['userID'] = userID;
data['isCompleted'] = isCompleted;
return data;
}


}