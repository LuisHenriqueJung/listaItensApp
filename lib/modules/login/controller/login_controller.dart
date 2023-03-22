import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/modules/crud/controllers/itens_controller.dart';

import '../../../models/user_model.dart';

class LoginController {
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future<bool> login() async {
    final user = Modular.get<User>();
    if (nome.text == user.nome && senha.text == user.senha) {
      nome.clear();
      senha.clear();
      return true;
    } else {
      return false;
    }
  }
}
