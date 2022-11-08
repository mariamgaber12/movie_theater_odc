import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../res/colors.dart';
import '../../../../view_model/cubit/authentication/auth_cubit.dart';
import '../../../../view_model/cubit/authentication/auth_states.dart';
import '../../../components/auth/components.dart';
import '../../home/home_layout.dart';
import '../facebook_auth.dart';
import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
                'Login',
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
              return Column(children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defaultTaskFormField(
                          controller: emailController,
                          hint: 'E-Mail',
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            value = emailController.text;
                            if (value.isEmpty) {
                              return ('Please Enter E-Mail');
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultTaskFormField(
                        controller: passController,
                        hint: 'Password',
                        obscure: !authCubit.passwordVisibleL,
                        suffixIcon: IconButton(
                          icon: Icon(authCubit.passwordVisibleL == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            authCubit.changePassVisibilityLogin();
                          },
                          color: thirdColor,
                        ),
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return ('Please Enter Password');
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 42),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: textStyleRoboto.copyWith(
                                    fontSize: 9,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    color: mainColor,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      buildButton(
                          name: 'Login',
                          onPress: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            authCubit.login(
                                email: emailController.text,
                                password: passController.text,
                                context: context);
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: textStyleRoboto.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const SignupScreen());
                        },
                        child: Text("Signup",
                            style: textStyleRoboto.copyWith(
                                color: mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
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
                    GestureDetector(
                        child: SvgPicture.asset('assets/twitter.svg')),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          navigateTo(context, const MyFacebook());
                        },
                        child: SvgPicture.asset('assets/facebook.svg')),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          authCubit.googleLogin();
                        },
                        child: SvgPicture.asset('assets/google.svg')),
                  ],
                ),
              ]);
            },
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
