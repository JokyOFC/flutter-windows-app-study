import 'package:app_teste/screens/task_editor.dart';
import 'package:app_teste/screens/task_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../objectbox.g.dart';
import 'models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box<TaskModel>? taskBox;

  Stream<List<TaskModel>>? fetchAllTask;

  @override
  void initState() {
    super.initState();
    taskBox = objectBox.store.box<TaskModel>();
    print(taskBox!.count());
    setState(() {
      fetchAllTask = taskBox!
          .query()
          .watch(triggerImmediately: true)
          .map((event) => event.find());
    });
  }

  @override
  void dispose() {
    objectBox.store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(18.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Welcome back!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskEditorScreen()));
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add a new Task"))
                ],
              ),
              Divider(
                color: Colors.white12,
              ),
              StreamBuilder<List<TaskModel>>(
                  stream: fetchAllTask,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                            child: Column(
                                children: snapshot.data!
                                    .map((e) => TaskWidget(e))
                                    .toList()));
                      }
                    }
                    return Center();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
