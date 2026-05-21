import 'package:get/get.dart';
import 'package:docvault/screen/splash/splash_controller.dart';

/// Registers [SplashController] only while the splash route is active.
/// GetX automatically disposes it when the route is removed from the stack.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}