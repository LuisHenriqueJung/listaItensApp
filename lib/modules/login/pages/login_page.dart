// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:listagem/components/custom_textfield.dart';
import 'package:listagem/modules/login/controller/login_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('images/List.png'),
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Bem vindo! ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Faça Login para continuar!'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: loginController.nome,
                  hint: 'Usuário',
                  label: 'Usuario',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    obscure: true,
                    controller: loginController.senha,
                    hint: 'Senha',
                    label: 'Senha'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      bool sucess = await loginController.login();
                      if (sucess) {
                        Modular.to.pushNamed('/crudmodule/');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Usuário ou senha incorreto');
                      }
                    },
                    child: const Text('Entrar'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
