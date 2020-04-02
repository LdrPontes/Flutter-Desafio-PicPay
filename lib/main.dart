import 'package:desafio_picpay/app/view/list_users/ListUsersPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) =>  ListUsersPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Desafio PicPay',
        theme: ThemeData(
          accentColor: Colors.white,
          cursorColor: Colors.white,
        ));
  }
}
