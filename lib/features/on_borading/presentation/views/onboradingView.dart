import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/core/database/cashe_helper.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/core/service/service_locter.dart';
import 'package:project_test/features/on_borading/presentation/widgets/on_boarding_cont.dart';

class onBoardingView extends StatefulWidget {
  onBoardingView({super.key});

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  @override
  void initState() {
    super.initState();
    bool isOnBoardingVisisted =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisisted == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, "/login")
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayedNavigate(context, "/home")
              : delayedNavigate(context, "/login");
    } else {
      delayedNavigate(context, "/home");
    }
  }

  final PageController _controller = PageController(initialPage: 0);

  int currentIndex = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnBoardingContant(
          controller: _controller,
        ),
      ),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 0),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
