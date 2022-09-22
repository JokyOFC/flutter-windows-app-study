import 'package:app_teste/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../objectbox.g.dart';
import 'models/task_model.dart';

class TaskEditorScreen extends StatefulWidget {
  const TaskEditorScreen({super.key});

  @override
  State<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends State<TaskEditorScreen> {
  Box<TaskModel> taskBox = objectBox.store.box<TaskModel>();

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          elevation: 0.0,
          title: Text("New Task"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _taskTitleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white12),
                      hintText: "Type your title here eg: Get some bitches",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _taskDescriptionController,
                  style: TextStyle(color: Colors.white),
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white12),
                      hintText:
                          "Type your description here eg: Amanda: +1-800-XXX",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        String taskTitle = _taskTitleController.text;
                        String taskDescription =
                            _taskDescriptionController.text;
                        TaskModel model = TaskModel(
                            task_title: taskTitle,
                            task_description: taskDescription,
                            task_done: false,
                            creation_date: DateTime.now());
                        taskBox.put(model);
                        Navigator.pop(context);
                      },
                      color: Colors.blueAccent,
                      child: Text("Save"),
                      elevation: 0.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
