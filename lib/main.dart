import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/dashboard/homePage.dart';
import 'package:ucp1/login/loginPage.dart';
import 'package:ucp1/login/register.dart';
import 'package:ucp1/pelanggan/addPelanggan.dart';
import 'package:ucp1/pelanggan/detailPelanggan.dart';
import 'package:ucp1/piket/addPiket.dart';
import 'package:ucp1/piket/detailPiket.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/' : (context) {
          final email = ModalRoute.of(context)?.settings.arguments as String;
          return HomePage(email: email);
        },
        '/piket' : (context) {
          final email = ModalRoute.of(context)?.settings.arguments as String;
          return AddPiket(email: email);
        },
        '/piket/detailPiket': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          return DetailPiket(
            email: args['email'],
            date: args['date'],
            task: args['task'],
          );
        },
        '/pelanggan' : (context) {
          return const AddPelanggan();
        },
        '/piket/detailPelanggan': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          return DetailPelanggan(
            name: args['name'],
            emailCust: args['email'],
            phone: args['phone'],
            address: args['address'],
            provinsi: args['provinsi'],
            kodepos: args['kodepos'],
          );
        },
        '/login' : (context) => const LoginPage(),
        '/register' : (context) => const Register(),
      },
    );
  }
}
