// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobx/mobx.dart';

const String tabelaItens = 'itens';

class ItemFields {
  static final List<String> values = [id, descricao, quantidade];
  static const String id = '_id';
  static const String descricao = 'descricao';
  static const String quantidade = 'quantidade';
  static const String selected = 'selected';
}

class Item {
  int? id;
  String descricao;
  int quantidade;
  bool? selected;
  Item(
      {this.id,
      required this.descricao,
      required this.quantidade,
      this.selected});

  Item copyWith({int? id, String? descricao, int? quantidade, bool? selected}) {
    return Item(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ItemFields.id: id,
      ItemFields.descricao: descricao,
      ItemFields.quantidade: quantidade,
      ItemFields.selected: selected == true ? 1 : 0
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map[ItemFields.id] as int,
        descricao: map[ItemFields.descricao] as String,
        quantidade: map[ItemFields.quantidade] as int,
        selected: map[ItemFields.selected] == 1 ? true : false);
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Item(id: $id, descricao: $descricao, quantidade: $quantidade)';

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.descricao == descricao &&
        other.quantidade == quantidade;
  }

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode ^ quantidade.hashCode;
}
