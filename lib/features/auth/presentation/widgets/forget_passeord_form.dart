import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_state.dart';
import 'package:project_test/features/auth/presentation/widgets/app_tect_form_field.dart';
import 'package:project_test/features/auth/presentation/widgets/custom_toast.dart';
import 'package:project_test/features/auth/presentation/widgets/text_btn.dart';

class forgetPasswordForm extends StatefulWidget {
  const forgetPasswordForm({super.key});

  @override
  State<forgetPasswordForm> createState() => _forgetPasswordFormState();
}

class _forgetPasswordFormState extends State<forgetPasswordForm> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          height: 10,
                        ),
                        state is SignInLoadingState
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
    );
  }
}
