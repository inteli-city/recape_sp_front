import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/active_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/geometry_status_enum.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/obra_repository_interface.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/infra/adapters/motoverificacao_adapter.dart';
import 'package:intl/intl.dart';
import '../../domain/enums/fonte_enum.dart';
import '../../domain/enums/revestimento_enum.dart';
import '../../domain/enums/status_obra_enum.dart';
import '../../domain/enums/subprefeitura_enum.dart';

class ObraRepositoryMock implements IObraRepository {
  var obras = <ObraEntity>[
    ObraEntity(
      statusGeometria: StatusGeometriaEnum.PROCESSADO,
      id: '1994',
      isActive: ActiveEnum.ATIVO,
      fonte: FonteEnum.CONSEMAVI_2021_2024,
      status: StatusObraEnum.SUSPENSO,
      via: 'Teste',
      de: 'Rua TAL NUMERO TAL',
      ate: 'Avnida 123',
      viaComplemento: 'Complemento',
      subprefeitura: SubprefeituraEnum.AF,
      extensao: '400',
      dataCriacao: '13/03/2016',
      dataTermino: '13/04/2017',
      dataUltimaAtualizacao: '13/03/2016',
      revestimento: RevestimentoEnum.SMA,
      comentarios:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      area: '',
      geometria: {
        "type": "MultiLineString",
        "coordinates": [
          [
            [-46.63860321044922, -23.54894332761618],
            [-46.63860321044922, -23.54894332761618],
            [-46.63860321044922, -23.54894332761618],
            [-46.63860321044922, -23.54894332761618],
            [-46.63860321044922, -23.54894332761618]
          ]
        ]
      },
      motoverificacao: MotoverificacaoEntity(
        dataMotoverificacaoConvias: '12/12/2021',
        justificativaIntelicity: 'Teste',
        motoverificacaoConvias: true,
        motoverificacaoIntelicity: true,
      ),
      image: "29a5a45f-1bbe-4906-bf98-fc7083076adf.png",
      atualizacoes: [
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
        'teste',
      ],
      viaPadrao: 'Via Padrão',
    ),
    ObraEntity(
      motoverificacao: MotoverificacaoEntity(
        dataMotoverificacaoConvias: '12/12/2021',
        justificativaIntelicity: 'Teste',
        motoverificacaoConvias: true,
        motoverificacaoIntelicity: true,
      ),
      isActive: ActiveEnum.ATIVO,
      statusGeometria: StatusGeometriaEnum.NOVO,
      id: '745',
      fonte: FonteEnum.CDHU,
      status: StatusObraEnum.PLANEJADO,
      via: 'ENGENHEIRO ARMANDO DE ARRUDA PEREIRA',
      de: 'Av. Dom Lucas Obas',
      ate: 'Av. do Estado',
      dataUltimaAtualizacao: '13/03/2016',
      dataCriacao: '13/03/2016',
      subprefeitura: SubprefeituraEnum.IP,
      revestimento: RevestimentoEnum.SMA,
      extensao: '390',
      comentarios: '',
      area: '',
      geometria: {
        'type': 'MultiLineString',
        'coordinates': [
          [
            [-46.754927826, -23.62334658],
            [-46.7555972, -23.6229005],
            [-46.755722124, -23.622816544]
          ],
          [
            [-46.756412541, -23.622185426],
            [-46.7569539, -23.6215735],
            [-46.7576149, -23.6207955]
          ],
          [
            [-46.7541513, -23.6238957],
            [-46.7542827, -23.6237765],
            [-46.754927826, -23.62334658]
          ],
          [
            [-46.755722124, -23.622816544],
            [-46.756036, -23.6226056],
            [-46.7563816, -23.6222204],
            [-46.756412541, -23.622185426]
          ]
        ]
      },
      image: "29a5a45f-1bbe-4906-bf98-fc7083076adf.png",
      atualizacoes: [''],
      viaPadrao: 'Via Padrão',
    ),
    ObraEntity(
      statusGeometria: StatusGeometriaEnum.APROVADO,
      viaPadrao: 'Via Padrão',
      id: '123',
      isActive: ActiveEnum.ATIVO,
      fonte: FonteEnum.CONSEMAVI_2021_2024,
      dataUltimaAtualizacao: '13/03/2016',
      dataCriacao: '13/03/2016',
      status: StatusObraEnum.CONCLUIDO,
      via: 'ACESSO AVENIDA DO ESTADO',
      de: 'Rua Dom Lucas Obas',
      ate: 'Av. do Estado',
      subprefeitura: SubprefeituraEnum.FO,
      extensao: '390',
      comentarios: '',
      dataTermino: '13/03/2016',
      revestimento: RevestimentoEnum.SMA,
      area: '',
      motoverificacao: MotoverificacaoEntity(
        dataMotoverificacaoConvias: '12/12/2021',
        justificativaIntelicity: 'Teste',
        motoverificacaoConvias: true,
        motoverificacaoIntelicity: true,
      ),
      image: "29a5a45f-1bbe-4906-bf98-fc7083076adf.png",
      atualizacoes: [''],
      geometria: {
        "type": "MultiLineString",
        "coordinates": [
          [
            [-46.754927826, -23.62334658],
            [-46.7555972, -23.6229005],
            [-46.755722124, -23.622816544]
          ],
          [
            [-46.756412541, -23.622185426],
            [-46.7569539, -23.6215735],
            [-46.7576149, -23.6207955]
          ],
          [
            [-46.7541513, -23.6238957],
            [-46.7542827, -23.6237765],
            [-46.754927826, -23.62334658]
          ],
          [
            [-46.755722124, -23.622816544],
            [-46.756036, -23.6226056],
            [-46.7563816, -23.6222204],
            [-46.756412541, -23.622185426]
          ]
        ]
      },
    ),
    ObraEntity(
      statusGeometria: StatusGeometriaEnum.APROVADO,
      viaPadrao: 'Via Padrão',
      id: '123',
      isActive: ActiveEnum.ATIVO,
      fonte: FonteEnum.CONSEMAVI_2021_2024,
      dataUltimaAtualizacao: '13/03/2016',
      dataCriacao: '13/03/2016',
      status: StatusObraEnum.CONCLUIDO,
      via: 'ACESSO AVENIDA DO ESTADO',
      de: 'Rua Dom Lucas Obas',
      ate: 'Av. do Estado',
      subprefeitura: SubprefeituraEnum.FO,
      extensao: '390',
      comentarios: '',
      dataTermino: '13/03/2016',
      revestimento: RevestimentoEnum.SMA,
      area: '',
      motoverificacao: MotoverificacaoEntity(
        dataMotoverificacaoConvias: '12/12/2021',
        justificativaIntelicity: 'Teste',
        motoverificacaoConvias: true,
        motoverificacaoIntelicity: true,
      ),
      image: "29a5a45f-1bbe-4906-bf98-fc7083076adf.png",
      atualizacoes: [''],
      geometria: {
        "type": "MultiLineString",
        "coordinates": [
          [
            [-46.754927826, -23.62334658],
            [-46.7555972, -23.6229005],
            [-46.755722124, -23.622816544]
          ],
          [
            [-46.756412541, -23.622185426],
            [-46.7569539, -23.6215735],
            [-46.7576149, -23.6207955]
          ],
          [
            [-46.7541513, -23.6238957],
            [-46.7542827, -23.6237765],
            [-46.754927826, -23.62334658]
          ],
          [
            [-46.755722124, -23.622816544],
            [-46.756036, -23.6226056],
            [-46.7563816, -23.6222204],
            [-46.756412541, -23.622185426]
          ]
        ]
      },
    ),
  ];

