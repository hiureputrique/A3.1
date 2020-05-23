import 'package:flutter/material.dart';
import 'package:qualyfine/app/model/categorias_model.dart';
import 'package:qualyfine/app/modules/categorias/categorias_bloc.dart';


class CategoriasEditorPage extends StatefulWidget {
  final Categorias categoarias;

  CategoriasEditorPage(this.categoarias);

  @override
  State<StatefulWidget> createState() => _CategoriasEditorPageState();
}

class _CategoriasEditorPageState extends State<CategoriasEditorPage> {
  TextEditingController _nomeController;
  final _bloc = CategoriasBloc();

  @override
  void initState() {
    _bloc.setCategorias(widget.categoarias);
    _nomeController = TextEditingController(text: widget.categoarias.nome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar categoria'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  if (_bloc.insertOrUpdate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
