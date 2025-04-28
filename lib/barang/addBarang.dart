import 'package:flutter/material.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({ Key? key }) : super(key: key);

  @override
  _AddBarangState createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {

  late TextEditingController _dateController;
  late TextEditingController _jumlahBarangController;
  late TextEditingController _hargaSatuanController;

  final List<String> jenisTransaksiList = <String>['Barang Masuk', 'Barang Keluar'];
  String? _selectedJenisTransaksi;

  final List<String> jenisBarangList = <String>['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];
  String? _selectedJenisBarang;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _jumlahBarangController = TextEditingController();
    _hargaSatuanController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _jumlahBarangController.dispose();
    _hargaSatuanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendataan Barang'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      labelText: 'Pilih Tanggal',
                      prefixIcon: new Icon(Icons.calendar_month_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                        setState(() {
                          _dateController.text = formattedDate;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap Masukkan Tanggal';
                      }
                    },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _selectedJenisTransaksi,
                  decoration: InputDecoration(
                    labelText: 'Pilih Jenis Transaksi',
                    prefixIcon: const Icon(Icons.filter_1_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  items: jenisTransaksiList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedJenisTransaksi = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Pilih Jenis Transaksi';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _selectedJenisBarang,
                  decoration: InputDecoration(
                    labelText: 'Pilih Jenis Barang',
                    prefixIcon: const Icon(Icons.shopping_bag_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  items: jenisBarangList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedJenisBarang = newValue!;
                      if (newValue == 'Carrier') {
                        _hargaSatuanController.text = '250000';
                      } else if (newValue == 'Sleeping Bag') {
                        _hargaSatuanController.text = '150000';
                      } else if (newValue == 'Tenda') {
                        _hargaSatuanController.text = '500000';
                      } else if (newValue == 'Sepatu') {
                        _hargaSatuanController.text = '300000';
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Pilih Jenis Transaksi';
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
                            controller: _jumlahBarangController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Jumlah Barang',
                              prefixIcon: const Icon(Icons.list_alt_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harap Masukkan Jumlah Barang';
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
                            controller: _hargaSatuanController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Harga Satuan',
                              prefixIcon: const Icon(Icons.list_alt_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harga Kosong';
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
                  height: 80,
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
                      print('Date: ${_dateController.text}');
                      print('Jenis Transaksi: $_selectedJenisTransaksi');
                      print('Jenis Barang: $_selectedJenisBarang');
                      print('Jumlah Barang: ${_jumlahBarangController.text}');
                      print('Harga Satuan: ${_hargaSatuanController.text}');
                      Navigator.pushNamed(
                        context, 
                      '/barang/detailBarang',
                      arguments: {
                        'date': _dateController.text,
                        'jenisTransaksi': _selectedJenisTransaksi,
                        'jenisBarang': _selectedJenisBarang,
                        'jumlahBarang': _jumlahBarangController.text,
                        'hargaSatuan': _hargaSatuanController.text,
                      },
                    );
                    }
                  }, 
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}