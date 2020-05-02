class HomeRepository {
  Future<List<TaskModel>> getItems() async => Future.value(
        List<TaskModel>.generate(
          5,
          (index) => TaskModel('Task $index', false),
        ),
      );
}

class TaskModel {
  TaskModel(this.title, this.completed);

  final String title;
  final bool completed;
}
