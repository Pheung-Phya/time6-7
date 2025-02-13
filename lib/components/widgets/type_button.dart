import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeButton extends StatelessWidget {
  const TypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Type Button'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text('Elaveted Button')),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.tv)),
          CupertinoButton(child: const Text('Cupter Tino'), onPressed: () {}),
          OutlinedButton(
              onPressed: () {}, child: const Text('Outlined Button')),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          MaterialButton(
              onPressed: () {}, child: const Text('Material Button')),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.edit)),
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.camera)),
        ],
      ),
    );
  }
}
