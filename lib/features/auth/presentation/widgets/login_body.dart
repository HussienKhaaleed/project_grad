import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_state.dart';
import 'package:project_test/features/auth/presentation/widgets/already_have_account_text.dart';
import 'package:project_test/features/auth/presentation/widgets/app_tect_form_field.dart';
import 'package:project_test/features/auth/presentation/widgets/custom_toast.dart';
import 'package:project_test/features/auth/presentation/widgets/terms_and_conditions_text.dart';
import 'package:project_test/features/auth/presentation/widgets/text_btn.dart';

class loginnBody extends StatefulWidget {
  const loginnBody({super.key});

  @override
  State<loginnBody> createState() => _loginnBodyState();
}

class _loginnBodyState extends State<loginnBody> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                    if (state is SignInSucessState) {
                      FirebaseAuth.instance.currentUser!.emailVerified
                          ? customReplacementNavigate(context, "/homeNavBar")
                          : showToast("Please Verify Your Account", Colors.red);
                      ;
                    } else if (state is SignInFailureState) {
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
                          GestureDetector(
                            onTap: () {
                              customReplacementNavigate(
                                  context, "/forgetpassword");
                            },
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF07A66FF),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          state is SignInLoadingState
                              ? CircularProgressIndicator(
                                  color: Color(0xFF07A66FF),
                                )
                              : textBtn(
                                  buttonText: "Login",
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      await BlocProvider.of<AuthCubit>(context)
                                          .signInWithEmailAndPassword();
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
                              customReplacementNavigate(context, "/register");
                            },
                            fristText: '',
                            secondText: ' Create An Account',
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
