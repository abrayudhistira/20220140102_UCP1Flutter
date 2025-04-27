import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPiket extends StatelessWidget {

  final String email;
  final String date;
  final String task;

  const DetailPiket({ Key? key, required this.email, required this.date, required this.task }) : super(key: key);

  String formatDate(String date) {
    try {
      DateTime parsedDate = DateFormat('d-M-yyyy').parse(date);
      return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
    } catch (e) {
      return 'Format tanggal tidak valid';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Text(
                    '$email',
                  ),
                  Text(
                    '${formatDate(date)}',
                  ),
                  Text(
                    '$task',
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}