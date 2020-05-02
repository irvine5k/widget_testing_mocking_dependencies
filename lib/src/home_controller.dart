import 'package:flutter/material.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_repository.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController(this.homeRepository) : super() {
    _init();
  }

  List<TaskModel> items;

  void _init() async {
    items = await homeRepository.getItems();
    notifyListeners();
  }
}
