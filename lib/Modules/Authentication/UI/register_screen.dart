import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_store/Component/custom_text_field.dart';
import 'package:shoes_store/Modules/Authentication/Validators/validators.dart';
import 'package:shoes_store/Modules/Home/Pages/dashboard_screen.dart';
import 'package:shoes_store/Utils/shared_preference.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onPressedIcon;
  final VoidCallback onPressedOpenScreen;
  final bool isObscure;

  const RegisterScreen({
    Key? key,
    required this.onPressedIcon,
    required this.onPressedOpenScreen,
    required this.isObscure,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimationConfiguration.staggeredList(
      duration: const Duration(milliseconds: 1200),
      position: 4,
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: widget.onPressedOpenScreen,
                    child: SvgPicture.asset(
                      'images/svg/close.svg',
                      width: 50,
                      height: 50,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(AppLocalizations.of(context)!.registerWelcome,style: const TextStyle(fontSize: 25),),
                  SizedBox(
                    width: size.width,
                    height: size.height*0.5,
                    child: ListView(
                      children: [
                        CustomTextField(
                          title: AppLocalizations.of(context)!.name,
                          onLoginScreen: false,
                          validator: Validators.nameValidator(context),
                          isObscure: false,
                          controller: nameController,
                          isButton: false,
                          hintText: AppLocalizations.of(context)!.nameHint,
                        ),
                        CustomTextField(
                          title: AppLocalizations.of(context)!.email,
                          onLoginScreen: false,
                          validator: Validators.emailValidator(context),
                          isObscure: false,
                          controller: emailController,
                          isButton: false,
                          hintText: AppLocalizations.of(context)!.emailHint,
                        ),
                        CustomTextField(
                          title: AppLocalizations.of(context)!.password,
                          onLoginScreen: false,
                          validator: Validators.passwordValidator(context),
                          isObscure: widget.isObscure,
                          onPressed: widget.onPressedIcon,
                          controller: passwordController,
                          isButton: true,
                          hintText: AppLocalizations.of(context)!.passwordHint,
                          assetIcon: widget.isObscure
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
                            onPressed: () => onPressedRegisterButton(context),
                            child: Text(AppLocalizations.of(context)!.registerButton),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        const SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressedRegisterButton(BuildContext context) {
    final String username = nameController.text;
    final String email = emailController.text;
    PrefManager.setUsername(username);
    PrefManager.setEmailAddress(email);
    final form = _formKey.currentState?.validate();
     if (form != null && form) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('yo')));
      Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
    }
  }
}
