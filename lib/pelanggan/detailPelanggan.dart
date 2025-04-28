import 'package:flutter/material.dart';

class DetailPelanggan extends StatelessWidget {
const DetailPelanggan({ Key? key, required emailCust, required phone, required address, required provinsi, required kodepos, required name }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pelanggan'),
      ),
      body: Container(),
    );
  }
}