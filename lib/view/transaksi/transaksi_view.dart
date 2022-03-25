import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/config/helper.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/home_controller.dart';
import 'package:pos_sepatu/controller/transaksi_controller.dart';
import 'package:pos_sepatu/model/sepatu.dart';
import 'package:pos_sepatu/model/transaksi.dart';

class TransaksiView extends GetView<TransaksiController> {
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingList,
        child: ListView(
          children: [
            Text("Transaksi"),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: homeC.keranjang.length,
                itemBuilder: (_, i) {
                  ProdukTransaksiModel ptm = homeC.keranjang[i];
                  final index = homeC.listSepatu.indexWhere(
                      (element) => element.sepatuId == ptm.produkId);
                  SepatuModel sm = homeC.listSepatu[index];
                  return _cardKeranjang(ptm, sm, i, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardKeranjang(
      ProdukTransaksiModel ptm, SepatuModel sm, int index, int indexSepatu) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: paddingList,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sm.merk! + " ~ " + sm.seri!,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text("Ukuran : ${sm.ukuran}"),
                      Text(
                        rupiah(ptm.hargaTotal!),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 6,
              ),
              Expanded(
                child: Container(
                  height: Get.size.width * 0.25,
                  width: Get.size.width * 0.35,
                  color: Colors.amber,
                ),
                flex: 4,
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (homeC.keranjang[index].qty! <= 1) {
                    Get.defaultDialog(
                      title: "Peringatan!!!",
                      middleText: "Apakah ${sm.merk} ${sm.seri} akan dihapus ?",
                      confirm: ElevatedButton(
                        style: borderButton,
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Tidak",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      cancel: ElevatedButton(
                        onPressed: () {
                          homeC.keranjang.removeAt(indexSepatu);
                          Get.back();
                        },
                        child: Text("Ya"),
                      ),
                    );
                  } else {
                    homeC.keranjang[index].qty =
                        homeC.keranjang[index].qty! - 1;
                    homeC.keranjang[index].hargaTotal =
                        homeC.keranjang[index].qty! *
                            homeC.keranjang[index].hargaAsli!;
                    homeC.keranjang.refresh();
                  }
                },
                icon: Icon(
                  homeC.keranjang[index].qty == 1 ? Icons.delete : Icons.remove,
                ),
              ),
              Text(ptm.qty.toString()),
              IconButton(
                onPressed: () {
                  homeC.keranjang[index].qty = homeC.keranjang[index].qty! + 1;
                  homeC.keranjang[index].hargaTotal =
                      homeC.keranjang[index].qty! *
                          homeC.keranjang[index].hargaAsli!;
                  homeC.keranjang.refresh();
                },
                icon: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
