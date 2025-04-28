import 'package:flutter/material.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({ Key? key }) : super(key: key);

  @override
  _AddBarangState createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
    );
  }
}