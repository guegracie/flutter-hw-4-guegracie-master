import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task extends StatelessWidget {
  final String title;
  final bool state;
  final ValueChanged<bool> onChanged;
  Task({Key key, this.title, this.state, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
      value: state,
      onChanged: onChanged,
      activeColor: Colors.teal,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontStyle: state ? FontStyle.italic : FontStyle.normal,
          color: state ? Colors.grey : Colors.black,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        taskTitles: [
          'Understand Code',
          'Figure out duplication',
          'Refactor',
          'Add comments',
          'commit code',
          'push to github',
        ],
        taskStates: [
          true,
          false,
          true,
          false,
          false,
          false,
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> taskTitles;
  final List<bool> taskStates;
  MyHomePage({Key key, this.taskTitles, this.taskStates}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Your Tasks'),
      ),
      body: Container(
        color: Colors.teal,
        // REFACTOR INTO ListView.builder
        child: ListView.builder(
          itemCount: widget.taskTitles.length,
          itemBuilder: (context, index) {
            return Task(
              title: widget.taskTitles[index],
              state: widget.taskStates[index],
              onChanged: (newValue) {
                setState(() {
                  widget.taskStates[index] = newValue;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
