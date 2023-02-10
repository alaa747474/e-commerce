
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: size * 0.1),
        child: PageView(
          onPageChanged: (index) {
            setState(() => isLastPage = index == 3);
          },
          controller: controller,
          children: const[
            OnboardingView(image: 'assets/svg/first.svg',title: 'Choose The Products',content: 'Find your products that you want to buy easily',),
            OnboardingView(image: 'assets/svg/second.svg',title: 'Add favorite Products to Cart',content: 'Add favorite Products that you want to buy to Cart',),
            OnboardingView(image: 'assets/svg/third.svg',title: 'Choose Your Payment Option',content: 'Easy Checkout & Safe payment method. Trusted buy our Customers from all over wrold',),
            SplashScreen()
          ],
        ),
      ),
      bottomSheet: isLastPage?Container(color: Theme.of(context).primaryColor,
      height: size * 0.1,
      ): Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: size * 0.1,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: 
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(3);
                      },
                      child:  Text('SKIP',style: TextStyle(color: Theme.of(context).cardColor),)),
                  Center(
                    child: SmoothPageIndicator(
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeInBack);
                        },
                        effect:  ExpandingDotsEffect(
                          activeDotColor: Theme.of(context).primaryColor,
                        ),
                        controller: controller,
                        count:4),
                  ),
                  TextButton(
                    
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text('NEXT',style: TextStyle(color: Theme.of(context).cardColor),)),
                ],
              ),
      ),
    );
  }
}
