class Task {
  int id;
  String title;
  String description;
  String priority;
  bool isComplete;

 
  Task(this.id, this.title, this.description, this.priority, {this.isComplete = false});

 
  void markComplete() {
    if (!isComplete) {
      isComplete = true;
      print('Task "$title" marked as complete.');
    } else {
      print('Task "$title" is already complete.');
    }
  }

 
  void displayTask() {
    print("Task ID: $id");
    print("Task Title: $title");
    print("Task Description: $description");
    print("Task Priority: $priority");
    print("Task is Complete: $isComplete"); 
  }
}

 
class TaskManager {
  List<Task> tasks = []; 
 
  void addTask(Task task) {
    tasks.add(task);
    print('Task "${task.title}" added successfully.');
  }

 
  void removeTask(int id) {
    tasks.removeWhere((task) => task.id == id);
    print('Task with ID $id removed.');
  }

 
  void listTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('All Tasks:');
      for (var task in tasks) {
        task.displayTask();
        print('-------------------');
      }
    }
  }

 
  void listPendingTasks() {
    var pendingTasks = tasks.where((task) => !task.isComplete).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks.');
    } else {
      print('Pending Tasks:');
      for (var task in pendingTasks) {
        task.displayTask();
        print('-------------------');
      }
    }
  }

 
  void markTaskComplete(int id) {
    for (var task in tasks) {
      if (task.id == id) {
        task.markComplete();
        return;
      }
    }
    print('Task with ID $id not found.');
  }
}
 
void main() {
  TaskManager manager = TaskManager();

  Task task1 = Task(1, "Study Dart", "Learn about classes and objects", "High");
  Task task2 = Task(2, "Exercise", "Go for a run", "Medium");
  Task task3 = Task(3, "Read Book", "Finish reading a novel", "Low");

  manager.addTask(task1);
  manager.addTask(task2);
  manager.addTask(task3);

  manager.listTasks();
  manager.markTaskComplete(2);
  manager.listPendingTasks();
  manager.removeTask(3);
  manager.listTasks();
}
