import 'package:flutter/material.dart';

class DetailBarang extends StatelessWidget {
const DetailBarang({ Key? key, required date, required jenisTransaksi, required jenisBarang, required jumlahBarang, required hargaSatuan }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  const Text('Detail Barang')
                ],
              ),
            ),
          ),
        )
        ),
    );
  }
}