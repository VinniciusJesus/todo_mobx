import 'package:mobx/mobx.dart';
import 'package:todo_mobx/models/task.dart';

part 'task_mob.g.dart';

class TaskMob = _TaskMobBase with _$TaskMob;

abstract class _TaskMobBase with Store {
  @observable
  List<Task>? taskList;

  @computed
  bool get anyTaskList => taskList == null ? false : true;

  @action
  Future<void> addTask(Task task) async {
    if (taskList == null) {
      taskList = [];
    }
    taskList?.add(task);
  }
}
