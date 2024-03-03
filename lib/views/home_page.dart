import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/data/database.dart';
import 'package:todo_hive/utils/Lists_todo.dart';
import 'package:todo_hive/utils/dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // Check if the user is the first time user in the app.
    if (_myBox.get("ToDoList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // reference the box from hive
  final _myBox = Hive.box("myBox");
  ToDoData db = ToDoData();

  // Text controller
  final _controller = TextEditingController();

  // on change check box
  void checkboxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      print(db.todoList[index][0]);
    });
    db.updateDatabase();
  }

  // save new tasks

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  // creating new tasks
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });

    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ToDo-Tasks"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChange: (value) => checkboxChange(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
