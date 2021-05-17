import 'package:get/get.dart';
import 'package:palm_hills_club/controllers/auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
