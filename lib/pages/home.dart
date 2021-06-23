import 'package:flutter/material.dart';
import 'package:flutter_band_names/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Metallicas verdes', votes: 5),
    Band(id: '3', name: 'Cualquier cosa', votes: 5),
    Band(id: '4', name: 'Anything', votes: 5),
    Band(id: '5', name: 'Anything Else', votes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BandName',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(band.name.substring(0, 2)),
      ),
      title: Text(band.name),
      trailing: Text(
        '${band.votes}',
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () {
        print(band.name);
      },
    );
  }
}
