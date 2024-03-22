import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/controller_onboarding.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'helper_functions.dart' as HelperFunctions;
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

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
            children:  [
              OnBoardingPage(
                image: Lottie.network("https://lottie.host/eb33ec6a-3af3-4c8a-b3a6-1b8fcb645502/Megr7bXhTu.json"),
                title: "Hello There and Welcome to ENSAExo",
                subTitle: "where you will find Solutions and Wonderful assets to help you in your studies",
              ),
              OnBoardingPage(
                image: Lottie.network("https://lottie.host/d7d59417-4be0-421e-b62e-afe03c76ef6b/llVDa9RDkV.json"),
                title: "See And Share",
                subTitle: "discuss solutions with others through messaging and post your own solutions or assets to others",
              ),
              OnBoardingPage(
                
                image: Lottie.network("https://lottie.host/7014fc01-756f-4fe9-9ab2-ff4d883e1644/HYD26xqPhN.json"),
                title: "Help Each Other to Excel",
                subTitle: "You will find here everything you need to excel and prepare well for your exams",
              ),
            ],
          ),

          
          Positioned(
            top: kToolbarHeight,
            right: 17,
            child: TextButton(
              onPressed: () {
                OnBoardingController.instance.skipPage();
              },
              child:  Text('Skip',style: TextStyle(color:dark ? Colors.white : Colors.black ),),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight + 16,
            left: 20,
            right: 0,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.doNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: dark ? Colors.white : Colors.black,
                dotHeight: 6,
              ),
            ),
          ),
          

          Positioned(
  bottom: kBottomNavigationBarHeight,
  right: 24,
  
  child: ElevatedButton(
    onPressed: controller.nextPage,
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: dark ? Colors.blue : Colors.black,
    ),
    child: Center(
      child: Icon(
        Icons.arrow_right,
        color: Colors.white,
         // Set the text direction if needed
      ),
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
  }) : super(key: key);

  final dynamic image;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: image is Widget ? image : Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
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
