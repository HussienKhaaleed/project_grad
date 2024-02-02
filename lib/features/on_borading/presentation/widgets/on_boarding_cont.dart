import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_test/core/database/cashe_helper.dart';
import 'package:project_test/core/service/service_locter.dart';
import 'package:project_test/features/on_borading/data/model/on_borading_model.dart';
import 'package:project_test/features/on_borading/presentation/widgets/customBtn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingContant extends StatefulWidget {
  OnBoardingContant({
    super.key,
    this.onPageChanged,
    required this.controller,
  });
  final PageController controller;
  final Function(int)? onPageChanged;

  @override
  State<OnBoardingContant> createState() => _OnBoardingContantState();
}

class _OnBoardingContantState extends State<OnBoardingContant> {
  final PageController _controller = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: widget.controller,
        itemCount: onBoradingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 300,
                width: 410,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(onBoradingData[index].imagePath),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                onBoradingData[index].title,
                style: TextStyle(
                  color: Color(0xFF07A66FF),
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SmoothPageIndicator(
                controller: widget.controller,
                count: onBoradingData.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF07A66FF),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              currentIndex == onBoradingData.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomBtn(
                            onPressed: () {
                              getIt<CacheHelper>().saveData(
                                key: "isonBoardingVisited",
                                value: true,
                              );
                              GoRouter.of(context).pushReplacement("/login");
                            },
                            text: "Get Started"),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    )
                  : CustomBtn(
                      onPressed: () {
                        getIt<CacheHelper>().saveData(
                          key: "isonBoardingVisited",
                          value: true,
                        );
                        widget.controller.nextPage(
                          duration: Duration(microseconds: 200),
                          curve: Curves.bounceIn,
                        );
                      },
                      text: "Swipe To Continue",
                    ),
              SizedBox(
                height: 70,
              ),
              Image.asset(
                "assets/images/bottom.png",
              ),
            ],
          );
        });
  }
}
