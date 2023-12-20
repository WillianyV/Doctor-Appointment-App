import 'package:flutter/material.dart';
import 'package:front_end/components/button.dart';
import 'package:front_end/main.dart';
import 'package:front_end/models/auth_model.dart';
import 'package:front_end/providers/dio_provider.dart';
import 'package:front_end/utils/config.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Digite o email',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              // prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obscurePass,
            decoration: InputDecoration(
                hintText: 'Digite a senha',
                labelText: 'Senha',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                // prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePass = !obscurePass;
                      });
                    },
                    icon: obscurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(
            builder: (context, auth, child) {
              return Button(
                width: double.infinity,
                title: 'Entrar',
                disable: false,
                onPressed: () async {
                  // login
                  final token = await DioProvider()
                      .getToken(_emailController.text, _passController.text);

                  if (token) {
                    auth.loginSuccess();
                    MyApp.navigatorKey.currentState!.pushNamed('main');
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
