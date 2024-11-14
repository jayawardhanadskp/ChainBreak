import 'package:chain_break/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:typewrite_text/typewrite_text.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = LiquidController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            pages: [
              Container(
                color: Theme.of(context).colorScheme.tertiary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/breeth.png')),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        // const Text('Improved Lung Function'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 150,
                            child: TypewriteText(
                              linesOfText: const [
                                'Breathe easier and feel the difference. Your lungs begin to repair themselves, reducing coughing and shortness of breath.',
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white),
                              reverseAnimationDuration: Duration.zero,
                              beforeAnimationDuration: Duration.zero,
                              forwardAnimationDuration:
                                  const Duration(milliseconds: 80),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text('1 / 3')
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset('assets/breethimg.png'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        // Text('Reduced Risk of Heart Disease'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 150,
                            child: TypewriteText(
                              linesOfText: const [
                                'Your heart becomes stronger and your risk of heart disease drops significantly as you quit smoking.'
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.blue[300]),
                              reverseAnimationDuration: Duration.zero,
                              beforeAnimationDuration: Duration.zero,
                              forwardAnimationDuration:
                                  const Duration(milliseconds: 80),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text('2 / 3')
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/menbreeth.png',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        // Text('Increased Life Expectancy'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 150,
                            child: TypewriteText(
                              linesOfText: const [
                                'Add years to your life and enjoy a healthier future. Quitting smoking can add up to 10 years to your life expectancy.'
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white),
                              reverseAnimationDuration: Duration.zero,
                              beforeAnimationDuration: Duration.zero,
                              forwardAnimationDuration:
                                  const Duration(milliseconds: 80),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text('3 / 3')
                  ],
                ),
              ),
            ],
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                
                  controller.animateToPage(page: 2);
                
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 60,
            child: OutlinedButton(
              onPressed: () {
                if (currentIndex == 2) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
                }
                
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 27,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 5.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentIndex = activePageIndex;
    });
  }
}
