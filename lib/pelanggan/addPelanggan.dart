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
                  onPressed: (){}, 
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
                        foregroundColor: Colors.black, 
                      ),
                  onPressed: (){}, 
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