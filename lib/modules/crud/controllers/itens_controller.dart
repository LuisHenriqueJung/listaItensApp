import 'package:listagem/database/db_conection.dart';
import 'package:listagem/models/ItemModel.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
part 'itens_controller.g.dart';

class ItemController = ItemControllerBase with _$ItemController;

abstract class ItemControllerBase with Store {
  @observable
  TextEditingController descricaoController = TextEditingController();
  @observable
  TextEditingController quantidadeController = TextEditingController();
  @observable
  TextEditingController buscaController = TextEditingController();
  @observable
  ObservableList<Item> listaItens = ObservableList<Item>();

  @observable
  ObservableList<Item> listaItensSuggestion = ObservableList<Item>();

  @observable
  bool isEdit = false;

  @action
  Future readItens() async {
    listaItens.clear();
    dynamic result = await ItensDatabase.instance.readAllItem();
    for (var element in result) {
      listaItens.add(element);
    }
  }

  @action
  Future insertItem() async {
    int quantidade = int.parse(quantidadeController.text);
    final Item novoitem = Item(
        descricao: descricaoController.text,
        quantidade: quantidade,
        selected: false);
    if (novoitem.quantidade % 10 == 0) {
      var playerId = await getPlayerId();
      var notification = OSCreateNotification(
        playerIds: ['0bb5bf43-3793-41a8-ba46-aa1918c2e44f'],
        content: "Foi adicionado um novo item com quantidade multipla de 10!",
        heading: "Multiplo de 10 adicionado",
      );
      var response = await OneSignal.shared.postNotification(notification);
      print('$response AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    }
    listaItens.add(await ItensDatabase.instance.insertItem(novoitem));
  }

  Future<String?> getPlayerId() async {
    final status = await OneSignal.shared.getDeviceState();
    return status?.userId ?? 'not found';
  }

  @action
  Future<bool> deleteItem(int id) async {
    int afectedRows = await ItensDatabase.instance.deleteItem(id);
    return (afectedRows == 0) ? false : true;
  }

  @action
  Future<bool> updateItem(Item item) async {
    int afectedRows = await ItensDatabase.instance.updateItem(item);
    return (afectedRows == 0) ? false : true;
  }

  @action
  Future<ObservableList<Item>> readItensSuggestion(String query) async {
    listaItensSuggestion.clear();
    for (var element in listaItens) {
      if (element.descricao.toUpperCase().contains(query.toUpperCase())) {
        listaItensSuggestion.add(element);
      }
    }
    return listaItensSuggestion;
  }
}
