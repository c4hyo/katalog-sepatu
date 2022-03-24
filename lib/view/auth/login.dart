import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/auth_bindings.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/auth_controller.dart';
import 'package:pos_sepatu/view/auth/register.dart';

// login view menggunakan auth controller
class LoginView extends GetView<AuthController> {
  final email = TextEditingController(); // controller untuk email
  final password = TextEditingController(); // controller untuk password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // paddingList == EdgeInsets.fromLTRB(20, 10, 20, 10);
          // mengambil di tema
          padding: paddingList,
          // ditampilkan berupa list
          child: ListView(
            children: [
              // memberi jarak antar widget sebesar 10% dari tinggi layar
              SizedBox(
                height: Get.size.height * 0.1,
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
                  "Login",
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
                height: Get.size.height * 0.075,
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
                height: Get.size.height * 0.075,
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
                        child: Text("LOGIN"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),

              SizedBox(
                height: Get.size.height * 0.1,
              ),
              Visibility(
                // widget akan tampil jika dalam kondisi tidak loading
                visible: controller.loading.isFalse,
                child: Row(
                  // widget dibawah row akan ditampil ditengah
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun ? "),
                    InkWell(
                      onTap: () {
                        // menghandle supaya saat pindah ke halaman registrasi,
                        // value loading dalam kondisi false
                        controller.loading.value = false;
                        Get.to(
                          () => RegisterView(),
                          binding: AuthBindings(),
                        );
                      },
                      child: Text(
                        "Registrasi Disini",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
