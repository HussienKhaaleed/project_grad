import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_state.dart';
import 'package:project_test/features/auth/presentation/widgets/already_have_account_text.dart';
import 'package:project_test/features/auth/presentation/widgets/app_tect_form_field.dart';
import 'package:project_test/features/auth/presentation/widgets/terms_and_conditions_text.dart';
import 'package:project_test/features/auth/presentation/widgets/text_btn.dart';

class registerBody extends StatefulWidget {
  const registerBody({super.key});

  @override
  State<registerBody> createState() => _registerBodyState();
}

class _registerBodyState extends State<registerBody> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF07A66FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SignupSucessState) {
                      customReplacementNavigate(context, "/login");
                      Fluttertoast.showToast(
                          msg:
                              "Account Created Successfully , Check your email to verfiy your account",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFF07A66FF),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (state is SignupFailureState) {
                      Fluttertoast.showToast(
                          msg: state.errMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: formkey,
                      child: Column(
                        children: [
                          textformfield(
                            hintText: "Frist Name",
                            onChanged: (fristName) {
                              BlocProvider.of<AuthCubit>(context).fristName =
                                  fristName;
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          textformfield(
                            hintText: "Last Name",
                            onChanged: (lastName) {
                              BlocProvider.of<AuthCubit>(context).lastName =
                                  lastName;
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          textformfield(
                            hintText: "Email",
                            onChanged: (email) {
                              BlocProvider.of<AuthCubit>(context).emailAddress =
                                  email;
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          textformfield(
                            hintText: "Password",
                            onChanged: (password) {
                              BlocProvider.of<AuthCubit>(context).password =
                                  password;
                            },
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF07A66FF),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          state is SignupLoadingState
                              ? CircularProgressIndicator(
                                  color: Color(0xFF07A66FF),
                                )
                              : textBtn(
                                  buttonText: "Sign Up",
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .signUpWithEmailAndPassword();
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 16,
                          ),
                          terms_and_conditions_text(),
                          SizedBox(
                            height: 60,
                          ),
                          already_have_account_text(
                            onTap: () {
                              customReplacementNavigate(context, "/login");
                            },
                            fristText: 'Already have an account?',
                            secondText: ' Login',
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
