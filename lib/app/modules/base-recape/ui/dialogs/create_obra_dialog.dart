import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/revestimento_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/status_obra_enum.dart';
import 'package:recape_sp_front/app/shared/themes/app_text_styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../shared/domain/enums/subprefeitura_enum.dart';
import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/drop_down_field.dart';
import '../../../../shared/widgets/text_field_widget.dart';
import '../../controllers/create_obra_controller.dart';
import '../../states/create_obra_state.dart';

class CreateObraDialog extends StatefulWidget {
  const CreateObraDialog({super.key});

  @override
  State<CreateObraDialog> createState() => _CreateObraDialogState();
}

class _CreateObraDialogState extends State<CreateObraDialog> {
  var controller = Modular.get<CreateObraController>();
  final formKey = GlobalKey<FormState>();
  final _dataTerminoController = TextEditingController();
  late bool isEnable;

  @override
  void initState() {
    super.initState();
    _dataTerminoController.text = controller.dataTermino ?? '';
    isEnable = controller.status == StatusObraEnum.CONCLUIDO;
  }

  @override
  Widget build(BuildContext context) {
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
                    'Adicionar Recapeamento',
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
                                    validation: controller.validateFonte,
                                    title: 'Recurso',
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
                                        value != StatusObraEnum.CONCLUIDO
                                            ? _dataTerminoController.text = ''
                                            : null;
                                      });
                                    },
                                    validation: controller.validateStatus,
                                    title: 'Status',
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
                                  child: Observer(builder: (_) {
                                    return TextFieldWidget(
                                      title: 'Data Término',
                                      validation:
                                          controller.validateDataTermino,
                                      controller: _dataTerminoController,
                                      hintText: 'dd/mm/aaaa',
                                      isEnable: controller.status ==
                                          StatusObraEnum.CONCLUIDO,
                                      inputFormatters: [
                                        MaskTextInputFormatter(
                                            mask: '##/##/####')
                                      ],
                                      onChanged: controller.setDataTermino,
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Via',
                                    validation: controller.validateVia,
                                    hintText: 'Logradouro',
                                    onChanged: controller.setVia,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'De',
                                    validation: controller.validateDe,
                                    onChanged: controller.setDe,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Até',
                                    validation: controller.validateAte,
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
                                    validation: controller.validateViaPadrao,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r"[a-zA-Z ]")),
                                    ],
                                    initialValue: controller.viaPadrao,
                                    onChanged: controller.setViaPadrao,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFieldWidget(
                                    title: 'Complemento',
                                    hintText: 'Ex: Trecho II',
                                    initialValue: controller.viaComplemento,
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
                            TextFieldWidget(
                              title: 'Comentários',
                              onChanged: controller.setComentarios,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Observer(builder: (context) {
                          return pickFile(context, controller.imageFile,
                              () async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (pickedImage != null) {
                              controller.setFile(pickedImage);
                            }
                          });
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                            if (!controller.validateFile()) {
                              formKey.currentState!.validate();
                              html.window.confirm('Uma imagem é obrigatória!');
                            } else if (formKey.currentState!.validate()) {
                              await controller.createObra();
                              var state = controller.state;
                              if (state is SuccessCreateState) {
                                Modular.to.pop();
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Sucesso'),
                                        content: const Text(
                                            'Obra criada com sucesso!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Modular.to.pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    });
                              } else if (state is ErrorCreateState) {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Erro'),
                                        content: Text(state.error.errorMessage),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Modular.to.pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: controller.state is LoadingCreateState
                              ? const CircularProgressIndicator()
                              : Text('SALVAR',
                                  style: AppTextStyles.headline3
                                      .copyWith(color: Colors.white)),
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pickFile(BuildContext context, XFile? imageFile, Function()? onTap) {
    var size = ScreenHelper.width(context) * 0.23;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (imageFile != null)
                Image.network(
                  imageFile.path,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              else
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle, size: 40, color: Colors.grey),
                    SizedBox(height: 4),
                    Text('Adicionar imagem',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
