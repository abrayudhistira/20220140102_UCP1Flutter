import 'package:flutter/material.dart';

class AddPelanggan extends StatefulWidget {
  const AddPelanggan({ Key? key }) : super(key: key);

  @override
  _AddPelangganState createState() => _AddPelangganState();
}

class _AddPelangganState extends State<AddPelanggan> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _kodeposController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pelanggan'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                const Text('Nama Customer'),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Customer',
                    prefixIcon: const Icon(Icons.list_alt_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Masukkan Nama';
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
                          const Text('Email'),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.list_alt_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harap Masukkan Email';
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
                          const Text('No HP'),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'No HP',
                              prefixIcon: const Icon(Icons.list_alt_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harap Masukkan No HP';
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
                  height: 20,
                ),
                const Text('Alamat'),
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
                      return 'Harap Masukkan Alamat';
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
                          const Text('Provinsi'),
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
                          const Text('Kode Pos'),
                          TextFormField(
                            controller: _kodeposController,
                            keyboardType: TextInputType.number,
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
                  height: 200,
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
                      Navigator.pushNamed(
                        context,
                        '/pelanggan/detailPelanggan',
                        arguments: {
                          'name': _nameController.text,
                          'email': _emailController.text,
                          'phone': _phoneController.text,
                          'address': _addressController.text,
                          'provinsi': _provinsiController.text,
                          'kodepos': _kodeposController.text,
                        },
                      );
                    }
                  }, 
                  child: const Text('Simpan'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepOrange, 
                      ),
                  onPressed: (){
                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _addressController.clear();
                    _provinsiController.clear();
                    _kodeposController.clear();
                  }, 
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}