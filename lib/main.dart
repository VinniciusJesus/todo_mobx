import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx/mobx/task_mob.dart';
import 'package:todo_mobx/models/task.dart';

void main() {
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskMob>(
          create: (_) => TaskMob(),
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskmob = context.watch<TaskMob>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Observer(
                  builder: (_) => Container(
                        height: 500,
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  taskmob.addTask(Task(
                                      name: "Task",
                                      description: controller.text,
                                      isDone: false));
                                },
                                child: Text(
                                  "Adicionar tarefa",
                                )),
                          ],
                        ),
                      ));
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) => Container(
          child: taskmob.anyTaskList
              ? Container(
                  height: 1000,
                  width: 200,
                  child: ListView.builder(
                    itemCount: taskmob.taskList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(taskmob.taskList![index].description);
                      return Column(
                        children: [
                          ListTile(
                            title: Text(taskmob.taskList![index].name),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
