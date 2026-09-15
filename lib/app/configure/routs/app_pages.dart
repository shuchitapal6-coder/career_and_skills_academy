import 'package:get/get.dart';

import '../../../modules/auth/binding/authbinding.dart';
import '../../../modules/auth/presentation/pages/login_page.dart';
import '../../../modules/callender/binding/callender_dinding.dart';
import '../../../modules/callender/screen/callender_page.dart';
import '../../../modules/dashboard/binding/dashboard_binding.dart';
import '../../../modules/dashboard/presentation/page/dashboard_page.dart';
import '../../../modules/help_support/binding/help_support_binding.dart';
import '../../../modules/help_support/screen/contact_us.dart';
import '../../../modules/internet/binding/internet_binding.dart';
import '../../../modules/internet/presentation/page/internet_page.dart';
import '../../../modules/message/binding/message_dinding.dart';
import '../../../modules/message/screen/message_page.dart';
import '../../../modules/notification/binding/notification_dinding.dart';
import '../../../modules/notification/screen/notification.dart';
import '../../../modules/onboarding/binding/onboarding_dinding.dart';
import '../../../modules/onboarding/screen/onboardings.dart';
import '../../../modules/privacy_policy/presentation/page/about_us.dart';
import '../../../modules/privacy_policy/presentation/page/privacy_policy.dart';
import '../../../modules/splash/binding/splash_binding.dart';
import '../../../modules/splash/presentation/page/splash_page.dart';
import 'app_routs.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.noInternet,
      page: () => NoInternetScreen(),
      binding: InternetBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    /// ONBOARDING
    GetPage(
      name: AppRoutes.onboarding,
      binding: OnboardingBinding(),
      page: () => OnboardingPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.sendOtp,
      page: () => SendOtpPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    // GetPage(
    //   name: AppRoutes.verifyOtp,
    //   page: () => VerifyOtpPage(),
    //   binding: AuthBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    //
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),    GetPage(
      name: AppRoutes.messagePage,
      page: () => const MessagePage(),
      binding: MessageDinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.calender,
      page: () => const CallenderPage(),
      binding: CallenderDinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    //
    // GetPage(
    //   name: AppRoutes.propertyDetail,
    //   page: () => const PropertyDetailPage(),
    //   binding: PropertyDetailBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.Editprofile,
    //   page: () => const UpdateProfileScreen(),
    //   binding: UpdateProfileBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfileScreen(),
    //   binding: UpdateProfileBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.myProperties,
    //   page: () => const MyProprtiesPage(),
    //   binding: MyProprtiesDinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.savedProperties,
    //   page: () => const SavedProprties(),
    //   binding: SavedProprtiesDinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.contactDealer,
    //   page: () => const ContactDealerPage(),
    //   binding: ContactDealerBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    // GetPage(
    //   name: AppRoutes.search,
    //   page: () => const SearchPage(),
    //   binding: SearchBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    GetPage(
      name: AppRoutes.privacyPolicy,
      page: () => const PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    //
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => const AboutUsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.helpSupport,
      page: () => const ContactUs(),
      binding: HelpSupportBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    // GetPage(
    //   name: AppRoutes.settings,
    //   page: () => SettingsPage(),
    //   binding: SettingsBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
  ];
}
