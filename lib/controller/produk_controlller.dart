import 'package:get/get.dart';
import 'package:pos_sepatu/bindings/produk_bindings.dart';
import 'package:pos_sepatu/model/sepatu.dart';

import '../view/produk/sepatu_detail.dart';

class ProdukController extends GetxController {
  final detailSepatu = SepatuModel().obs;

  updateSepatu(SepatuModel sepatuModel) {
    detailSepatu.value = sepatuModel;

    detailSepatu.refresh();
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
