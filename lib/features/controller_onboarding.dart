import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  late final PageController pageController = PageController(); // Initialize pageController explicitly
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void doNavigationClick(int index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage(){
    if(currentPageIndex.value < 2){
      currentPageIndex.value++;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.to(() =>Login());
    }
  }

  void skipPage(){
    currentPageIndex.value = 2; // Set to the last page
    pageController.jumpToPage(2);
  }
}
