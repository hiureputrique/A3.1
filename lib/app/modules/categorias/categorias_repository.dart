import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:qualyfine/app/model/categorias_model.dart';

import 'package:rxdart/rxdart.dart';

class CategoriasRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(Categorias.COLLECTION_NAME);

  void add(Categorias _categorias) => _collection.add(_categorias.toMap());

   void update(String _documentId, Categorias _categorias) =>
      _collection.document(_documentId).updateData(_categorias.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<Categorias>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Categorias>((document) => Categorias.fromMap(document))
          .toList()));

  Future<Categorias> getById(String _documentId) async {
    DocumentSnapshot categorias = await _collection.document(_documentId).get();

    return Categorias.fromMap(categorias);
  }

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

