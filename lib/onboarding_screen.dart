import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'OnBoarding_Screens/on_boarding_1.dart';
import 'OnBoarding_Screens/on_boarding_2.dart';
import 'OnBoarding_Screens/on_boarding_3.dart';
import 'home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnBoardingPageOne(),
              OnBoardingPageTwo(),
              OnBoardingPageThree(),
            ],
          ),

          // dot indicators for page transitions
          Container(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('Skip',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),

                // Next or Done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) {
                              return HomePage();
                            })),
                          );
                        },
                        child: const Text('Done',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
