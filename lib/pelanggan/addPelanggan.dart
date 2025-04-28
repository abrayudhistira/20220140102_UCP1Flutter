import 'package:flutter/material.dart';

class AddPelanggan extends StatefulWidget {
  const AddPelanggan({ Key? key }) : super(key: key);

  @override
  _AddPelangganState createState() => _AddPelangganState();
}

class _AddPelangganState extends State<AddPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pelanggan'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(),
    );
  }
}