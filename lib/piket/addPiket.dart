import 'package:flutter/material.dart';

class AddPiket extends StatefulWidget {
  final String email;
  const AddPiket({ Key? key, required this.email }) : super(key: key);

  @override
  _AddPiketState createState() => _AddPiketState();
}

class _AddPiketState extends State<AddPiket> {
  late TextEditingController _emailController;
  late TextEditingController _dateController;
  late TextEditingController _taskController;

  final List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
    _dateController = TextEditingController();
    _taskController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    print('email parsing ${widget.email}');
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piket Gudang'),
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
                  const Text('Email Anggota'),
                  TextFormField(
                    controller: _emailController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: new Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap Masukkan Email';
                      }
                    },
                  ),
                  const Text('Pilih Tanggal'),
                  TextFormField(
                    controller: _dateController,
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
                  const Text('Tugas Piket'),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _taskController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Tugas Piket',
                            prefixIcon: new Icon(Icons.task),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap Masukkan Tugas Piket';
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white, 
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              _tasks.add(_taskController.text); // Tambahkan tugas ke daftar
                              _taskController.clear(); // Kosongkan input
                            });
                          }
                        }, 
                        child: const Text('Tambah'))
                    ],
                  ),
                  const Text('Daftar Tugas Piket'),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            _tasks[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddPiket(email: widget.email)
                              ),
                            );
                          },
                        )
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}