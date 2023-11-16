import 'package:flutter/material.dart';

class Statefull extends StatefulWidget {
  const Statefull({super.key});

  @override
  State<Statefull> createState() => _StatefullState();
}

class _StatefullState extends State<Statefull> {
  // Primary Key data
  int indexData = 0;

  // List data dengan struktur object, bukan array
  Map<int, Widget> listCard = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Statefull Widget'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listCard.length,
        itemBuilder: (context, index) {
          int key = listCard.keys.elementAt(index);
          return listCard[key];
        },
      ),
      // body: listCardWidget(dataKe: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listCard[indexData] = listCardWidget(dataKe: indexData++);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget listCardWidget({dataKe = 1}) {
    // Custom Widget
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const FlutterLogo(size: 56.0),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('List Data'),
                  Text('Ini Data Ke-$dataKe'),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                listCard.remove(dataKe);
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.delete_outline),
            ),
          ),
        ],
      ),
    );

    // Widget Card bawaan flutter
    return Card(
      child: ListTile(
        leading: const FlutterLogo(size: 56.0),
        title: const Text('List Data'),
        subtitle: Text('Ini Data Ke-$dataKe'),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              listCard.remove(dataKe);
            });
          },
          // ignore: prefer_const_constructors
          child: Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
