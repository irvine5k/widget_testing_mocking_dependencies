import 'dart:async';

class StreamBasedLogic {
  final _streamController = StreamController<ResultState>();

  Stream<ResultState> get state => _streamController.stream;

  void addState(ResultState state) => _streamController.sink.add(state);

  void dispose() {
    _streamController.close();
  }
}

class ResultState {
  final bool success;
  final String errorMessage;

  ResultState(this.success, this.errorMessage);
}
