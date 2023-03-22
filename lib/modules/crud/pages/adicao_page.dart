// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listagem/components/drawer_menu.dart';
import 'package:listagem/models/ItemModel.dart';
import 'package:listagem/modules/crud/controllers/itens_controller.dart';

import '../../../components/custom_textfield.dart';

class AdicaoPage extends StatefulWidget {
  final Item? item;

  const AdicaoPage({super.key, this.item});

  @override
  State<AdicaoPage> createState() => _AdicaoPageState();
}

class _AdicaoPageState extends State<AdicaoPage> {
  @override
  Widget build(BuildContext context) {
    final itemControler = Modular.get<ItemController>();
    if (widget.item != null) {
      itemControler.descricaoController.text = widget.item!.descricao;
      itemControler.quantidadeController.text =
          widget.item!.quantidade.toString();
    }

    return Scaffold(
      drawer: const MyDrawerMenu(),
      appBar: AppBar(
        title: const Text('Cadastrar novo item'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: itemControler.descricaoController,
                  hint: 'Descrição',
                  onChanged: null,
                  label: 'Insira a descrição do item',
                  keyboardType: TextInputType.name,
                  inputFormatters: [],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: itemControler.quantidadeController,
                  hint: 'Quantidade',
                  onChanged: null,
                  label: 'Insira a quantidade de itens',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {
                          itemControler.descricaoController.clear();
                          itemControler.quantidadeController.clear();
                        },
                        icon: const Icon(Icons.cleaning_services),
                        label: const Text('Limpar')),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton.icon(
                        onPressed: () async {
                          if (itemControler.descricaoController.text == '' ||
                              itemControler.quantidadeController.text == '') {
                            Fluttertoast.showToast(
                                msg: 'Todos os campos devem ser preenchidos!');
                          } else if (itemControler.isEdit) {
                            itemControler.isEdit = false;
                            widget.item!.descricao =
                                itemControler.descricaoController.text;
                            widget.item!.quantidade = int.parse(
                                itemControler.quantidadeController.text);
                            await itemControler.updateItem(widget.item!);
                            Fluttertoast.showToast(
                                msg: 'Alteração salva com sucesso!');
                            itemControler.descricaoController.clear();
                            itemControler.quantidadeController.clear();
                            Modular.to.navigate('/crudmodule/');
                          } else {
                            await itemControler.insertItem();
                            Fluttertoast.showToast(
                                msg:
                                    '${itemControler.descricaoController.text} cadastrado(a) com sucesso!');
                            itemControler.descricaoController.clear();
                            itemControler.quantidadeController.clear();
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Salvar')),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
