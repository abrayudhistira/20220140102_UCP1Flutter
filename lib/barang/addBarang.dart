import 'package:flutter/material.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({ Key? key }) : super(key: key);

  @override
  _AddBarangState createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {

  late TextEditingController _dateController;

  final List<String> jenisTransaksiList = <String>['Barang Masuk', 'Barang Keluar'];
  String? _selectedJenisTransaksi;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}