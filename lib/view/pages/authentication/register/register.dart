import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/colors.dart';
import '../../../componentes/auth/components.dart';
import '../../home/home_layout.dart';
import '../login/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                'SignUp',
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
              controller: nameController,
              hint: 'Name',
              type: TextInputType.name),
          const SizedBox(
            height: 25,
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
          const SizedBox(
            height: 44,
          ),
          buildButton(
              name: 'Signup',
              onPress: () {
                navigateTo(context, const HomeLayout());
                //  authCubit.login(emailController.text, passController.text, context);
              }),
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  navigateTo(context, const LoginScreen());
                },
                child: Text(
                  "Login",
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
        ],
      )),
    ));
  }
}
