import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/controller/auth_controller.dart';

import '../../config/tema.dart';

class RegisterView extends GetView<AuthController> {
  final email = TextEditingController();
  final password = TextEditingController();
  final nama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        leading: IconButton(
          color: primaryColor,
          onPressed: () {
            controller.loading.value = false;
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: paddingList,
          child: ListView(
            children: [
              // memberi jarak antar widget sebesar 10% dari tinggi layar
              SizedBox(
                height: Get.size.height * 0.03,
              ),
              // menampilkan text "sepostu"
              // posisi berada ditengah
              Center(
                child: Text(
                  "SePosTu",
                  style: TextStyle(
                    // warna primary, font bold berukuran 30
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Registrasi",
                  style: TextStyle(
                    // warna primary, font bold berukuran 30
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              // memberi jarak antar widget sebesar 10% dari tinggi layar
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              // menampilkan text "email"
              // posisi berada ditengah
              Center(
                child: Text(
                  "Nama",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              // 2 widget di dalam row yaitu
              // cirle avatar untuk icon dan textformfield
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      // keyboard yang tampil bertipe email
                      keyboardType: TextInputType.emailAddress,
                      // form ini memiliki controller email
                      controller: nama,
                      decoration: InputDecoration(
                        // border tampil apabila form ditekan atau aktif
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        // tampilan border awal, tanpa menekan form
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              // menampilkan text "email"
              // posisi berada ditengah
              Center(
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              // 2 widget di dalam row yaitu
              // cirle avatar untuk icon dan textformfield
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      // keyboard yang tampil bertipe email
                      keyboardType: TextInputType.emailAddress,
                      // form ini memiliki controller email
                      controller: email,
                      decoration: InputDecoration(
                        // border tampil apabila form ditekan atau aktif
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        // tampilan border awal, tanpa menekan form
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Center(
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      controller:
                          password, // form ini memiliki controller password
                      obscureText: true, // text didalam form akan tampil elips
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Obx(
                () => controller.loading.isFalse // loading sistem login
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // memberi ukuran tombol, lebar sesuai lebar layar device,
                          //dan tinggi sebesar 7.5 % tinggi layar device
                          fixedSize:
                              Size(Get.size.width, Get.size.height * 0.075),
                        ),
                        onPressed: () {},
                        child: Text("REGISTRASI"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              SizedBox(
                height: Get.size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun ? "),
                  InkWell(
                    onTap: () {
                      // menghandle supaya saat kembali ke halaman login,
                      // value loading dalam kondisi false
                      controller.loading.value = false;
                      Get.back();
                    },
                    child: Text(
                      "Kembali login",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
