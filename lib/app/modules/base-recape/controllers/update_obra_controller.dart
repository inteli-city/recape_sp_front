import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/active_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/geometry_status_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/subprefeitura_enum.dart';
import 'package:recape_sp_front/app/shared/infra/adapters/obra_adapter.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/domain/enums/revestimento_enum.dart';
import '../../../shared/domain/enums/status_obra_enum.dart';
import '../../../shared/domain/usecases/delete_obra_usecase.dart';
import '../../../shared/domain/usecases/update_obra_usecase.dart';
import '../../../shared/helpers/utils/validation_field_helper.dart';
import '../states/update_obra_state.dart';
import 'base_recape_controller.dart';

part 'update_obra_controller.g.dart';

class UpdateObraController = UpdateObraControllerBase
    with _$UpdateObraController;

abstract class UpdateObraControllerBase with Store {
  final IUpdateObraUsecase _updateObraUsecase;
  final IDeleteObraUsecase _deleteObraUsecase;
  final ObraEntity obra;

  UpdateObraControllerBase(
      this._updateObraUsecase, this._deleteObraUsecase, this.obra) {
    obraUpdated = obra;
  }

  @observable
  ObraEntity obraUpdated = ObraEntity(
    image: '',
    id: '',
    fonte: null,
    status: null,
    via: '',
    de: '',
    ate: '',
    viaPadrao: '',
    subprefeitura: null,
    extensao: '',
    area: '',
    dataTermino: null,
    dataUltimaAtualizacao: '',
    dataCriacao: '',
    revestimento: RevestimentoEnum.NONE,
    comentarios: null,
    atualizacoes: [],
    statusGeometria: StatusGeometriaEnum.NOVO,
    isActive: null,
    geometria: null,
    motoverificacao: MotoverificacaoEntity(
      dataMotoverificacaoConvias: null,
      justificativaIntelicity: null,
      motoverificacaoConvias: null,
      motoverificacaoIntelicity: null,
    ),
  );

  @observable
  UpdateObraState state = const StartUpdateState();

  @action
  void changeState(UpdateObraState value) => state = value;

  @action
  void setFonte(FonteEnum? value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, fonte: value);
  }

  @action
  String? validateFonte(FonteEnum? value) {
    return ValidationFieldHelper.validateFonte(value);
  }

  @action
  void setStatus(StatusObraEnum? value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, status: value);
    if (value != StatusObraEnum.CONCLUIDO) {
      setDataTermino('');
    }
  }

  @action
  String? validateStatus(StatusObraEnum? value) {
    return ValidationFieldHelper.validateStatus(value);
  }

  @action
  void setVia(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, via: value);
  }

  @action
  String? validateVia(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @action
  void setDe(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, de: value);
  }

  @action
  String? validateDe(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @action
  void setAte(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, ate: value);
  }

  @action
  String? validateAte(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @action
  void setViaPadrao(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, viaPadrao: value);
  }

  @action
  String? validateViaPadrao(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @action
  void setViaComplemento(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, viaComplemento: value);
  }

  @action
  void setSubprefeitura(SubprefeituraEnum? value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, subprefeitura: value);
  }

  @action
  String? validateSubprefeitura(SubprefeituraEnum? value) {
    return ValidationFieldHelper.validateSubprefeitura(value);
  }

  @action
  void setExtensao(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, extensao: value);
  }

  @action
  void setArea(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, area: value);
  }

  @action
  void setDataTermino(String? value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, dataTermino: value);
  }

  @action
  String? validateDataTermino(String? value) {
    if (obraUpdated.status == StatusObraEnum.CONCLUIDO) {
      return ValidationFieldHelper.validateDataTermino(value);
    }
    return null;
  }

  @action
  void setRevestimento(RevestimentoEnum? value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated,
        revestimento: value ?? RevestimentoEnum.NONE);
  }

  @action
  void setComentarios(String value) {
    obraUpdated = ObraAdapter.copyWith(obraUpdated, comentarios: value);
  }

  @action
  Future<void> setImage(XFile file) async {
    obraUpdated = ObraAdapter.copyWith(obraUpdated,
        image: base64Encode(await file.readAsBytes()));
  }

  @action
  bool validateAddressChange() {
    return !((obra.via != obraUpdated.via ||
            obra.de != obraUpdated.de ||
            obra.ate != obraUpdated.ate ||
            obra.viaPadrao != obraUpdated.viaPadrao ||
            obra.viaComplemento != obraUpdated.viaComplemento) &&
        obraUpdated.image == obra.image);
  }

  @action
  Future<void> updateObra() async {
    changeState(const LoadingUpdateState());
    if (obraUpdated.image != obra.image) {
      obraUpdated = ObraAdapter.copyWith(obraUpdated,
          statusGeometria: StatusGeometriaEnum.EDITADO);
    }
    if (obraUpdated.status == StatusObraEnum.SUSPENSO ||
        obraUpdated.status == StatusObraEnum.EXCLUIDO) {
      obraUpdated =
          ObraAdapter.copyWith(obraUpdated, isActive: ActiveEnum.INATIVO);
    }
    if (obra.statusGeometria == StatusGeometriaEnum.APROVADO) {
      if ((obra.status == StatusObraEnum.SUSPENSO ||
              obra.status == StatusObraEnum.EXCLUIDO) &&
          (obraUpdated.status != StatusObraEnum.SUSPENSO &&
              obraUpdated.status != StatusObraEnum.EXCLUIDO)) {
        obraUpdated =
            ObraAdapter.copyWith(obraUpdated, isActive: ActiveEnum.ATIVO);
      }
    }
    final result = await _updateObraUsecase(obraUpdated);
    changeState(result.fold(
      (l) => ErrorUpdateState(l),
      (r) => SuccessUpdateState(r),
    ));
    await Modular.get<BaseRecapeController>().getAllObras();
  }

  @action
  Future<void> deleteObra() async {
    changeState(const LoadingUpdateState());
    final result = await _deleteObraUsecase(obraUpdated.id!);
    changeState(result.fold(
      (l) => ErrorUpdateState(l),
      (r) => SuccessUpdateState(r),
    ));

    var controllerrecape = Modular.get<BaseRecapeController>();
    await controllerrecape.getAllObras();
  }

  @action
  Future<void> approveObra() async {
    changeState(const LoadingUpdateState());
    obraUpdated = ObraAdapter.copyWith(obraUpdated,
        statusGeometria: StatusGeometriaEnum.APROVADO,
        isActive: ActiveEnum.ATIVO);
    final result = await _updateObraUsecase(obraUpdated);
    changeState(result.fold(
      (l) => ErrorUpdateState(l),
      (r) => SuccessUpdateState(r),
    ));
    await Modular.get<BaseRecapeController>().getAllObras();
  }
}
