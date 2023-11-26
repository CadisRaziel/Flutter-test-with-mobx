import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'task_mobx.g.dart';

class TaskMobx = TaskMobxBase with _$TaskMobx;

abstract class TaskMobxBase with Store {
  TaskMobxBase() { 
    ///Estado inicial  
    loadTasks();
  }

  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @action
  void addTask(String task) {
    tasks.add(task);
    saveTasks();
  }

  @action
  void editTask(int index, String updatedTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = updatedTask;
      saveTasks();
    }
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  @action
  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks.toList());
  }

  @action
  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTasks = prefs.getStringList('tasks');
    if (savedTasks != null) {
      tasks = ObservableList<String>.of(savedTasks);
    }
  }
}
