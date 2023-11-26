// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskMobx on TaskMobxBase, Store {
  late final _$tasksAtom = Atom(name: 'TaskMobxBase.tasks', context: context);

  @override
  ObservableList<String> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<String> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$saveTasksAsyncAction =
      AsyncAction('TaskMobxBase.saveTasks', context: context);

  @override
  Future<void> saveTasks() {
    return _$saveTasksAsyncAction.run(() => super.saveTasks());
  }

  late final _$loadTasksAsyncAction =
      AsyncAction('TaskMobxBase.loadTasks', context: context);

  @override
  Future<void> loadTasks() {
    return _$loadTasksAsyncAction.run(() => super.loadTasks());
  }

  late final _$TaskMobxBaseActionController =
      ActionController(name: 'TaskMobxBase', context: context);

  @override
  void addTask(String task) {
    final _$actionInfo = _$TaskMobxBaseActionController.startAction(
        name: 'TaskMobxBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$TaskMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask(int index, String updatedTask) {
    final _$actionInfo = _$TaskMobxBaseActionController.startAction(
        name: 'TaskMobxBase.editTask');
    try {
      return super.editTask(index, updatedTask);
    } finally {
      _$TaskMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo = _$TaskMobxBaseActionController.startAction(
        name: 'TaskMobxBase.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$TaskMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
