import 'package:get/get.dart';
import 'package:pos_sepatu/controller/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
