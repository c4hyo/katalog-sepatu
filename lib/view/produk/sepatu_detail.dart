import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/config/helper.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/produk_controlller.dart';
import 'package:pos_sepatu/view/produk/sepatu_update.dart';

class SepatuDetailView extends GetView<ProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final index = controller.listSepatu.indexWhere((element) =>
                  element.sepatuId == controller.detailSepatu.value.sepatuId);
              controller.deleteSepatu(index);
              Get.back();
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                () => SepatuUpdateView(),
                binding: ProdukBindings(),
              );
            },
            icon: Icon(
              Icons.update,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: paddingList,
              child: Text(
                controller.detailSepatu.value.merk! +
                    " ~ " +
                    controller.detailSepatu.value.seri!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: Get.size.width * 0.75,
              width: Get.size.width,
              child: Text("Buat Gambar"),
            ),
            Container(
              padding: paddingList,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text("Bahan : ${controller.detailSepatu.value.bahan}"),
                  Text(controller.detailSepatu.value.deskripsi!.capitalize!),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Harga",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    rupiah(controller.detailSepatu.value.harga!),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tahun Produksi",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    controller.detailSepatu.value.tahunProduksi.toString(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Size"),
                            Text(
                              controller.detailSepatu.value.ukuran.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Warna"),
                            CircleAvatar(
                              backgroundColor: getWarnaSepatu(
                                  controller.detailSepatu.value.warna!),
                              radius: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Stok"),
                            Text(
                              controller.detailSepatu.value.stok.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
