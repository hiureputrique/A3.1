import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:qualyfine/app/modules/categorias/categorias_bloc.dart';
import 'package:qualyfine/app/modules/categorias/categorias_module.dart';

void main() {
  initModule(CategoriasModule());
  CategoriasBloc bloc;

  // setUp(() {
  //     bloc = CategoriasModule.to.bloc<CategoriasBloc>();
  // });

  // group('CategoriasBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<CategoriasBloc>());
  //   });
  // });
}
