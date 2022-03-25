// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_mob.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskMob on _TaskMobBase, Store {
  Computed<bool>? _$anyTaskListComputed;

  @override
  bool get anyTaskList =>
      (_$anyTaskListComputed ??= Computed<bool>(() => super.anyTaskList,
              name: '_TaskMobBase.anyTaskList'))
          .value;

  final _$taskListAtom = Atom(name: '_TaskMobBase.taskList');

  @override
  List<Task>? get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<Task>? value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  final _$addTaskAsyncAction = AsyncAction('_TaskMobBase.addTask');

  @override
  Future<void> addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
anyTaskList: ${anyTaskList}
    ''';
  }
}
