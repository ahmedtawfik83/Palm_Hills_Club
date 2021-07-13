import 'package:get/get.dart';
import 'package:palm_hills_club/services/auth_service.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
  }
}
