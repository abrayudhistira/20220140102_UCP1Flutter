import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBarang extends StatelessWidget { 

  final String date;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;

const DetailBarang({ Key? key, required this.date, required this.jenisTransaksi, required this.jenisBarang, required this.jumlahBarang, required this.hargaSatuan }) : super(key: key);

  String formatDate(String date) {
    try {
      DateTime parsedDate = DateFormat('d-M-yyyy').parse(date);
      return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
    } catch (e) {
      return 'Format tanggal tidak valid';
    }
  }

  String calculateTotalHarga(String jumlahBarang, String hargaSatuan) {
    try {
      int jumlah = int.parse(jumlahBarang);
      int harga = int.parse(hargaSatuan);
      int total = jumlah * harga;
      return total.toString();
    } catch (e) {
      return 'Perhitungan tidak valid';
    }
  }

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
                  Image.asset(
                    'assets/images/done-image.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Data Berhasil Disimpan'),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Tanggal'),
                      const SizedBox(
                        width: 160,
                      ),
                      Text(formatDate(date))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Jenis Transaksi'),
                      const SizedBox(
                        width: 140,
                      ),
                      Text('$jenisTransaksi')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Jenis Barang'),
                      const SizedBox(
                        width: 160,
                      ),
                      Text('$jenisBarang')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Jumlah Barang'),
                      const SizedBox(
                        width: 200,
                      ),
                      Text('$jumlahBarang')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Jenis Harga Satuan'),
                      const SizedBox(
                        width: 150,
                      ),
                      Text('$hargaSatuan')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Total Harga'),
                      const SizedBox(
                        width: 200,
                      ),
                      Text(calculateTotalHarga(jumlahBarang, hargaSatuan)),
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
                      Navigator.pop(context, '/pelanggan');
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