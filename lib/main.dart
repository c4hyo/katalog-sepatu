import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/auth_bindings.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/bindings/transaksi_bindings.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/app_controller.dart';
import 'package:pos_sepatu/view/auth/login.dart';
import 'package:pos_sepatu/view/home/home.dart';
import 'package:pos_sepatu/view/produk/sepatu_list.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pos_sepatu/view/transaksi/transaksi_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: 'Flutter Demo',
      theme: tema,
      home: HomeView(),
    );
  }
}
