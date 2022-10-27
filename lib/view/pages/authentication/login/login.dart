import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubit/authentication/auth_cubit.dart';
import '../../../../cubit/authentication/auth_states.dart';
import '../../../../res/colors.dart';
import '../../../componentes/auth/components.dart';
import '../../home/home_layout.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
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
                style: GoogleFonts.salsa(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          defaultTaskFormField(
              controller: emailController,
              hint: 'E-Mail',
              type: TextInputType.emailAddress),
          const SizedBox(
            height: 25,
          ),
          defaultTaskFormField(
              controller: passController,
              hint: 'Password',
              obscure: !_passwordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                color: mainColor,
              ),
              type: TextInputType.visiblePassword),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42),
                child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: GoogleFonts.roboto(
                          fontSize: 9,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          color: mainColor,
                        ))),
              ),
            ],
          ),
          const SizedBox(
            height: 44,
          ),
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {},
            builder: (context, state) {
              var authCubit = AuthenticationCubit.get(context);
              return buildButton(
                  name: 'Login',
                  onPress: () {
                    authCubit.login(
                        emailController.text, passController.text, context);
                  });
            },
          ),
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  navigateTo(context, const SignupScreen());
                },
                child: Text(
                  "Signup",
                  style: GoogleFonts.roboto(
                      color: mainColor,
                      fontSize: 13,
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
                style: GoogleFonts.roboto(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              myLine(width: 120, left: 9, right: 30),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/twitter.svg'),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/facebook.svg'),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/google.svg'),
            ],
          ),
          SizedBox(
            height: 44.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter as a guest',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ))
            ],
          )
        ],
      )),
    ));
  }
}
