import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:qualyfine/app/app_module.dart';
import 'package:qualyfine/app/model/categorias_model.dart';
import 'package:qualyfine/app/modules/categorias/categorias_repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoriasBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<CategoriasRepository>();
  String _documentId;
  String _nome;
 
 CategoriasBloc(){
   _nomeController.listen((value) => _nome = value);
 }

 var _nomeController = BehaviorSubject<String>();
 Stream<String> get outNome => _nomeController.stream;
 void setNome(String value) => _nomeController.sink.add(value);
 
 
 Observable<List<Categorias>> get categorias => _repository.getAll;
 
  void delete(String _documentId) => _repository.delete(_documentId);

  void setCategorias(Categorias categorias) {
    _documentId = categorias.documentId();
    setNome(categorias.nome);
  }

  @override
  void dispose() {
    super.dispose();
  }
bool insertOrUpdate() {
    var _categorias = Categorias()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_categorias);
    } else {
      _repository.update(_documentId, _categorias);
    }

    return true;
  }
}

