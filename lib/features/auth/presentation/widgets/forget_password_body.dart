import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_state.dart';
import 'package:project_test/features/auth/presentation/widgets/app_tect_form_field.dart';
import 'package:project_test/features/auth/presentation/widgets/custom_toast.dart';
import 'package:project_test/features/auth/presentation/widgets/text_btn.dart';

class forgetPasswordBody extends StatefulWidget {
  const forgetPasswordBody({super.key});

  @override
  State<forgetPasswordBody> createState() => _forgetPasswordBodyState();
}

class _forgetPasswordBodyState extends State<forgetPasswordBody> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF07A66FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: forgetpasseordimage(),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter your registered email below to receive password reset instruction",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // forgetPasswordForm(),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccessState) {
                      showToast("Check Your Email To Reset Your Password",
                          Colors.white);
                      customReplacementNavigate(context, "/login");
                    } else if (state is ResetPasswordFailureState) {
                      showToast(state.errMessage, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: formkey,
                      child: Column(
                        children: [
                          textformfield(
                            hintText: "Email",
                            onChanged: (email) {
                              BlocProvider.of<AuthCubit>(context).emailAddress =
                                  email;
                            },
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          state is ResetPasswordLoadingState
                              ? CircularProgressIndicator(
                                  color: Color(0xFF07A66FF),
                                )
                              : textBtn(
                                  buttonText: "Send Reset Password Link",
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      await BlocProvider.of<AuthCubit>(context)
                                          .resetPasswordWithLink();
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class forgetpasseordimage extends StatelessWidget {
  const forgetpasseordimage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 235,
      child: Image.asset("assets/images/Group 3.png"),
    );
  }
}
