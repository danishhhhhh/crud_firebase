import 'package:crud_project/todo_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController updatedTitle = TextEditingController();
  TextEditingController updatedNote = TextEditingController();

  final uId = const Uuid();
  final db = FirebaseFirestore.instance;

  RxList<TodoModel> todoList = RxList<TodoModel>();

  void OnInit() {
    super.onInit();
    getTodo();
  }

  Future<void> addTodo() async {
    String id = uId.v4();
    var newTodo = TodoModel(
      id: id,
      title: title.text,
      note: note.text,
    );
    await db.collection("todo").doc(id).set(newTodo.toJson());
    title.clear();
    note.clear();
    getTodo();
  }

  Future<void> getTodo() async {
    todoList.clear();
    await db.collection("todo").get().then((allTodo) {
      for (var todo in allTodo.docs) {
        todoList.add(
          TodoModel.fromJson(
            todo.data(),
          ),
        );
      }
    });
  }

  Future<void> deleteTodo(String id) async {
    await db.collection("todo").doc(id).delete();
    getTodo();
  }

  Future<void> updateTodo(TodoModel todo) async {
    var updatedTodo = TodoModel(id: todo.id, title: updatedTitle.text, note: updatedNote.text);
    await db.collection("todo").doc(todo.id).set(updatedTodo.toJson());
    getTodo();
    Get.back();
  }
}