import 'dart:convert';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recape_sp_front/app/shared/widgets/alert_dialog_custom.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../shared/domain/enums/fonte_enum.dart';
import '../../../../shared/domain/enums/geometry_status_enum.dart';
import '../../../../shared/domain/enums/revestimento_enum.dart';
import '../../../../shared/domain/enums/role_enum.dart';
import '../../../../shared/domain/enums/status_obra_enum.dart';
import '../../../../shared/domain/enums/subprefeitura_enum.dart';
import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/drop_down_field.dart';
import '../../../../shared/widgets/text_field_widget.dart';
import '../../controllers/update_obra_controller.dart';
import '../../states/update_obra_state.dart';

class UpdateObraDialog extends StatefulWidget {
  final ObraEntity obra;
  const UpdateObraDialog({super.key, required this.obra});

  @override
  State<UpdateObraDialog> createState() => _UpdateObraDialogState();
}

class _UpdateObraDialogState extends State<UpdateObraDialog> {
  final _dataTerminoController = TextEditingController();
  var userStore = Modular.get<UserStore>();
  late UpdateObraController controller;
  late bool isEnable;

  @override
  void initState() {
    super.initState();
    controller = UpdateObraController(
      Modular.get(),
      Modular.get(),
      widget.obra,
    );
    _dataTerminoController.text = widget.obra.dataTermino ?? '';
    isEnable = widget.obra.status == StatusObraEnum.CONCLUIDO;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: ScreenHelper.width(context) * 0.8,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Editar Recapeamento: ${widget.obra.id}',
                    style: AppTextStyles.headline1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DropDownFieldWidget<FonteEnum>(
                                    onChanged: controller.setFonte,
                                    title: 'Recurso',
                                    value: controller.obraUpdated.fonte,
                                    validation: controller.validateFonte,
                                    items: FonteEnum.values
                                        .toList()
                                        .map((FonteEnum value) {
                                      return DropdownMenuItem<FonteEnum>(
                                        value: value,
                                        child: Text(value.typeName),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: DropDownFieldWidget<StatusObraEnum>(
                                    onChanged: (value) {
                                      controller.setStatus(value);
                                      setState(() {
                                        isEnable =
                                            value == StatusObraEnum.CONCLUIDO;
                                        !isEnable
                                            ? _dataTerminoController.text = ''
                                            : null;
                                      });
                                    },
                                    validation: controller.validateStatus,
                                    title: 'Status',
                                    value: controller.obraUpdated.status,
                                    items: StatusObraEnum.values
                                        .toList()
                                        .map((StatusObraEnum value) {
                                      return DropdownMenuItem<StatusObraEnum>(
                                        value: value,
                                        child: Text(value.typeName),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Data Término',
                                    controller: _dataTerminoController,
                                    validation: controller.validateDataTermino,
                                    hintText: 'dd/mm/aaaa',
                                    isEnable: isEnable,
                                    inputFormatters: [
                                      MaskTextInputFormatter(mask: '##/##/####')
                                    ],
                                    onChanged: controller.setDataTermino,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Via',
                                    initialValue: controller.obraUpdated.via,
                                    validation: controller.validateVia,
                                    isEnable:
                                        !(controller.obra.statusGeometria !=
                                            StatusGeometriaEnum.APROVADO),
                                    hintText: 'Logradouro',
                                    onChanged: controller.setVia,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'De',
                                    initialValue: controller.obraUpdated.de,
                                    validation: controller.validateDe,
                                    isEnable:
                                        !(controller.obra.statusGeometria !=
                                            StatusGeometriaEnum.APROVADO),
                                    onChanged: controller.setDe,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Até',
                                    initialValue: controller.obraUpdated.ate,
                                    validation: controller.validateAte,
                                    isEnable:
                                        !(controller.obra.statusGeometria !=
                                            StatusGeometriaEnum.APROVADO),
                                    onChanged: controller.setAte,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Logradouro Geosampa',
                                    hintText:
                                        'Por extenso. Ex: Avenida São João',
                                    isEnable:
                                        !(controller.obra.statusGeometria !=
                                            StatusGeometriaEnum.APROVADO),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r"[a-zA-Z ]")),
                                    ],
                                    validation: controller.validateViaPadrao,
                                    initialValue:
                                        controller.obraUpdated.viaPadrao,
                                    onChanged: controller.setViaPadrao,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Complemento',
                                    isEnable:
                                        !(controller.obra.statusGeometria !=
                                            StatusGeometriaEnum.APROVADO),
                                    hintText: 'Ex: Trecho II',
                                    initialValue:
                                        controller.obraUpdated.viaComplemento,
                                    onChanged: controller.setViaComplemento,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropDownFieldWidget<SubprefeituraEnum>(
                                    onChanged: controller.setSubprefeitura,
                                    title: 'Subprefeitura',
                                    value: controller.obraUpdated.subprefeitura,
                                    validation:
                                        controller.validateSubprefeitura,
                                    items: SubprefeituraEnum.values
                                        .toList()
                                        .map((SubprefeituraEnum value) {
                                      return DropdownMenuItem<
                                          SubprefeituraEnum>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Extensão (m)',
                                    initialValue:
                                        controller.obraUpdated.extensao,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9,]")),
                                    ],
                                    onChanged: controller.setExtensao,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Área (m²)',
                                    initialValue: controller.obraUpdated.area,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9,]")),
                                    ],
                                    onChanged: controller.setArea,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: DropDownFieldWidget<RevestimentoEnum>(
                                    onChanged: controller.setRevestimento,
                                    value: controller.obraUpdated.revestimento,
                                    title: 'Revestimento',
                                    items: RevestimentoEnum.values
                                        .toList()
                                        .map((RevestimentoEnum value) {
                                      return DropdownMenuItem<RevestimentoEnum>(
                                        value: value,
                                        child: Text(value.typeName),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            Observer(builder: (_) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      title: 'Comentários',
                                      initialValue:
                                          controller.obraUpdated.comentarios,
                                      onChanged: controller.setComentarios,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Observer(builder: (context) {
                          return pickFile(
                            context: context,
                            isChanged: controller.obra.image !=
                                controller.obraUpdated.image,
                            url: controller.obraUpdated.image,
                            onTap: (controller.obra.statusGeometria !=
                                    StatusGeometriaEnum.APROVADO)
                                ? null
                                : () async {
                                    final picker = ImagePicker();
                                    final pickedImage = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );

                                    if (pickedImage != null) {
                                      controller.setImage(pickedImage);
                                    }
                                  },
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Modular.to.pop();
                        },
                        child: Text('FECHAR',
                            style: AppTextStyles.headline3
                                .copyWith(color: Colors.white)),
                      ),
                      const SizedBox(width: 16),
                      Observer(builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () async {
                            if (!controller.validateAddressChange()) {
                              html.window.confirm(
                                  'Houve uma troca de endereçamento de recapamento, o upload de uma nova imagem é necessária.');
                            } else if (formKey.currentState!.validate()) {
                              await controller.updateObra();
                              var state = controller.state;
                              if (state is SuccessUpdateState) {
                                Modular.to.pop();
                              } else if (state is ErrorUpdateState) {
                                html.window.alert(
                                  'Erro ao atualizar a obra: ${state.error.errorMessage}',
                                );
                              }
                            }
                          },
                          child: controller.state is LoadingUpdateState
                              ? const CircularProgressIndicator()
                              : Text('SALVAR',
                                  style: AppTextStyles.headline3
                                      .copyWith(color: Colors.white)),
                        );
                      }),
                      const SizedBox(width: 16),
                      userStore.user!.role == RoleEnum.ADMIN &&
                              controller.obra.statusGeometria ==
                                  StatusGeometriaEnum.PROCESSADO
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialogCustom(
                                    title:
                                        'Tem certeza que deseja aprovar esta obra?',
                                    onPressed: () async {
                                      await controller.approveObra();
                                      Modular.to
                                          .popUntil(ModalRoute.withName('/'));
                                    },
                                  ),
                                );
                              },
                              child: Text('APROVAR',
                                  style: AppTextStyles.headline3
                                      .copyWith(color: Colors.white)),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pickFile({
    required BuildContext context,
    required bool isChanged,
    required String url,
    Function()? onTap,
  }) {
    var size = ScreenHelper.width(context) * 0.23;
    return MouseRegion(
      cursor: onTap == null ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: isChanged
                ? Image.memory(
                    base64Decode(url),
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    url,
                  ),
          ),
        ),
      ),
    );
  }
}
