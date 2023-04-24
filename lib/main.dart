import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_test/Stores/mobx_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final mobxStore = MobXStore();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
                builder: (_) => Text(
                      "${mobxStore.counter}",
                      style: const TextStyle(fontSize: 40),
                    ))
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              mobxStore.minimize();
            },
            tooltip: "Minimize",
            child: const Icon(Icons.minimize_rounded),
          ),
          const SizedBox(
            width: 6,
          ),
          FloatingActionButton(
            onPressed: () {
              mobxStore.increment();
            },
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
