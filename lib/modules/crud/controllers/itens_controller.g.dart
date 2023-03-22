// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemController on ItemControllerBase, Store {
  late final _$descricaoControllerAtom =
      Atom(name: 'ItemControllerBase.descricaoController', context: context);

  @override
  TextEditingController get descricaoController {
    _$descricaoControllerAtom.reportRead();
    return super.descricaoController;
  }

  @override
  set descricaoController(TextEditingController value) {
    _$descricaoControllerAtom.reportWrite(value, super.descricaoController, () {
      super.descricaoController = value;
    });
  }

  late final _$quantidadeControllerAtom =
      Atom(name: 'ItemControllerBase.quantidadeController', context: context);

  @override
  TextEditingController get quantidadeController {
    _$quantidadeControllerAtom.reportRead();
    return super.quantidadeController;
  }

  @override
  set quantidadeController(TextEditingController value) {
    _$quantidadeControllerAtom.reportWrite(value, super.quantidadeController,
        () {
      super.quantidadeController = value;
    });
  }

  late final _$buscaControllerAtom =
      Atom(name: 'ItemControllerBase.buscaController', context: context);

  @override
  TextEditingController get buscaController {
    _$buscaControllerAtom.reportRead();
    return super.buscaController;
  }

  @override
  set buscaController(TextEditingController value) {
    _$buscaControllerAtom.reportWrite(value, super.buscaController, () {
      super.buscaController = value;
    });
  }

  late final _$listaItensAtom =
      Atom(name: 'ItemControllerBase.listaItens', context: context);

  @override
  ObservableList<Item> get listaItens {
    _$listaItensAtom.reportRead();
    return super.listaItens;
  }

  @override
  set listaItens(ObservableList<Item> value) {
    _$listaItensAtom.reportWrite(value, super.listaItens, () {
      super.listaItens = value;
    });
  }

  late final _$listaItensSuggestionAtom =
      Atom(name: 'ItemControllerBase.listaItensSuggestion', context: context);

  @override
  ObservableList<Item> get listaItensSuggestion {
    _$listaItensSuggestionAtom.reportRead();
    return super.listaItensSuggestion;
  }

  @override
  set listaItensSuggestion(ObservableList<Item> value) {
    _$listaItensSuggestionAtom.reportWrite(value, super.listaItensSuggestion,
        () {
      super.listaItensSuggestion = value;
    });
  }

  late final _$isEditAtom =
      Atom(name: 'ItemControllerBase.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$readItensAsyncAction =
      AsyncAction('ItemControllerBase.readItens', context: context);

  @override
  Future<dynamic> readItens() {
    return _$readItensAsyncAction.run(() => super.readItens());
  }

  late final _$insertItemAsyncAction =
      AsyncAction('ItemControllerBase.insertItem', context: context);

  @override
  Future<dynamic> insertItem() {
    return _$insertItemAsyncAction.run(() => super.insertItem());
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('ItemControllerBase.deleteItem', context: context);

  @override
  Future<bool> deleteItem(int id) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(id));
  }

  late final _$updateItemAsyncAction =
      AsyncAction('ItemControllerBase.updateItem', context: context);

  @override
  Future<bool> updateItem(Item item) {
    return _$updateItemAsyncAction.run(() => super.updateItem(item));
  }

  late final _$readItensSuggestionAsyncAction =
      AsyncAction('ItemControllerBase.readItensSuggestion', context: context);

  @override
  Future<ObservableList<Item>> readItensSuggestion(String query) {
    return _$readItensSuggestionAsyncAction
        .run(() => super.readItensSuggestion(query));
  }

  @override
  String toString() {
    return '''
descricaoController: ${descricaoController},
quantidadeController: ${quantidadeController},
buscaController: ${buscaController},
listaItens: ${listaItens},
listaItensSuggestion: ${listaItensSuggestion},
isEdit: ${isEdit}
    ''';
  }
}
