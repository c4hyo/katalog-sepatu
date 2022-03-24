import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/model/sepatu.dart';

import '../view/produk/sepatu_detail.dart';

class ProdukController extends GetxController {
  final listSepatu = <SepatuModel>[].obs;
  final detailSepatu = SepatuModel().obs;

  getListSepatu() {
    return listSepatu;
  }

  addSepatu(SepatuModel sepatuModel) {
    // fungsi nambah data ke db

    // SOON GAN

    // fungsi add di getx
    listSepatu.add(sepatuModel);
    listSepatu.refresh();
  }

  updateSepatu(SepatuModel sepatuModel, int index) {
    listSepatu[index] = sepatuModel;
    detailSepatu.value = sepatuModel;
    listSepatu.refresh();
    detailSepatu.refresh();
  }

  deleteSepatu(int index) {
    // cek coba

    print(index);
    listSepatu.removeAt(index);
    listSepatu.refresh();
  }

  goDetailSepatu(SepatuModel sepatuModel) {
    // memperbarui data detailsepatu dari controller
    detailSepatu.value = detailSepatu(sepatuModel);
    Get.to(
      () => SepatuDetailView(),
      binding: ProdukBindings(),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
