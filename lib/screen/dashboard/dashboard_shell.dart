import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/screen/home/home_screen.dart';
import 'package:docvault/screen/search/search_screen.dart';
import 'package:docvault/screen/settings/settings_screen.dart';
import 'package:docvault/widgets/doc_bottom_nav_bar.dart';

import '../category/category_controller.dart';
import '../category/category_screen.dart';
import '../search/search_controller.dart';
import '../settings/settings_controller.dart';
import 'dashboard_controller.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DashboardBinding — registers all tab controllers
// ─────────────────────────────────────────────────────────────────────────────
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() => DocSearchController());
    Get.lazyPut(() => SettingsController());
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DashboardShell — IndexedStack keeps all tabs alive, avoids rebuilds
// ─────────────────────────────────────────────────────────────────────────────
class DashboardShell extends StatelessWidget {
  const DashboardShell({super.key});

  @override

  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    // Lazily register tab controllers on first shell build
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() => DocSearchController());
    Get.lazyPut(() => SettingsController());

    final screens = const [
      HomeScreen(),
      CategoriesScreen(),
      SearchScreen(),
      SettingsScreen(),
    ];

    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.currentTabIndex.value,
        children: screens,
      ),
      bottomNavigationBar: DocBottomNavBar(
        currentIndex: controller.currentTabIndex.value,
        onTap: controller.onTabChanged,
      ),
    ));
  }
}