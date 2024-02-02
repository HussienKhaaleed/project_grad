import 'package:flutter/widgets.dart';
import 'package:project_test/features/auth/presentation/widgets/forget_password_body.dart';

class forgetPasswordView extends StatefulWidget {
  const forgetPasswordView({super.key});

  @override
  State<forgetPasswordView> createState() => _forgetPasswordViewState();
}

class _forgetPasswordViewState extends State<forgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return forgetPasswordBody();
  }
}
