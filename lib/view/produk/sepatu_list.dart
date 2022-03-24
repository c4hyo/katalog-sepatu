import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/config/helper.dart';
import 'package:pos_sepatu/config/tema.dart';
import 'package:pos_sepatu/controller/produk_controlller.dart';
import 'package:pos_sepatu/model/sepatu.dart';
import 'package:pos_sepatu/view/produk/sepatu_add.dart';

class SepatuListView extends GetView<ProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => SepatuAddView(),
            binding: ProdukBindings(),
          );
        },
        child: Icon(
          Icons.add_outlined,
        ),
      ),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.size.height * 0.125),
          child: Container(
            padding: paddingList,
            color: primaryColor,
            child: TextFormField(
              cursorColor: Colors.black87,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
                filled: true,
                fillColor: Colors.teal.shade100,
                hintText: "Cari Sepatu",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingList,
          child: Obx(
            () => ListView(
              children: [
                GridView.builder(
                  // banyak item yang ditampilkan
                  itemCount: controller.listSepatu.length,
                  // content dari grid panjangnya menyesuaikan banyak item
                  shrinkWrap: true,
                  // jenis scroll dari android
                  physics: ClampingScrollPhysics(),
                  // tipe grid yang banyak itemnya fix
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // satu baris 2 grid
                    crossAxisCount: 2,
                    // space kanan kiri
                    mainAxisSpacing: 1,
                    //space atas bawah
                    crossAxisSpacing: 1,
                    // aspek rasio 3:4
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (_, i) {
                    SepatuModel sm = controller.listSepatu[i];
                    return InkWell(
                      onTap: () {
                        controller.goDetailSepatu(sm);
                      },
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: Get.size.width * 0.475,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    rupiah(sm.harga!),
                                  ),
                                  Icon(
                                    Icons.add_shopping_cart,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  child: Text("Isinya gambar"),
                                ),
                              ),
                              Text(
                                sm.seri!.capitalize!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
