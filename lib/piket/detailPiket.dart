import 'package:flutter/material.dart';

class DetailPiket extends StatefulWidget {
  
  final String email;
  final String date;
  final String task;

  const DetailPiket({ Key? key, required this.email, required this.date, required this.task }) : super(key: key);

  @override
  _DetailPiketState createState() => _DetailPiketState();
}

class _DetailPiketState extends State<DetailPiket> {
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

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}