import 'package:flutter/material.dart';

class DetailPiket extends StatefulWidget {
  const DetailPiket({ Key? key }) : super(key: key);

  @override
  _DetailPiketState createState() => _DetailPiketState();
}

class _DetailPiketState extends State<DetailPiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Form(child: child)
      
    );
  }
}