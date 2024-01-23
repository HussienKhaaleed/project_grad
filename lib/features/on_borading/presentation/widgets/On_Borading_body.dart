import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoradingBody extends StatelessWidget {
  const OnBoradingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnBoardingContant(),
      ),
    );
  }
}

class OnBoardingContant extends StatelessWidget {
  OnBoardingContant({
    super.key,
  });
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                "assets/images/Group 51.png",
              ),
              SizedBox(
                height: 44,
              ),
              Text(
                "     Choose\nThe Product",
                style: TextStyle(
                  color: Color(0xFF07A66FF),
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF07A66FF),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Swipe To Continue",
                style: TextStyle(
                  color: Color(0xFF07A66FF),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/Group 60.png",
              ),
            ],
          );
        });
  }
}
