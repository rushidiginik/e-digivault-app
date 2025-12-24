import 'package:dotted_border/dotted_border.dart';
import 'package:e_digivault_org_app/core/constants/app_common_text.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:e_digivault_org_app/widgets/common_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: "Upload with Confidence",
      description: '''“Moderators can securely upload documents with detailed metadata.”''',
      image: "assets/images/pngs/onboarding_1.png",
    ),
    OnboardingModel(
      title: "Safe and Secure",
      description: '''“In-Charge roles review, verify, or reject documents—transparently.”''',
      image: "assets/images/pngs/onboarding_2.png",
    ),
    OnboardingModel(
      title: "Track Your Work",
      description: '''“Clients can check statuses, view, download, and share verified documents anytime.”''',
      image: "assets/images/pngs/onboarding_3.png",
    ),
  ];
  @override
  void initState() {
    super.initState();

    ///
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent, systemNavigationBarIconBrightness: Brightness.dark),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: CommonAppBarWidget(
        title: "",
        isBack: _currentPage > 0,
        leadingWidth: 56,
        allPadding: 8,

        pressBack: () {
          if (_currentPage > 0) {
            _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        },
        actionWidget: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(color: AppStyles.primaryColor.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: textMedium(text: "skip", fontSize: 14, fontColor: AppStyles.primaryColor),
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // PageView
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _onBoardingSection(onboardingData[index]);
                  },
                ),
              ),

              // Page Indicator + Next Button
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_currentPage == onboardingData.length - 1) {
                            context.go('/login_screen');
                          } else {
                            _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer Circular Progress
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: CircularProgressIndicator(
                                value: _currentPage == 0
                                    ? 0.3
                                    : _currentPage == 1
                                    ? 0.65
                                    : 1, // controls progress
                                strokeWidth: 4,
                                backgroundColor: AppStyles.textBlack.withOpacity(0.10),
                                valueColor: const AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
                              ),
                            ),

                            // Inner Circle Button
                            DottedBorder(
                              color: Colors.transparent,
                              strokeWidth: 2, // thickness
                              borderType: BorderType.RRect, // RRect = rounded rectangle / Circle
                              radius: const Radius.circular(50), // makes it rounded
                              dashPattern: const [6, 3], // [dash, space]
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                child: Icon(Icons.arrow_forward_ios_rounded, color: AppStyles.primaryColor, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 20 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index ? AppStyles.primaryColor : AppStyles.primaryColor.withOpacity(0.30),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onBoardingSection(OnboardingModel model) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 20),
          child: Image.asset(
            model.image,
            errorBuilder: (context, error, stackTrace) {
              print("error ${error}");
              return Container();
            },
          ),
        ),
        textSemiBold(text: model.title, fontSize: 24, fontColor: AppStyles.primaryColor),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: textRegular(text: model.description, fontSize: 18, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

/// Model Class for Reusability
class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({required this.title, required this.description, required this.image});
}
