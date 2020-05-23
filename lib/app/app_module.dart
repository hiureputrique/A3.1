

import 'package:qualyfine/app/modules/categorias/categorias_repository.dart';
import 'package:qualyfine/app/modules/logon/logon_bloc.dart';

import 'package:qualyfine/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:qualyfine/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LogonBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        
        Dependency((i) => CategoriasRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
