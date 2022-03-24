import 'package:get/get.dart';

class ProdukController extends GetxController {
  final tes = "Hallo".obs;
  final data = "".obs;

  @override
  void onInit() {
    print(tes.value);
    data.value = Get.arguments['data'];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    data.value = "";
    tes.value = "hai";
    print(tes.value);
  }
}
