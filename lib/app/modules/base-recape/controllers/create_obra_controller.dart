import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/base_recape_controller.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/domain/enums/fonte_enum.dart';
import '../../../shared/domain/enums/revestimento_enum.dart';
import '../../../shared/domain/enums/status_obra_enum.dart';
import '../../../shared/domain/enums/subprefeitura_enum.dart';
import '../../../shared/domain/usecases/create_obra_usecase.dart';
import '../../../shared/helpers/utils/validation_field_helper.dart';
import '../states/create_obra_state.dart';

part 'create_obra_controller.g.dart';

class CreateObraController = CreateObraControllerBase
    with _$CreateObraController;

abstract class CreateObraControllerBase with Store {
  final ICreateObraUsecase _createObraUsecase;

  CreateObraControllerBase(this._createObraUsecase);

  @observable
  CreateObraState state = const StartCreateState();

  @action
  void changeState(CreateObraState value) => state = value;

  @observable
  FonteEnum? fonte;

  @action
  void setFonte(FonteEnum? value) => fonte = value;

  @action
  String? validateFonte(FonteEnum? value) {
    return ValidationFieldHelper.validateFonte(value);
  }

  @observable
  StatusObraEnum? status;

  @action
  void setStatus(StatusObraEnum? value) {
    status = value;
    if (value != StatusObraEnum.CONCLUIDO) {
      setDataTermino(null);
    }
  }

  @action
  String? validateStatus(StatusObraEnum? value) {
    return ValidationFieldHelper.validateStatus(value);
  }

  @observable
  String via = '';

  @action
  void setVia(String value) => via = value;

  @action
  String? validateVia(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @observable
  String de = '';

  @action
  void setDe(String value) => de = value;

  @action
  String? validateDe(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @observable
  String ate = '';

  @action
  void setAte(String value) => ate = value;

  @action
  String? validateAte(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @observable
  String viaPadrao = '';

  @action
  void setViaPadrao(String value) => viaPadrao = value;

  @action
  String? validateViaPadrao(String? value) {
    return ValidationFieldHelper.validateFieldRequired(value);
  }

  @observable
  String viaComplemento = '';

  @action
  void setViaComplemento(String value) => viaComplemento = value;

  @observable
  SubprefeituraEnum? subprefeitura;

  @action
  void setSubprefeitura(SubprefeituraEnum? value) => subprefeitura = value;

  @action
  String? validateSubprefeitura(SubprefeituraEnum? value) {
    return ValidationFieldHelper.validateSubprefeitura(value);
  }

  @observable
  String extensao = '';

  @action
  void setExtensao(String value) => extensao = value;

  @observable
  String? dataTermino;

  @action
  void setDataTermino(String? value) {
    dataTermino = value;
  }

  @action
  String? validateDataTermino(String? value) {
    if (status == StatusObraEnum.CONCLUIDO) {
      return ValidationFieldHelper.validateDataTermino(value);
    }
    return null;
  }

  @observable
  String area = '';

  @action
  void setArea(String value) => area = value;

  @observable
  RevestimentoEnum revestimento = RevestimentoEnum.NONE;

  @action
  void setRevestimento(RevestimentoEnum? value) =>
      revestimento = value ?? RevestimentoEnum.NONE;

  @observable
  String comentarios = '';

  @action
  void setComentarios(String value) => comentarios = value;

  @observable
  XFile? imageFile;

  @observable
  String imageBase64 = '';

  @action
  Future<void> setFile(XFile file) async {
    imageFile = file;
    imageBase64 = base64Encode(await file.readAsBytes());
  }

  @action
  bool validateFile() {
    return imageBase64.isNotEmpty && imageFile != null;
  }

  @action
  Future<void> createObra() async {
    changeState(const LoadingCreateState());
    final result = await _createObraUsecase(
      fonte!,
      status!,
      via,
      de,
      ate,
      viaPadrao,
      viaComplemento,
      extensao,
      area,
      dataTermino,
      subprefeitura!,
      revestimento,
      comentarios,
      imageBase64,
    );
    changeState(result.fold((l) => ErrorCreateState(l), (obra) {
      return SuccessCreateState(obra);
    }));

    await Modular.get<BaseRecapeController>().getAllObras();
  }
}
