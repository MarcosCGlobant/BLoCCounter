import 'package:flutter_test/flutter_test.dart';

import '../lib/src/bloc/counter_bloc.dart';
import '../lib/src/screen/counter/counter_event.dart';

void main() {
  test('Counter value should increment', () {
    final counterBloc = CounterBloc();

    counterBloc.counterEventSink.add(CounterEvent.increaseEvent);

    counterBloc.counter.listen(
      expectAsync1(
        (event) {
          expect(event, 1);
        },
      ),
    );
  });

  test('Counter value should decrement', () {
    final counterBloc = CounterBloc();

    counterBloc.counterEventSink.add(CounterEvent.decreaseEvent);

    counterBloc.counter.listen(
      expectAsync1(
        (event) {
          expect(event, -1);
        },
      ),
    );
  });

  test('Counter value should reset', () {
    final counterBloc = CounterBloc();

    counterBloc.counterEventSink.add(CounterEvent.increaseEvent);

    counterBloc.counterEventSink.add(CounterEvent.resetEvent);

    expectLater(counterBloc.counter, emitsInOrder(<int>[1, 0]));
  });
}
