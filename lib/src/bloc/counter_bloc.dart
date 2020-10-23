import 'dart:async';

import 'package:flutter_bloc_counter/src/bloc/contract/bloc.dart';

import '../screen/counter/counter_event.dart';

class CounterBloc extends Bloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    switch (event) {
      case CounterEvent.resetEvent:
        _counter = 0;
        break;
      case CounterEvent.increaseEvent:
        _counter++;
        break;
      case CounterEvent.decreaseEvent:
        _counter--;
        break;
    }
    _inCounter.add(_counter);
  }

  @override
  void initialize() {}

  @override
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
