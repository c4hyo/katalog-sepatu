import 'package:get/get.dart';
import 'package:pos_sepatu/controller/home_controller.dart';

class AppController extends GetxController {}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(HomeController());
  }
}
