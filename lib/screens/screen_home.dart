import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final List<String> _todoListItems = ["as", "asdasdasd"];

  final TextEditingController _todoInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _todoInputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Todo .......',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _clickOnAdd();
              _todoInputController.clear();
              // print(_todoInputController.text);
            },
            child: const Text("ADD"),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                        child: ListTile(
                            title: Text(_todoListItems[index]),
                            trailing: IconButton(
                              onPressed: () {
                                _deleteButton(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ))),
                  );
                },
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: _todoListItems.length),
          ),
        ],
      ),
    );
  }

  Future<void> _clickOnAdd() async {
    setState(() {
      _todoListItems.add(_todoInputController.text);
    });
  }

  _deleteButton(index) {
    setState(() {
      _todoListItems.removeAt(index);
    });
  }
}
