import 'package:get/get.dart';

import '../../../modules/activities/binding/activities_binding.dart';
import '../../../modules/activities/screen/activities_page.dart';
import '../../../modules/auth/binding/authbinding.dart';
import '../../../modules/auth/presentation/pages/login_page.dart';
import '../../../modules/callender/binding/callender_dinding.dart';
import '../../../modules/callender/screen/callender_page.dart';
import '../../../modules/dashboard/binding/dashboard_binding.dart';
import '../../../modules/dashboard/presentation/page/dashboard_page.dart';
import '../../../modules/drawer/my_courses/binding/my_courses_binding.dart';
import '../../../modules/drawer/my_courses/screen/my_courses_page.dart';
import '../../../modules/drawer/my_wallet/screen/add_money_page.dart';
import '../../../modules/drawer/my_wallet/screen/payment_failed_page.dart';
import '../../../modules/drawer/my_wallet/screen/payment_success_page.dart';
import '../../../modules/drawer/my_wallet/screen/transaction_details_page.dart';
import '../../../modules/drawer/my_wallet/screen/wallet_transactions_page.dart';
import '../../../modules/drawer/performance/binding/performance_dinding.dart';
import '../../../modules/drawer/performance/screen/performance_page.dart';
import '../../../modules/drawer/task/binding/task_binding.dart';
import '../../../modules/drawer/task/screen/task.dart';
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
import '../../../modules/profile/binding/profile_binding.dart';
import '../../../modules/profile/screen/profile_page.dart';
import '../../../modules/pyq/binding/pyq_binding.dart';
import '../../../modules/pyq/screen/pyq_page.dart';
import '../../../modules/pyq/screen/pyq_test_papers_page.dart';
import '../../../modules/splash/binding/splash_binding.dart';
import '../../../modules/splash/presentation/page/splash_page.dart';
import '../../../modules/wallet/binding/wallet_binding.dart';
import '../../../modules/wallet/presentation/page/wallet_page.dart';
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
      transitionDuration: const Duration(milliseconds: 500),
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
    ),
    GetPage(
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

    GetPage(
      name: AppRoutes.WalletPage,
      page: () => WalletPage(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: AppRoutes.tasks,
      page: () => const TasksPage(),
      binding: TaskBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.performancePage,
      page: () => const PerformancePage(),
      binding: PerformanceDinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.MyCourses,
      page: () => const MyCoursesPage(),
      binding: MyCoursesDinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.activities,
      page: () => const ActivitiesPage(),
      binding: ActivitiesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

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
    GetPage(
      name: AppRoutes.wallet,
      page: () => const WalletPage(),
      binding: WalletBinding(),
    ),

    GetPage(
      name: AppRoutes.addMoney,
      page: () => const AddMoneyPage(),
      binding: WalletBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.walletTransactions,
      page: () => const WalletTransactionsPage(),
      binding: WalletBinding(),
    ),

    GetPage(
      name: AppRoutes.walletTransactionDetails,
      page: () => const TransactionDetailsPage(),
      binding: WalletBinding(),
    ),

    GetPage(
      name: AppRoutes.walletPaymentSuccess,
      page: () => const PaymentSuccessPage(),
    ),

    GetPage(
      name: AppRoutes.walletPaymentFailed,
      page: () => const PaymentFailedPage(),
    ),

    GetPage(
      name: AppRoutes.pyqs,
      page: () => const PyqsPage(),
      binding: PyqBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.pyqTestPapers,
      page: () => const PyqTestPapersPage(),
      binding: PyqBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
