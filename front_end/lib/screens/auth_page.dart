import 'package:flutter/material.dart';
import 'package:front_end/components/login_form.dart';
import 'package:front_end/components/sign_up_form.dart';
import 'package:front_end/components/social_button.dart';
import 'package:front_end/utils/config.dart';
import 'package:front_end/utils/text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().int(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTex.entText['welcome_text']!,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Text(
            isSignIn
                ? AppTex.entText['singIn_tex']!
                : AppTex.entText['register_tex']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          isSignIn ? LoginForm() : SingUpForm(),
          Config.spaceSmall,
          isSignIn
              ? Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppTex.entText['forgot-password']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              : Container(),
          const Spacer(),
          Center(
            child: Text(
              AppTex.entText['social-login']!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Config.spaceSmall,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SocialButton(social: 'google'),
              SocialButton(social: 'facebook'),
            ],
          ),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                isSignIn
                    ? AppTex.entText['singUp_tex']!
                    : AppTex.entText['registered_tex']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: Text(
                  isSignIn ? 'Cadastre-se' : 'Login',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    ));
  }
}
