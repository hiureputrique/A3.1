import 'package:qualyfine/app/modules/atleta/atleta_repository.dart';
import 'package:qualyfine/app/modules/atleta/atleta_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AtletaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AtletaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AtletaRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<AtletaModule>.of();
}
