import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/bindings/transaksi_bindings.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/home_controller.dart';
import 'package:pos_sepatu/view/produk/sepatu_list.dart';
import 'package:pos_sepatu/view/transaksi/transaksi_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Container(
            height: Get.size.height * 0.6,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: Get.size.height * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(
                        Get.size.width / 2,
                        Get.size.height * 0.075,
                      ),
                      bottomRight: Radius.elliptical(
                        Get.size.width / 2,
                        Get.size.height * 0.075,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.size.height * 0.35,
                  width: double.infinity,
                  color: primaryColor,
                  child: Column(
                    children: [
                      Obx(
                        () => Card(
                          child:
                              Text("Sepatu : ${controller.listSepatu.length}"),
                        ),
                      ),
                      Obx(
                        () => Card(
                          child: Text(
                              "Transaksi : ${controller.listTransaksi.length}"),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      child: Container(
                        height: Get.size.height * 0.25,
                        width: Get.size.width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  TransaksiView(),
                                  binding: TransaksiBindings(),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.calculate,
                                    ),
                                  ),
                                  Text("Transaksi Sekarang"),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => SepatuListView(),
                                      binding: ProdukBindings(),
                                    );
                                  },
                                  child: Container(
                                    width: Get.size.width * 0.25,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: Icon(
                                            Icons.business_sharp,
                                          ),
                                        ),
                                        Text("Sepatu"),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.size.width * 0.25,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.monetization_on,
                                        ),
                                      ),
                                      Text("Transaksi"),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.size.width * 0.25,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.settings,
                                        ),
                                      ),
                                      Text("Pengaturan"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
