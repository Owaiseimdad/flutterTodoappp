import 'package:hive/hive.dart';

class ToDoData {
  // initial Box
  List todoList = [];

  // reference our box
  final _myBox = Hive.box("myBox");

  // Run this method for first time users
  void createInitialData() {
    todoList = [
      ['make tutorial', false],
      ['make tutorial - 1', false]
    ];
  }

  // load from data base...
  void loadData() {
    todoList = _myBox.get("ToDoList");
  }

  // update the database...
  void updateDatabase() {
    _myBox.put("ToDoList", todoList);
  }
}
