import 'package:flutter/material.dart';
import 'package:front_end/components/login_form.dart';
import 'package:front_end/components/social_button.dart';
import 'package:front_end/utils/config.dart';
import 'package:front_end/utils/text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
            AppTex.entText['singIn_tex']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          const LoginForm(),
          Config.spaceSmall,
          Center(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  AppTex.entText['forgot-password']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
          ),
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
                AppTex.entText['singUp_tex']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
              const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      )),
    ));
  }
}
