import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qualyfine/app/model/base_model.dart';

class Atleta extends BaseModel{
  static const String COLLECTION_NAME = 'Atletas';
  static const String NOME = "nome",
      DATA_NASCIMENTO = "data_nascimento",
      CATEGORIAS_ID = "categorias_id",
      SEXO = "sexo";
  String _documentId;
  String nome, categoriasId, sexo;
  DateTime dataNascimento;

  Atleta();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Atleta.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Atleta.NOME];
    Timestamp ts = document.data[Atleta.DATA_NASCIMENTO];
    this.dataNascimento =
        DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
    this.categoriasId = document.data[Atleta.CATEGORIAS_ID];
    this.sexo = document.data[Atleta.SEXO];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map[Atleta.NOME] = this.nome;
    map[Atleta.DATA_NASCIMENTO] = this.dataNascimento;
    map[Atleta.CATEGORIAS_ID] = this.categoriasId;
    map[Atleta.SEXO] = this.sexo;

    return map;
  }
}
