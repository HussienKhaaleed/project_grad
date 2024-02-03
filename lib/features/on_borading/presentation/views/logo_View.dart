import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/core/database/cashe_helper.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/core/service/service_locter.dart';

class logoView extends StatefulWidget {
  const logoView({super.key});

  @override
  State<logoView> createState() => _logoViewState();
}

class _logoViewState extends State<logoView> {
  @override
  void initState() {
    bool isOnBoardingVisisted =
        getIt<CacheHelper>().getData(key: "isonBoardingVisited") ?? false;
    if (isOnBoardingVisisted == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, "/login")
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayedNavigate(context, "/homeNavBar")
              : delayedNavigate(context, "/login");
    } else {
      delayedNavigate(context, "/onBoarding");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF07A66FF),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
