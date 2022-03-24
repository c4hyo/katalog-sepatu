import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/controller/produk_controlller.dart';

import '../../config/helper.dart';
import '../../config/tema.dart';
import '../../model/sepatu.dart';

class SepatuUpdateView extends GetView<ProdukController> {
  final merk = TextEditingController();
  final harga = TextEditingController();
  final ukuran = TextEditingController();
  final seri = TextEditingController();
  final bahan = TextEditingController();
  final tahunProduksi = TextEditingController();
  final warna = TextEditingController();
  final deskripsi = TextEditingController();
  final stok = TextEditingController();

  @override
  Widget build(BuildContext context) {
    merk.text = controller.detailSepatu.value.merk!;
    harga.text = controller.detailSepatu.value.harga!.toString();
    ukuran.text = controller.detailSepatu.value.ukuran!.toString();
    seri.text = controller.detailSepatu.value.seri!;
    bahan.text = controller.detailSepatu.value.bahan!;
    tahunProduksi.text = controller.detailSepatu.value.tahunProduksi!;
    warna.text = controller.detailSepatu.value.warna!;
    deskripsi.text = controller.detailSepatu.value.deskripsi!;
    stok.text = controller.detailSepatu.value.stok!.toString();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final index = controller.listSepatu.indexWhere((element) =>
                  element.sepatuId == controller.detailSepatu.value.sepatuId);
              // penamaan variabel lowercase atau camelcase
              final sepatuModel = SepatuModel(
                bahan: bahan.text,
                deskripsi: deskripsi.text,
                harga: int.parse(harga.text),
                merk: merk.text,
                seri: seri.text,
                sepatuId: controller.detailSepatu.value.sepatuId,
                stok: int.parse(stok.text),
                tahunProduksi: tahunProduksi.text,
                ukuran: int.parse(ukuran.text),
                warna: warna.text.toLowerCase(),
              );
              // parameter SepatuModel, datanya sepatuModel
              controller.updateSepatu(sepatuModel, index);
              Get.back();
            },
            icon: Icon(Icons.save),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingList,
          child: ListView(
            children: [
              ListTile(
                title: Text("Merk"),
                subtitle: TextFormField(
                  controller: merk,
                  readOnly: true,
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listMerk.length,
                          itemBuilder: (_, i) {
                            return ListTile(
                              title: Text(
                                listMerk[i],
                              ),
                              onTap: () {
                                merk.text = listMerk[i];
                                Get.back();
                              },
                              trailing: Visibility(
                                // ngecek apakah value merk sama dengan data dari list merk,
                                // jika valuenya sama maka akan muncul icon centang
                                visible: merk.text == listMerk[i],
                                child: Icon(Icons.check),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "Pilih Merk",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Harga"),
                subtitle: TextFormField(
                  controller: harga,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Harga Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Seri"),
                subtitle: TextFormField(
                  controller: seri,
                  decoration: InputDecoration(
                    hintText: "Seri Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Bahan"),
                subtitle: TextFormField(
                  controller: bahan,
                  decoration: InputDecoration(
                    hintText: "Bahan Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Ukuran"),
                subtitle: TextFormField(
                  maxLength: 2,
                  controller: ukuran,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Ukuran Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Tahun Produksi"),
                subtitle: TextFormField(
                  maxLength: 4,
                  controller: tahunProduksi,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Tahun Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Stok Sepatu"),
                subtitle: TextFormField(
                  controller: stok,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Stok Sepatu",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Warna Sepatu"),
                subtitle: TextFormField(
                  controller: warna,
                  readOnly: true,
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        padding: paddingList,
                        color: Colors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listWarnaSepatu.length,
                          itemBuilder: (_, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    getWarnaSepatu(listWarnaSepatu[i]),
                              ),
                              title: Text(
                                listWarnaSepatu[i].capitalize!,
                              ),
                              onTap: () {
                                warna.text = listWarnaSepatu[i].capitalize!;
                                Get.back();
                              },
                              trailing: Visibility(
                                // ngecek apakah value merk sama dengan data dari list merk,
                                // jika valuenya sama maka akan muncul icon centang
                                visible: warna.text ==
                                    listWarnaSepatu[i].capitalize!,
                                child: Icon(Icons.check),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "Warna Merk",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Deskripsi"),
                subtitle: TextFormField(
                  controller: deskripsi,
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    // border tampil apabila form ditekan atau aktif
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    // tampilan border awal, tanpa menekan form
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
