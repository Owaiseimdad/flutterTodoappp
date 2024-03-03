import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,
      required this.deleteTask});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChange;
  Function(BuildContext?) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: deleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(18),
              )
            ]),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChange,
                  activeColor: Colors.black,
                ),

                //task title
                Text(taskName,
                    style: GoogleFonts.teko(
                        fontSize: 20,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none))
              ]),
              decoration: BoxDecoration(
                  color: Color.fromARGB(96, 8, 93, 163),
                  borderRadius: BorderRadius.circular(12)),
            )));
  }
}
