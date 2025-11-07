import 'package:get/get.dart';

import '../modules/about_yourself/bindings/about_yourself_binding.dart';
import '../modules/about_yourself/views/about_yourself_view.dart';
import '../modules/about_yourself/views/badges/bindings/badges_binding.dart';
import '../modules/about_yourself/views/badges/views/badges_view.dart';
import '../modules/add_new_item/bindings/add_new_item_binding.dart';
import '../modules/add_new_item/views/add_new_item_view.dart';
import '../modules/add_your_wardrobe/bindings/add_your_wardrobe_binding.dart';
import '../modules/add_your_wardrobe/views/add_your_wardrobe_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/generate/bindings/generate_binding.dart';
import '../modules/generate/views/generate_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/library/bindings/library_binding.dart';
import '../modules/library/views/library_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/bindings/shop_bindings.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/menu/views/shop_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_YOURSELF,
      page: () => const AboutYourselfView(),
      binding: AboutYourselfBinding(),
      children: [
        GetPage(
          name: _Paths.BADGES,
          page: () => const BadgesView(
            badgeType: '',
          ),
          binding: BadgesBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ADD_YOUR_WARDROBE,
      page: () => const AddYourWardrobeView(),
      binding: AddYourWardrobeBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => const LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE,
      page: () => const GenerateView(),
      binding: GenerateBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_ITEM,
      page: () => const AddNewItemView(),
      binding: AddNewItemBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => const ShopView(),
      binding: ShopBinding(),
    ),
  ];
}
