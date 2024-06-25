import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:recape_sp_front/app/modules/base-recape/states/update_motoverificacao_state.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/unique_fiscalizacao_controller.dart';
import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/update_motoverificacao_usecase.dart';
import 'package:recape_sp_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:recape_sp_front/app/shared/themes/app_colors.dart';
import 'package:recape_sp_front/app/shared/themes/app_text_styles.dart';
import 'package:recape_sp_front/app/shared/widgets/drop_down_field.dart';
import 'package:recape_sp_front/app/shared/widgets/text_field_widget.dart';
import 'package:recape_sp_front/generated/l10n.dart';

class UniqueFiscalizacaoDialog extends StatefulWidget {
  final String obraId;
  final MotoverificacaoEntity motoverificacao;
  const UniqueFiscalizacaoDialog({
    super.key,
    required this.obraId,
    required this.motoverificacao,
  });

  @override
  State<UniqueFiscalizacaoDialog> createState() =>
      _UniqueFiscalizacaoDialogState();
}

class _UniqueFiscalizacaoDialogState extends State<UniqueFiscalizacaoDialog> {
  late UniqueFiscalizacaoController controller;
  final formKey = GlobalKey<FormState>();
  final _justificativaIntelicityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = UniqueFiscalizacaoController(
      Modular.get<IUpdateMotoverificacaoUsecase>(),
      obraId: widget.obraId,
      motoverificacao: widget.motoverificacao,
    );

    _justificativaIntelicityController.text =
        controller.motoverificacao.justificativaIntelicity ?? '';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edição Motoverificação: ${widget.obraId}',
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
                    child: DropDownFieldWidget<bool?>(
                      onChanged: controller.setMotoverificacaoConvias,
                      title: 'Motoverificação CONVIAS',
                      value: controller.motoverificacao.motoverificacaoConvias,
                      items: [
                        DropdownMenuItem<bool?>(
                          value: true,
                          child: Text(S.of(context).boolNameSchema('SIM')),
                        ),
                        DropdownMenuItem<bool?>(
                          value: false,
                          child: Text(S.of(context).boolNameSchema('NAO')),
                        ),
                        DropdownMenuItem<bool?>(
                          value: null,
                          child: Text(S.of(context).boolNameSchema('')),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Motoverificação Convias: ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                            widget.motoverificacao.dataMotoverificacaoConvias ==
                                        null ||
                                    widget.motoverificacao
                                            .dataMotoverificacaoConvias ==
                                        ''
                                ? '-'
                                : widget.motoverificacao
                                    .dataMotoverificacaoConvias!),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DropDownFieldWidget<bool?>(
                      onChanged: (value) {
                        controller.setMotoverificacaoIntelicity(value);
                        setState(() {
                          if (value == null || value) {
                            _justificativaIntelicityController.text = '';
                            controller.setJustificativaIntelicity('');
                          }
                        });
                      },
                      title: 'Motoverificação INTELICITY',
                      value:
                          controller.motoverificacao.motoverificacaoIntelicity,
                      items: [
                        DropdownMenuItem<bool?>(
                          value: true,
                          child: Text(S.of(context).boolNameSchema('SIM')),
                        ),
                        DropdownMenuItem<bool?>(
                          value: false,
                          child: Text(S.of(context).boolNameSchema('NAO')),
                        ),
                        DropdownMenuItem<bool?>(
                          value: null,
                          child: Text(S.of(context).boolNameSchema('')),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Observer(builder: (_) {
                    return Expanded(
                      child: TextFieldWidget(
                        title: 'Justificativa Intelicity',
                        validation: controller.validateJustificativaIntelicity,
                        controller: _justificativaIntelicityController,
                        isEnable: controller.motoverificacao
                                    .motoverificacaoIntelicity !=
                                null &&
                            !controller
                                .motoverificacao.motoverificacaoIntelicity!,
                        onChanged: controller.setJustificativaIntelicity,
                      ),
                    );
                  })
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
                        if (formKey.currentState!.validate()) {
                          await controller.updateMotoverificacao();
                          var state = controller.state;
                          if (state is SuccessUpdateMotoverificacaoState) {
                            Modular.to.pop();
                          } else if (state is ErrorUpdateMotoverificacaoState) {
                            html.window.alert(
                              'Erro ao atualizar a motoverificação: ${state.error.errorMessage}',
                            );
                          }
                        }
                      },
                      child:
                          controller.state is LoadingUpdateMotoverificacaoState
                              ? const CircularProgressIndicator()
                              : Text('SALVAR',
                                  style: AppTextStyles.headline3
                                      .copyWith(color: Colors.white)),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
