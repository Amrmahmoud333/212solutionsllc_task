import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_212solutionsllc/logic/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:task_212solutionsllc/views/shared/custom_button.dart';
import 'package:task_212solutionsllc/views/sign_in/widgets/input_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // this two function to make responsice degsin
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    AuthenticationCubit cubit = context.read<AuthenticationCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h(851),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: h(209),
                    child: Image.asset(
                      'assets/divider_top.png',
                      width: w(293),
                      height: h(209),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: h(209),
                    child: Image.asset(
                      'assets/divider_bottom.png',
                      width: w(293),
                      height: h(209),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: h(190),
                  child: Padding(
                    padding: EdgeInsets.only(left: w(40)),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h(48.16),
                          ),
                          SizedBox(
                            width: w(313),
                            child: const Center(
                              child: Text(
                                'Welcome back',
                                style: TextStyle(
                                  fontFamily: 'DavidLibre',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 221, 59, 116),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: h(41)),
                          InputField(
                            label: 'Email',
                            sizeoflabel: 18,
                            obscureText: false,
                            controller: emailController,
                          ),
                          SizedBox(height: h(34)),
                          InputField(
                            label: 'Password',
                            sizeoflabel: 18,
                            obscureText: false,
                            controller: passwordController,
                            widget: InkWell(
                              onTap: () {
                                // cubit.changeObscureText();
                              },
                              child: const Text(
                                // cubit.obscureText ? 'Show' : 'Hide',
                                'show',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'DavidLibre',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 221, 59, 116),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h(25),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w(53)),
                            child: CustomButton(
                              label: 'Log in',
                              ontap: () {
                                cubit.signIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
