import 'package:get/get.dart';
import 'package:pos_sepatu/controller/produk_controlller.dart';

class ProdukBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProdukController());
  }
}
