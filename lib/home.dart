import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_app/model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasksList = [];
  final _todoController = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> saveData() async {
    List<Map<String, dynamic>> tasksAsJson = [];
    List<String> tasksAsString = [];

    for (var element in tasksList) {
      tasksAsJson.add(element.toJson());
    }

    for (var element in tasksAsJson) {
      tasksAsString.add(jsonEncode(element));
    }
    final prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList("tasks", tasksAsString);
    print("save data======== $res ");
  }

  Future<void> getData() async {
    List<String> tasksAsString = [];
    List<Map<String, dynamic>> tasksAsJson = [];

    tasksList.clear();
    final prefs = await SharedPreferences.getInstance();

    tasksAsString = prefs.getStringList("tasks") ?? [];

    for (var element in tasksAsString) {
      tasksAsJson.add(jsonDecode(element));
    }

    setState(() {
      for (var element in tasksAsJson) {
        tasksList.add(Task.fromJson(element));
      }
    });
    print('object');
  }

  void _addToDoItem(String toDo) {
    setState(() {
      var newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: toDo,
      );
      tasksList.add(newTask);
      saveData();
    });
    _todoController.clear();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      tasksList.removeWhere((item) => item.id == id);
    });
    saveData();
  }

  void _handleToDoChange(Task todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    saveData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              // isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 99, 16, 110),
                              fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: _todoController,
                          autofocus: true,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            _addToDoItem(_todoController.text);
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text("Add"),
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 156, 82, 206),
                            primary: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ));
        },
        backgroundColor: Color.fromARGB(255, 99, 16, 110),
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 156, 82, 206),
      /*appBar: AppBar(
        title: Text(
          'ToDayDo',
          style: TextStyle(
              color: Color.fromARGB(255, 156, 82, 206),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),*/
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'ToDayDO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              '4 tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: tasksList.reversed.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Checkbox(
                              activeColor: Color.fromARGB(255, 156, 82, 206),
                              value: true,
                              onChanged: (value) {
                                _handleToDoChange(tasksList[index]);
                              }),
                          title: Text(tasksList[index].title),
                          trailing: IconButton(
                              onPressed: () {
                                _deleteToDoItem(tasksList[index].id);
                              },
                              icon: Icon(Icons.dangerous)),
                        );
                      })
                  //  ListView(

                  //   children: [
                  //     ListTile(
                  //     ,
                  //       title: ,
                  //       trailing:
                  //     ),
                  //     ListTile(
                  //       title: Text('go shopping'),
                  //       trailing: Checkbox(
                  //         value: false,
                  //         onChanged: null,
                  //       ),
                  //     ),
                  //     ListTile(
                  //       title: Text('go shopping'),
                  //       trailing: Checkbox(
                  //         value: false,
                  //         onChanged: null,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
