import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/controller_onboarding.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'helper_functions.dart' as HelperFunctions;

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: 'lib/animations/animation1.gif',title:"Hello There and Welcome to ENSAExo" ,subTitle:"where you will find Solutions and Wonderful assets to help you in your studies",),
              OnBoardingPage(image: 'lib/animations/animation2.gif',title:"See And Share" ,subTitle:"discuss solutions with others through messaging and post your own solutions or assets to others",),
              OnBoardingPage(image: 'lib/animations/animation3.gif',title:"Help Each Other to Excel" ,subTitle:"You will find here everything you need to excel and prepare well for your exams",),
            ],
          ),
          Positioned(
            top: kToolbarHeight,
            right: 17,
            child: TextButton(
              onPressed: () {
                OnBoardingController.instance.skipPage();
              },
              child: const Text('Skip'),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight + 16,
            left: 0,
            right: 0,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.doNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: dark ? Colors.white : Colors.black,dotHeight: 6),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            right: 24,
            child: ElevatedButton(
              onPressed: controller.nextPage,
              child: const Icon(Icons.arrow_right),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.6, // Adjust height as needed
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
