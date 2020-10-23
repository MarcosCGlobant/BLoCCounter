import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/src/bloc/counter_bloc.dart';

import 'src/bloc/contract/bloc.dart';
import 'src/screen/counter/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _blocs = <Bloc>[];

  @override
  void initState() {
    super.initState();
    CounterBloc bloc = CounterBloc();
    _blocs.add(bloc);
    _blocs.forEach((bloc) {
      bloc.initialize();
    });
  }

  @override
  void dispose() {
    _blocs.forEach((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  T getDesireBloc<T extends Bloc>() {
    return _blocs.firstWhere(
      (bloc) {
        return (bloc is T);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterScreen(title: 'Flutter BLoC Counter', counterBloc: getDesireBloc<CounterBloc>()),
    );
  }
}
