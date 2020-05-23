import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:qualyfine/app/model/atleta_model.dart';
import 'package:rxdart/rxdart.dart';

class AtletaRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(Atleta.COLLECTION_NAME);

  void add(Atleta _atleta) => _collection.add(_atleta.toMap());

  void update(String _documentId, Atleta _atleta) =>
      _collection.document(_documentId).updateData(_atleta.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<Atleta>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Atleta>((document) => Atleta.fromMap(document))
          .toList()));

  Future<Atleta> getById(String _documentId) async {
    DocumentSnapshot _atleta = await _collection.document(_documentId).get();

    return Atleta.fromMap(_atleta);
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
