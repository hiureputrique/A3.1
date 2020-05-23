import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class Categorias extends BaseModel {
  static const String COLLECTION_NAME = 'Categorias';
  static const String NOME = "nome";
  String _documentId;
  String nome;

  Categorias();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Categorias.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Categorias.NOME];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;

    return map;
  }
}
