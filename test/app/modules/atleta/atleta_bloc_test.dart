import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:qualyfine/app/modules/atleta/atleta_bloc.dart';
import 'package:qualyfine/app/modules/atleta/atleta_module.dart';

void main() {
  initModule(AtletaModule());
  AtletaBloc bloc;

  // setUp(() {
  //     bloc = AtletaModule.to.bloc<AtletaBloc>();
  // });

  // group('AtletaBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<AtletaBloc>());
  //   });
  // });
}
