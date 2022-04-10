import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shoes_store/Component/custom_text_field.dart';
import 'package:shoes_store/Modules/Authentication/UI/register_screen.dart';
import 'package:shoes_store/Modules/Authentication/Validators/validators.dart';
import 'package:shoes_store/Values/app_colors.dart';
import 'package:shoes_store/Values/app_styles.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String routeName = 'auth-screen';

  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool selected = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimationConfiguration.staggeredList(
      position: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Stack(clipBehavior: Clip.none, children: [
              SlideAnimation(
                verticalOffset: 200,
                duration: const Duration(milliseconds: 600),
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    width: size.width * 0.75,
                    height: size.height * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: Offset(2, 8))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(
                              height: size.height*0.12,
                            ),
                            Text(AppLocalizations.of(context)!.loginWelcome,style: const TextStyle(fontSize: 25),),
                            const SizedBox(height: 20,),
                            CustomTextField(
                              title: AppLocalizations.of(context)!.email,
                              onLoginScreen: true,
                              isObscure: false,
                              controller: emailController,
                              validator: Validators.emailValidator(context),
                              isButton: false,
                              hintText: AppLocalizations.of(context)!.emailHint,
                            ),
                            CustomTextField(
                              title: AppLocalizations.of(context)!.password,
                              onLoginScreen: true,
                              validator: Validators.passwordValidator(context),
                              isObscure: isObscure,
                              onPressed: () {
                                setState(() => isObscure = !isObscure);
                              },
                              controller: passwordController,
                              isButton: true,
                              hintText:
                                  AppLocalizations.of(context)!.passwordHint,
                              assetIcon: isObscure
                                  ? 'images/svg/sleep.svg'
                                  : 'images/svg/eye.svg',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: size.width,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => onPressedLoginButton(),
                                child: Text(
                                    AppLocalizations.of(context)!.loginButton),
                                style: ElevatedButton.styleFrom(
                                    primary: AppColor.teal,
                                    elevation: 4,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.qHaveAccount,
                                style: AppStyle.qHaveAccount,
                              ),
                              TextButton(
                                onPressed: () =>
                                    setState(() => selected = false),
                                style: TextButton.styleFrom(
                                    primary: AppColor.teal),
                                child: Text(
                                  AppLocalizations.of(context)!.registerButton,
                                  style: AppStyle.qHaveAccount,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                width: selected ? 100 : size.width * 0.75,
                height: selected ? 100 : size.height * 0.7,
                top: selected ? -35 : 0,
                right: selected ? -20 : 0,
                curve: Curves.easeInOutBack,
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 900),
                  horizontalOffset: 50,
                  child: FadeInAnimation(
                    duration: const Duration(milliseconds: 900),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.teal,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(1, 4))
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => selected = false),
                        child: selected
                            ? Center(
                                child: Image.asset('images/register.png',
                                    height: 70, width: 70, color: Colors.black),
                              )
                            : RegisterScreen(
                                onPressedIcon: () =>
                                    setState(() => isObscure = !isObscure),
                                onPressedOpenScreen: () =>
                                    setState(() => selected = true),
                                isObscure: isObscure,
                              ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void onPressedLoginButton() {
    final form = _formKey.currentState?.validate();
    if (form != null && form) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('yo')));
    }
  }
}
