import 'package:flutter/material.dart';

enum TodoEvent {add, remove, toggle}

class Todo{
  final String title;
  final bool completed;

  Todo({required this.title, this.completed = false});
}

class TodoState{
  final List<Todo> items;

  TodoState({required this.items});
  
}

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  @override
  TodoState get initialState => TodoState(items: []);
  
  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event == TodoEvent.add){
      yield TodoState(items: List.from(state.items)..add(Todo(title: 'New item'))); //UP TO HERE, POINT 7.
    }
  }
}
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Material App Bar'),
        // ),
        body: const Text('To-Do List',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
        ),
      
    );
  }
}