// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/modules/crud/controllers/itens_controller.dart';
import 'package:listagem/modules/crud/crud_module.dart';

class MyDrawerMenu extends StatelessWidget {
  const MyDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final itensController = Modular.get<ItemController>();
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Center(
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      selectedTileColor: Colors.grey.shade300,
                      selectedColor: Colors.black,
                      leading: const Icon(Icons.list),
                      selected: (menuSelected == 2) ? true : false,
                      onTap: () {
                        menuSelected = 2;
                        Modular.to.navigate('/crudmodule/');
                      },
                      title: const Text('Listar itens'),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      dense: true,
                      selectedTileColor: Colors.grey.shade300,
                      selectedColor: Colors.black,
                      leading: const Icon(Icons.add),
                      selected: (menuSelected == 1) ? true : false,
                      onTap: () {
                        menuSelected = 1;
                        Modular.to.navigate('/crudmodule/novoitem');
                      },
                      title: const Text('Novo item'),
                    ),
                    Divider(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 100,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      onTap: () {
                        menuSelected = 3;
                        Modular.to.popAndPushNamed('/');
                      },
                      dense: true,
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      title: Text('Sair'),
                    ),
                    Divider(
                      height: 2,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