  @override
  Future<Either<Failure, ObraEntity>> createObra(
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
      String file) async {
    var obra = ObraEntity(
      id: (obras.length + 1).toString(),
      fonte: fonte,
      status: status,
      via: via,
      de: de,
      ate: ate,
      viaPadrao: viaPadrao,
      viaComplemento: viaComplemento,
      subprefeitura: subprefeitura,
      extensao: extensao,
      area: area,
      dataTermino: dataTermino,
      revestimento: revestimento,
      comentarios: comentarios,
      image: '29a5a45f-1bbe-4906-bf98-fc7083076adf.png',
      dataCriacao: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      dataUltimaAtualizacao: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      statusGeometria: StatusGeometriaEnum.NOVO,
      isActive: ActiveEnum.ATIVO,
      atualizacoes: ['Obra criada'],
      motoverificacao: MotoverificacaoEntity(
        dataMotoverificacaoConvias: '12/12/2021',
        justificativaIntelicity: 'Teste',
        motoverificacaoConvias: true,
        motoverificacaoIntelicity: true,
      ),
    );
    obras.add(obra);
    return right(obra);
  }

  @override
  Future<Either<Failure, List<ObraEntity>>> getAllObras() async {
    return right(obras);
  }

  @override
  Future<Either<Failure, ObraEntity>> updateObra(
      ObraEntity obraToUpdate) async {
    for (var i = 0; i < obras.length; i++) {
      if (obras[i].id == obraToUpdate.id) {
        obras.removeAt(i);
        obras.insert(i, obraToUpdate);
        return right(obraToUpdate);
      }
    }
    return left(
      UpdateObraError(
        errorMessage: "Obra não encontrada",
        stackTrace: StackTrace.current,
      ),
    );
  }

  @override
  Future<Either<Failure, ObraEntity>> deleteObra(String id) async {
    for (var i = 0; i < obras.length; i++) {
      if (obras[i].id == id) {
        obras.removeAt(i);
        return right(obras[i]);
      }
    }
    return left(
      DeleteObraError(
        errorMessage: "Obra não encontrada",
        stackTrace: StackTrace.current,
      ),
    );
  }

  @override
  Future<Either<Failure, List<ObraEntity>>> updateMotoverificacao(
      Map<String, dynamic> json) async {
    for (var i = 0; i < obras.length; i++) {
      if (obras[i].id == json['id']) {
        obras[i].motoverificacao = MotoverificacaoAdapter.fromJson(json);
        return right(obras);
      }
    }
    return left(
      UpdateMotoverificacaoError(
        errorMessage: "Motoverificacao não encontrada",
        stackTrace: StackTrace.current,
      ),
    );
  }
}
