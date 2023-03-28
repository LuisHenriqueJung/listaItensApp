// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listagem/components/drawer_menu.dart';
import 'package:listagem/components/searchFiel_widget.dart';
import 'package:listagem/models/ItemModel.dart';
import 'package:listagem/models/user_model.dart';
import 'package:listagem/modules/crud/controllers/itens_controller.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ListagemPage extends StatefulWidget {
  const ListagemPage({super.key});

  @override
  State<ListagemPage> createState() => _ListagemPageState();
}

class _ListagemPageState extends State<ListagemPage> {
  var _debugLabelString;
  final itens = Modular.get<ItemController>();
  bool isLoadign = false;
  @override
  void initState() {
    super.initState();
    refreshItens();
    getOneSignal();
  }

  Future refreshItens() async {
    setState(() {
      isLoadign = true;
    });
    await itens.readItens();
    setState(() {
      isLoadign = false;
    });
  }

  getOneSignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId("83713a64-52a7-4401-bc6f-ebe4284ae4ca");

    await OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerMenu(),
      appBar: AppBar(
        elevation: 0,
        title: Text('Meus itens'),
        actions: [
          IconButton(
              onPressed: () async {
                List<Item> toRemove = [];
                setState(() {
                  isLoadign = true;
                });
                for (var item in itens.listaItens) {
                  if (item.selected!) {
                    await itens.deleteItem(item.id!);
                    toRemove.add(item);
                    if (itens.listaItens.isEmpty) {
                      setState(() {});
                    }
                  }
                }

                itens.listaItens.removeWhere(
                  (e) => toRemove.contains(e),
                );
                List<Item> toRemoveSugestion = [];
                for (var item in itens.listaItensSuggestion) {
                  if (item.selected!) {
                    toRemoveSugestion.add(item);
                    if (itens.listaItensSuggestion.isEmpty) {
                      setState(() {});
                    }
                  }
                }
                itens.listaItensSuggestion.removeWhere(
                  (e) => toRemoveSugestion.contains(e),
                );

                setState(() {
                  isLoadign = false;
                });
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: (isLoadign)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (itens.listaItens.isEmpty)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Card(
                        margin: EdgeInsets.all(16),
                        elevation: 10,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              width: 110,
                              height: 90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage('images/Arrow.png'),
                                      scale: 0.1)),
                            ),
                            Flexible(
                              child: Text(
                                'Adicione itens acessando o menu no canto superior esquerdo!',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('images/Sadcat.png'),
                                scale: 0.1)),
                      ),
                      Flexible(
                        child: const Text(
                            'Parece que você não cadastrou nenhum item! \n ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                )
              : Observer(builder: (context) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 50,
                        child: SearchFieldWidget(
                            controller: itens.buscaController,
                            onChanged: (String value) async {
                              setState(() {
                                itens.readItensSuggestion(value);
                              });
                            },
                            hint: 'Buscar item'),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: itens.buscaController.text == ""
                              ? itens.listaItens.length
                              : itens.listaItensSuggestion.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              trailing: Checkbox(
                                  value: itens.buscaController.text == ""
                                      ? itens.listaItens[index].selected
                                      : itens
                                          .listaItensSuggestion[index].selected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      itens.buscaController.text == ""
                                          ? itens.listaItens[index].selected =
                                              value
                                          : itens.listaItensSuggestion[index]
                                              .selected = value;
                                    });
                                  }),
                              title: Text(itens.buscaController.text == ""
                                  ? itens.listaItens[index].descricao
                                  : itens
                                      .listaItensSuggestion[index].descricao),
                              subtitle: Text(itens.buscaController.text == ""
                                  ? '${itens.listaItens[index].quantidade.toString()} unidades'
                                  : '${itens.listaItensSuggestion[index].quantidade.toString()} unidades'),
                              onTap: () => Fluttertoast.showToast(
                                  msg: 'Pressione e segure para editar'),
                              onLongPress: () {
                                itens.isEdit = true;
                                itens.buscaController.text = "";
                                Modular.to.navigate('/crudmodule/editItem',
                                    arguments: itens.buscaController.text == ""
                                        ? itens.listaItens[index]
                                        : itens.listaItensSuggestion[index]);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
    );
  }
}
