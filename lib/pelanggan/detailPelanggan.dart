import 'dart:math';

import 'package:flutter/material.dart';

class DetailPelanggan extends StatelessWidget {

  final String name;
  final String emailCust;
  final String phone;
  final String address;
  final String provinsi;
  final String kodepos;

const DetailPelanggan({ Key? key, required this.phone, required this.address, required this.provinsi, required this.kodepos, required this.name, required this.emailCust }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final _formkey = GlobalKey<FormState>();
    final TextEditingController _addressController = TextEditingController(text: address);
    final TextEditingController _provinsiController = TextEditingController(text: provinsi);
    final TextEditingController _kodeposController = TextEditingController(text: kodepos);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pelanggan'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/man.png',
                      height: 100,
                      width: 100,
                  ),
                  Text('$name'),
                  Text('$emailCust'),
                  Text('$phone'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      prefixIcon: const Icon(Icons.home),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat Kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _provinsiController,
                              decoration: InputDecoration(
                                labelText: 'Provinsi',
                                prefixIcon: const Icon(Icons.flag_circle_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap Masukkan Provinsi';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _kodeposController,
                              decoration: InputDecoration(
                                labelText: 'Kode Pos',
                                prefixIcon: const Icon(Icons.newspaper_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap Masukkan Kode Pos';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white, 
                      ),
                    onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        Navigator.popAndPushNamed(context, '/pelanggan');
                      }
                    }, 
                    child: const Text('Kembali'),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}