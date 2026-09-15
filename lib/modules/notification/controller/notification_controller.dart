import 'package:get/get.dart';

import '../data/modal/notification modal.dart';

class NotificationController extends GetxController {
  final RxBool isLoading = false.obs;

  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Your Class 8 Science lesson is ready 📚",
      message:
      "Continue learning from where you left off and complete today's lesson.",
      time: "2 hrs ago",
    ),
    NotificationModel(
      title: "New Practice Test Available 📝",
      message:
      "A new Science practice test has been added. Test your knowledge and improve your score.",
      time: "4 hrs ago",
    ),
    NotificationModel(
      title: "AI Study Assistant is Ready 🤖",
      message:
      "Stuck on a question? Ask the AI Study Assistant for a detailed solution.",
      time: "5 hrs ago",
    ),
    NotificationModel(
      title: "Your Course Progress is 72% 🎯",
      message:
      "Great progress! Complete the remaining lessons to finish your course.",
      time: "6 hrs ago",
    ),
    NotificationModel(
      title: "New Video Lesson Added 🎥",
      message:
      "A new Mathematics video lesson is now available in your online course.",
      time: "8 hrs ago",
    ),
    NotificationModel(
      title: "Don't Miss Today's Study Goal 🔔",
      message:
      "You have pending lessons for today. Keep your learning streak going!",
      time: "10 hrs ago",
    ),
    NotificationModel(
      title: "Detailed Solution Available 💡",
      message:
      "Check the detailed solution for your recently attempted questions.",
      time: "12 hrs ago",
    ),
    NotificationModel(
      title: "New Course Available 🎓",
      message:
      "Explore our latest courses and start learning something new today.",
      time: "1 day ago",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}