import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool cloudSyncEnabled = true.obs;

  void onToggleCloudSync() => cloudSyncEnabled.value = !cloudSyncEnabled.value;

  void onProfileTap() {}
  void onSecurityTap() {}
  void onNotificationsTap() {}
  void onHelpTap() {}
  void onAboutTap() {}

  void onSignOut() {
    // TODO: clear session, navigate to login
    // Get.offAllNamed(Routes.login);
  }
}