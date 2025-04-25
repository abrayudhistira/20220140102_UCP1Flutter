import 'package:flutter/material.dart';
import 'package:ucp1/dashboard/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                "Selamat Datang Kembali",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Email'),
              TextFormField(
                controller: _emailController,
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
              const SizedBox(
                height: 50,
              ),
              const Text('Password'),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Passsword',
                  prefixIcon: new Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = ! _obscurePassword;
                      });
                    }, 
                    icon: _obscurePassword
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap Masukkan Email';
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (context) => const HomePage()));
                      }
                    }, 
                    child: const Text('Masuk'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Belum memiliki akun? Silahkan'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => const))
                    }, 
                    child: child)
                ],
              ),
            ],
          ),
          ),
        ),
    );
  }
}