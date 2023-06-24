import 'package:flutter/material.dart';
import 'package:value_notify/counter_controller.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'My homepage'),
        '/increment-page': (context) => const MyIncrementPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var counterController = CounterController.instance;

  @override
  void initState() {
    super.initState();
    counterController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterController.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: counterController.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: 'increment_page',
            onPressed: () {
              Navigator.pushNamed(context, '/increment-page');
            },
            tooltip: 'Increment page',
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}

class MyIncrementPage extends StatefulWidget {
  const MyIncrementPage({super.key});

  @override
  State<MyIncrementPage> createState() => _MyIncrementPageState();
}

class _MyIncrementPageState extends State<MyIncrementPage> {
  var counterController = CounterController.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counterController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increment page'),
      ),
      body: Center(
        child: Text('The value of the counter is ${counterController.value}'),
      ),
      floatingActionButton:
          IncrementWidget(handleAdd: counterController.increment),
    );
  }
}

class IncrementWidget extends StatelessWidget {
  final Function? handleAdd;

  const IncrementWidget({
    super.key,
    required this.handleAdd,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (handleAdd != null) {
          handleAdd!();
        }
      },
      tooltip: 'increment-btn',
      child: const Icon(Icons.add),
    );
  }
}
