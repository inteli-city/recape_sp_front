import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';

import '../../../domain/enums/fonte_enum.dart';
import '../../../domain/enums/revestimento_enum.dart';
import '../../../domain/enums/status_obra_enum.dart';
import '../../../domain/enums/subprefeitura_enum.dart';

abstract class IObrasDatasource {
  Future<List<ObraEntity>> getAllObras();
  Future<ObraEntity> postCreateObra(
      FonteEnum fonte,
      StatusObraEnum status,
      String via,
      String de,
      String ate,
      String viaPadrao,
      String? viaComplemento,
      String? extensao,
      String? area,
      String? dataTermino,
      SubprefeituraEnum subprefeitura,
      RevestimentoEnum? revestimento,
      String? comentarios,
      String file);
  Future<ObraEntity> postDeleteObra(String id);
  Future<ObraEntity> postUpdateObra(ObraEntity obra);
  Future<List<ObraEntity>> postUpdateMotoverificacao(Map<String, dynamic> json);
}
