import 'package:flutter/material.dart';

class GridAll extends StatelessWidget {
  const GridAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid All'),
        ),
        body: GridView.extent(
            maxCrossAxisExtent: 200,
            children: List.generate(
                10,
                (index) => Container(
                      margin: const EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Text('Item $index'),
                          const SizedBox(height: 10),
                          Text('Subitem $index'),
                          const SizedBox(height: 10),
                          Text('Subitem $index'),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )))
        // GridView.count(
        //   childAspectRatio: 0.6,
        //   crossAxisCount: 2,
        //   children: List.generate(
        //       10,
        //       (index) => Container(
        //             margin: const EdgeInsets.all(8),
        //             color: Colors.amber,
        //           )),
        // )

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: GridView.custom(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        //       childrenDelegate: SliverChildListDelegate([
        //         Container(
        //           color: Colors.red,
        //         ),
        //         Container(
        //           color: Colors.green,
        //         ),
        //         Container(
        //           color: Colors.blue,
        //         ),
        //         Container(
        //           color: Colors.yellow,
        //         ),
        //         Container(
        //           color: Colors.orange,
        //         ),
        //         Container(
        //           color: Colors.purple,
        //         ),
        //         Container(
        //           color: Colors.pink,
        //         ),
        //         Container(
        //           color: Colors.brown,
        //         ),
        //         Container(
        //           color: Colors.teal,
        //         ),
        //         Container(
        //           color: Colors.cyan,
        //         ),
        //         Container(
        //           color: Colors.lightGreen,
        //         ),
        //         Container(
        //           color: Colors.amber,
        //         ),
        //         Container(
        //           color: Colors.deepOrange,
        //         ),
        //         Container(
        //           color: Colors.lightBlue,
        //         ),
        //         Container(
        //           color: Colors.deepPurple,
        //         ),
        //         Container(
        //           color: Colors.lime,
        //         ),
        //       ])),
        // )

        // GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 15),
        //     itemCount: 20,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         color: Colors.blue,
        //       );
        //     }),
        );
  }
}
