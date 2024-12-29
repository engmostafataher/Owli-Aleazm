import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owli_aleazm/features/auth/presentation/views/forget_pass_view.dart';
import 'package:owli_aleazm/features/home/presentation/views/my_home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../manager/signin_signup_cubit/signin_sinup_cubit.dart';
import 'accept_terms_checkbox.dart';
import 'form_item.dart';
import '../../../../../core/widgets/tab_bar_title.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInSignUpForm extends StatefulWidget {
  const SignInSignUpForm({super.key});

  @override
  State<SignInSignUpForm> createState() => _SignInSignUpFormState();
}

class _SignInSignUpFormState extends State<SignInSignUpForm> {
  bool isSignIn = false;
  late bool _isChecked = false;
  late String emailCreate, passwordCreate, emailLogin, passwordLogin;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailCreateController = TextEditingController();
  final TextEditingController passwordCreateController =
      TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninSignupCubit, SigninSignupState>(
        listener: (context, state) async{
      if (state is SigninSignupLoading) {
        isLoading = true;
      } else if (state is SigninSignupSuccess) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('firebase_token', 'example_token');

            // الانتقال إلى صفحة Home بعد تسجيل الدخول
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomeView()),
            );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomeView()));
        // GoRouter.of(context).push(AppRouter.kMyHomeView);
        isLoading = false;
        showSnackBar(context, "Success!");
      } else if (state is SigninSignupFailure) {
        isLoading = false;
        showSnackBar(context, state.errMessage);
        print("Failure");
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TabBarTitle(
              isSignIn: isSignIn,
              textOne: "تسجيل الدخول",
              textTwo: "إنشاء حساب",
              onTabChanged: (bool newValue) {
                setState(() {
                  isSignIn = newValue;
                  setState(() {
                    if (isSignIn == true) {
                      emailLoginController.clear();
                      passwordLoginController.clear();
                    } else {
                      emailCreateController.clear();
                      passwordCreateController.clear();
                    }
                  });
                });
              },
            ),
            const SizedBox(height: 25),
            isSignIn == true
                ? Column(
                    children: [
                      FormItem(
                        controller: emailCreateController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'email is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          emailCreate = value;
                        },
                        text: "البريد الالكتروني",
                        keyboardType: TextInputType.emailAddress,
                        hint: "ادخل بريدك الالكتروني",
                      ),
                      FormItem(
                        controller: passwordCreateController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'enter your password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          passwordCreate = value;
                        },
                        text: "كلمة المرور",
                        keyboardType: TextInputType.visiblePassword,
                        hint: "ادخل كلمة المرور",
                        obscureText: true,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      FormItem(
                        controller: emailLoginController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'email is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          emailLogin = value;
                        },
                        text: "البريد الالكتروني",
                        keyboardType: TextInputType.emailAddress,
                        hint: "ادخل بريدك الالكتروني",
                      ),
                      FormItem(
                        controller: passwordLoginController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'enter your password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          passwordLogin = value;
                        },
                        text: "كلمة المرور",
                        keyboardType: TextInputType.visiblePassword,
                        hint: "ادخل كلمة المرور",
                        obscureText: true,
                      ),
                    ],
                  ),
            if (isSignIn == true)
              FormItem(
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'reenter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  passwordCreate = value;
                },
                text: "تأكيد كلمة المرور",
                keyboardType: TextInputType.visiblePassword,
                hint: "ادخل كلمة المرور",
                obscureText: true,
              ),
            if (isSignIn == true)
              AcceptTermsCheckbox(
                isChecked: _isChecked,
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
              ),
            if (isSignIn == false) const ForgetPassText(),
            const SizedBox(height: 25),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kPrimaryColor,
                    ),
                  )
                : CustomButton(
                    onTap: () async {
  if (isSignIn == true) {
    print("true");
    if (formKey.currentState!.validate()) {
      try {
        // تسجيل مستخدم جديد
        BlocProvider.of<SigninSignupCubit>(context).registerUser(
          email: emailCreate,
          password: passwordCreate,
        );
        await auth.createUserWithEmailAndPassword(
          email: emailCreate,
          password: passwordCreate,
        );
        showSnackBar(context, "Account created successfully!");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          showSnackBar(context, 'This email is already registered. Please log in.');
        } else {
          showSnackBar(context, 'An error occurred: ${e.message}');
        }
      } catch (e) {
        showSnackBar(context, 'Unexpected error: $e');
      }
    }
  } else {
    print("false");
    if (formKey.currentState!.validate()) {
      try {
        // تسجيل الدخول
        BlocProvider.of<SigninSignupCubit>(context).logInUser(
          email: emailLogin,
          password: passwordLogin,
        );
        await auth.signInWithEmailAndPassword(
          email: emailLogin,
          password: passwordLogin,
        );
        showSnackBar(context, "Login successful!");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar(context, 'No user found for this email.');
        } else if (e.code == 'wrong-password') {
          showSnackBar(context, 'Wrong password provided for this user.');
        } else {
          showSnackBar(context, 'An error occurred: ${e.message}');
        }
      } catch (e) {
        showSnackBar(context, 'Unexpected error: $e');
      }
    }
  }
},
                    text: "تسجيل الدخول",
                  ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPassView()));
        // GoRouter.of(context).push(AppRouter.kForgetPassView);
      },
      child: Text(
        "نسيت كلمة المرور؟",
        style: Styles.textStyle14.copyWith(
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
