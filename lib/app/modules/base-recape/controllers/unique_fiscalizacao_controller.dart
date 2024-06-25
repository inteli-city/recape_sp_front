import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/base_recape_controller.dart';
import 'package:recape_sp_front/app/modules/base-recape/states/update_motoverificacao_state.dart';
import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/update_motoverificacao_usecase.dart';
import 'package:mobx/mobx.dart';
part 'unique_fiscalizacao_controller.g.dart';

class UniqueFiscalizacaoController = UniqueFiscalizacaoControllerBase
    with _$UniqueFiscalizacaoController;

abstract class UniqueFiscalizacaoControllerBase with Store {
  final IUpdateMotoverificacaoUsecase _updateMotoverificacao;
  final String obraId;
  UniqueFiscalizacaoControllerBase(this._updateMotoverificacao,
      {required this.obraId, required this.motoverificacao});

  @observable
  MotoverificacaoEntity motoverificacao;

  @action
  setMotoverificacaoConvias(bool? value) {
    var novaMotoverificacao = MotoverificacaoEntity(
      motoverificacaoConvias: value,
      dataMotoverificacaoConvias: motoverificacao.dataMotoverificacaoConvias,
      motoverificacaoIntelicity: motoverificacao.motoverificacaoIntelicity,
      justificativaIntelicity: motoverificacao.justificativaIntelicity,
    );
    motoverificacao = novaMotoverificacao;
  }

  @action
  setMotoverificacaoIntelicity(bool? value) {
    var novaMotoverificacao = MotoverificacaoEntity(
      motoverificacaoConvias: motoverificacao.motoverificacaoConvias,
      dataMotoverificacaoConvias: motoverificacao.dataMotoverificacaoConvias,
      motoverificacaoIntelicity: value,
      justificativaIntelicity: motoverificacao.justificativaIntelicity,
    );
    motoverificacao = novaMotoverificacao;
  }

  @action
  setJustificativaIntelicity(String? value) {
    var novaMotoverificacao = MotoverificacaoEntity(
      motoverificacaoConvias: motoverificacao.motoverificacaoConvias,
      dataMotoverificacaoConvias: motoverificacao.dataMotoverificacaoConvias,
      motoverificacaoIntelicity: motoverificacao.motoverificacaoIntelicity,
      justificativaIntelicity: value,
    );
    motoverificacao = novaMotoverificacao;
  }

  @action
  String? validateJustificativaIntelicity(String? value) {
    if (motoverificacao.motoverificacaoIntelicity != null &&
        !motoverificacao.motoverificacaoIntelicity! &&
        (value == null || value.isEmpty)) {
      return 'Justificativa obrigatória';
    }
    return null;
  }

  @observable
  UpdateMotoverificacaoState state = const StartUpdateMotoverificacaoState();

  @action
  void changeState(UpdateMotoverificacaoState value) => state = value;

  @action
  Future<void> updateMotoverificacao() async {
    changeState(const LoadingUpdateMotoverificacaoState());

    final result = await _updateMotoverificacao(json: {
      'motoverificacao_convias': motoverificacao.motoverificacaoConvias,
      'motoverificacao_intelicity': motoverificacao.motoverificacaoIntelicity,
      'justificativa_intelicity': motoverificacao.justificativaIntelicity,
      'listIds': [obraId],
    });
    changeState(result.fold(
      (l) => ErrorUpdateMotoverificacaoState(l),
      (r) => SuccessUpdateMotoverificacaoState(r),
    ));
    await Modular.get<BaseRecapeController>().getAllObras();
  }
}
