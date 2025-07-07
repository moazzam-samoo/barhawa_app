import 'package:barhawa_app/services/models/onboarding_info.dart';
import 'package:get/get.dart';

class OnboardingController {

  var currentPage = 0.obs;
  List<OnboardingInfo> onboardingPages = [
    //1st Onboarding page info
    OnboardingInfo(
      "onboarding_2.png",
      "The Best Tool for Small Business Success",
      "Helping local vendors and shopkeepers manage sales, print receipts",
    ),
    //2nd Onboarding page info
    OnboardingInfo(
      "onboarding_3.png",
      "Take complete control of your business with Barhawa",
      "Easily track sales, create receipts, and manage everything—right from your phone",
    ),
    //3rd Onboarding page info
    OnboardingInfo(
      "onboarding_4.png",
      "Create and Print Professional Receipts Instantly",
      "Generate clear, itemized receipts and print them instantly using Bluetooth thermal printers.",
    ),

    //4th Onboarding page info
    OnboardingInfo(
      "onboarding_3.png",
      "Join Barhawa and keep your business one step ahead.",
      "Explore the class you want, study the class section, and join to start learning.",
    ),
  ];
}
