import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class User = UserBase with _$User;

abstract class UserBase with Store {
  @observable
  String nome = 'admin';
  @observable
  String senha = 'admin';
}
