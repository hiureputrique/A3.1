import 'package:flutter/material.dart';
import 'package:qualyfine/app/model/categorias_model.dart';
import 'package:qualyfine/app/modules/categorias/categorias_bloc.dart';
import 'package:qualyfine/app/utils/main_drawer.dart';
import 'package:rxdart/rxdart.dart';
import 'categorias_editor_page.dart';



class CategoriasPage extends StatefulWidget {
  final String title;
  static const String route = '/categorias';
  
  
  const CategoriasPage({Key key, this.title = "Categorias"}) : super(key: key);

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  var _bloc = CategoriasBloc();
  
  var _categorias = Categorias()..nome = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriasEditorPage(_categorias),
            ),
          );
        },
      ),

      body:Container(
        child: StreamBuilder<List<Categorias>>(
          stream: _bloc.categorias,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map( 
                      (_categorias){   
                      return Dismissible(
                      key: Key(_categorias.documentId()),
                      onDismissed: (direction) {
                       _bloc.delete(_categorias.documentId());
                      },
                      child: ListTile(
                        title: Text(_categorias.nome),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoriasEditorPage(_categorias),
                       ),
                          );
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
