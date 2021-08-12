import 'package:get/get.dart';
import 'package:palm_hills_club/controllers/authController.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
