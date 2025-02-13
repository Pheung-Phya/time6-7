import 'package:flutter/material.dart';

class ListTileAndCard extends StatelessWidget {
  const ListTileAndCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('ListTile and Card'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.search),
                  label: const Text("Enter To Search"),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Image.asset('assets/food.png'),
              ),
              title: const Text('Sting'),
              subtitle: const Text('Good for cut leg'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Image.asset('assets/food.png'),
              ),
              title: const Text('Sting'),
              subtitle: const Text('Good for cut leg'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Image.asset('assets/food.png'),
            ),
            title: const Text('Sting'),
            subtitle: const Text('Good for cut leg'),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Image.asset('assets/food.png'),
            ),
            title: const Text('Sting'),
            subtitle: const Text('Good for cut leg'),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(
                  'assets/food.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
