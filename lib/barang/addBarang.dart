import 'package:flutter/material.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({ Key? key }) : super(key: key);

  @override
  _AddBarangState createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendataan Barang'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                const Text('Tanggal Transaksi'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}