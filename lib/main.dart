import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/dashboard/homePage.dart';
import 'package:ucp1/login/loginPage.dart';
import 'package:ucp1/login/register.dart';

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
        '/login' : (context) => const LoginPage(),
        '/register' : (context) => const Register(),
      },
    );
  }
}
