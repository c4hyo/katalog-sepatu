import 'package:get/get.dart';
import 'package:pos_sepatu/controller/transaksi_controller.dart';

class TransaksiBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TransaksiController());
  }
}
