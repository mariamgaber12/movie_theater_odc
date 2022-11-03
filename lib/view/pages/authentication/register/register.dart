import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../res/colors.dart';
import '../../../../view_model/cubit/authentication/auth_cubit.dart';
import '../../../../view_model/cubit/authentication/auth_states.dart';
import '../../../components/auth/components.dart';
import '../login/login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confPassController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img.png',
                height: 94,
                width: 108,
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SignUp',
                style: textStyleSalsa.copyWith(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {},
            builder: (context, state) {
              var authCubit = AuthenticationCubit.get(context);
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultTaskFormField(
                        controller: userNameController,
                        hint: 'User Name',
                        validate: (String? value) {
                          value = userNameController.text;
                          if (value.isEmpty) {
                            return ('Please Enter Name');
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.name),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultTaskFormField(
                        validate: (String? value) {
                          value = emailController.text;
                          if (value.isEmpty) {
                            return ('Please Enter Email');
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        hint: 'E-Mail',
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultTaskFormField(
                        controller: passController,
                        hint: 'Password',
                        validate: (String? value) {
                          value = passController.text;
                          if (value.isEmpty) {
                            return ('Please Enter Password');
                          } else {
                            return null;
                          }
                        },
                        obscure: !authCubit.passwordVisibleS1,
                        suffixIcon: IconButton(
                          icon: Icon(authCubit.passwordVisibleS1 == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            authCubit.changePassVisibilitySignup();
                          },
                          color: thirdColor,
                        ),
                        type: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 25,
                    ),
                    defaultTaskFormField(
                        validate: (String? value) {
                          value = confPassController.text;
                          if (value.isEmpty) {
                            return ('Please Enter Confirm Password');
                          } else {
                            return null;
                          }
                        },
                        controller: confPassController,
                        hint: 'Confirm Password',
                        obscure: !authCubit.passwordVisibleS2,
                        suffixIcon: IconButton(
                          icon: Icon(authCubit.passwordVisibleS2 == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            authCubit.changePassVisibilityConfSignup();
                          },
                          color: thirdColor,
                        ),
                        type: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 44,
                    ),
                    buildButton(
                        name: 'Signup',
                        onPress: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          authCubit.signup(
                              email: emailController.text,
                              userName: userNameController.text,
                              password: passController.text,
                              context: context);
                        })
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: textStyleRoboto.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  navigateTo(context, const LoginScreen());
                },
                child: Text(
                  "Login",
                  style: textStyleRoboto.copyWith(
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myLine(width: 120, left: 30, right: 9),
              Text(
                'or connect with',
                style: textStyleRoboto.copyWith(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              myLine(width: 120, left: 9, right: 30),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/twitter.svg'),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/facebook.svg'),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/google.svg'),
            ],
          ),
          const SizedBox(
            height: 44.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter as a guest',
                style: textStyleRoboto.copyWith(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),
              )
            ],
          )
        ],
      )),
    ));
  }
}
