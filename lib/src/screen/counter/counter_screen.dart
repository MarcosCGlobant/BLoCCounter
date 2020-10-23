import 'package:flutter/material.dart';

import '../../bloc/counter_bloc.dart';
import 'counter_event.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key, this.title, this.counterBloc})
      : assert(counterBloc != null),
        super(key: key);

  final String title;
  final CounterBloc counterBloc;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: widget.counterBloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
        // child:
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => widget.counterBloc.counterEventSink.add(CounterEvent.resetEvent),
            tooltip: 'Reset',
            child: Icon(
              Icons.refresh,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () => widget.counterBloc.counterEventSink.add(CounterEvent.increaseEvent),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () => widget.counterBloc.counterEventSink.add(CounterEvent.decreaseEvent),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
