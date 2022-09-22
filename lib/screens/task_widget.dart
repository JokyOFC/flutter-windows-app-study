import 'package:app_teste/screens/models/task_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../objectbox.g.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget(this.task, {Key? key}) : super(key: key);
  TaskModel task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Box<TaskModel> taskBox = objectBox.store.box<TaskModel>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white12,
              )),
          Checkbox(
            side: BorderSide(color: Colors.white),
            value: widget.task.task_done,
            onChanged: (value) {
              widget.task.task_done = value;
              taskBox.put(widget.task);
            },
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, bottom: 5.0),
                  child: Text(
                    widget.task.task_title!,
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                  child: Text(
                    widget.task.task_description!,
                    style: TextStyle(
                      color: Colors.white12,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              taskBox.remove(widget.task.id);
            },
          )
        ],
      ),
    );
  }
}
