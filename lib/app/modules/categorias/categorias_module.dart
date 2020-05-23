import 'package:qualyfine/app/modules/categorias/categorias_repository.dart';
import 'package:qualyfine/app/modules/categorias/categorias_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CategoriasModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CategoriasBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => CategoriasRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<CategoriasModule>.of();
}
