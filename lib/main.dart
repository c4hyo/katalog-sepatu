import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/auth_bindings.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/view/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBindings(),
      title: 'Flutter Demo',
      theme: tema,
      home: LoginView(),
    );
  }
}
