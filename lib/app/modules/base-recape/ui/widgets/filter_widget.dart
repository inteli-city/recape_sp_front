import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/base_recape_controller.dart';
import 'package:recape_sp_front/app/modules/base-recape/ui/widgets/filter_text_field_widget.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/geometry_status_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/role_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/status_obra_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/subprefeitura_enum.dart';
import 'package:recape_sp_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:recape_sp_front/app/shared/themes/app_colors.dart';
import 'package:recape_sp_front/app/shared/themes/app_text_styles.dart';
import 'package:recape_sp_front/app/shared/widgets/filter_drop_down_widget.dart';
import 'package:intl/intl.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  var controller = Modular.get<BaseRecapeController>();

  FonteEnum? fonte;
  DateTimeRange? dataTermino;
  DateTimeRange? dataConvias;
  SubprefeituraEnum? subprefeitura;
  StatusObraEnum? status;
  StatusGeometriaEnum? statusGeometria;
  bool? motoverficacaoConvias;
  bool? motoverficacaoIntelicity;

  var idController = TextEditingController();
  var viaController = TextEditingController();
  var logradouroGeosampaController = TextEditingController();
  final GlobalKey<FormFieldState> fonteKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> subprefeituraKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> statusKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> statusGeometriaKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> motoverficacaoConviasKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> motoverficacaoIntelicityKey =
      GlobalKey<FormFieldState>();

  void clearTextFields() {
    fonte = null;
    dataTermino = null;
    dataConvias = null;
    subprefeitura = null;
    status = null;
    statusGeometria = null;
    motoverficacaoConvias = null;
    motoverficacaoIntelicity = null;
    viaController.clear();
    idController.clear();
    logradouroGeosampaController.clear();
    subprefeituraKey.currentState?.reset();
    fonteKey.currentState?.reset();
    statusKey.currentState?.reset();
    statusGeometriaKey.currentState?.reset();
    motoverficacaoConviasKey.currentState?.reset();
    motoverficacaoIntelicityKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filtros', style: AppTextStyles.headline1),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: FilterTextFieldWidget(
                    title: 'Via',
                    controller: viaController,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilterDropDownWidget<SubprefeituraEnum>(
                    dropDownKey: subprefeituraKey,
                    items: SubprefeituraEnum.values
                        .toList()
                        .map((SubprefeituraEnum value) {
                      return DropdownMenuItem<SubprefeituraEnum>(
                        value: value,
                        child: Text(value.typeName),
                      );
                    }).toList(),
                    title: 'Subprefeitura',
                    onChanged: (value) {
                      subprefeitura = value;
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilterTextFieldWidget(
                    title: 'Logradouro Geosampa',
                    controller: logradouroGeosampaController,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      DateTimeRange? pickedDateRange =
                          await showDateRangePicker(
                        context: context,
                        builder: (context, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 600.0,
                                  maxHeight: ScreenHelper.height(context) / 2,
                                ),
                                child: child,
                              )
                            ],
                          );
                        },
                        firstDate: DateTime(2015),
                        currentDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDateRange != null) {
                        setState(() {
                          dataTermino = pickedDateRange;
                        });
                      }
                    },
                    child: Text(
                      dataTermino == null
                          ? 'Data Término'
                          : 'Data Término: ${DateFormat('dd/MM/yyyy').format(dataTermino!.start)} - ${DateFormat('dd/MM/yyyy').format(dataTermino!.end)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenHelper.width(context) <
                                ScreenHelper.breakpointTablet
                            ? 14
                            : 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilterDropDownWidget(
                    dropDownKey: fonteKey,
                    items: FonteEnum.values.toList().map((FonteEnum value) {
                      return DropdownMenuItem<FonteEnum>(
                        value: value,
                        child: Text(value.typeName),
                      );
                    }).toList(),
                    title: 'Recurso',
                    onChanged: (value) {
                      fonte = value;
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilterDropDownWidget<StatusObraEnum>(
                    dropDownKey: statusKey,
                    items: StatusObraEnum.values
                        .toList()
                        .map((StatusObraEnum value) {
                      return DropdownMenuItem<StatusObraEnum>(
                        value: value,
                        child: Text(value.typeName),
                      );
                    }).toList(),
                    title: 'Status',
                    onChanged: (value) {
                      status = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Modular.get<UserStore>().user!.role == RoleEnum.ADMIN ||
                    Modular.get<UserStore>().user!.role == RoleEnum.FISCALIZACAO
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilterTextFieldWidget(
                            title: 'Id',
                            controller: idController,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: FilterDropDownWidget<StatusGeometriaEnum>(
                            dropDownKey: statusGeometriaKey,
                            items: StatusGeometriaEnum.values
                                .toList()
                                .map((StatusGeometriaEnum value) {
                              return DropdownMenuItem<StatusGeometriaEnum>(
                                value: value,
                                child: Text(value.typeName),
                              );
                            }).toList(),
                            title: 'Status Geometria',
                            onChanged: (value) {
                              statusGeometria = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Modular.get<UserStore>().user!.role == RoleEnum.FISCALIZACAO
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              DateTimeRange? pickedDateRange =
                                  await showDateRangePicker(
                                context: context,
                                builder: (context, child) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 600.0,
                                          maxHeight:
                                              ScreenHelper.height(context) / 2,
                                        ),
                                        child: child,
                                      )
                                    ],
                                  );
                                },
                                firstDate: DateTime(2015),
                                currentDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );

                              if (pickedDateRange != null) {
                                setState(() {
                                  dataConvias = pickedDateRange;
                                });
                              }
                            },
                            child: Text(
                              dataConvias == null
                                  ? 'Data Convias'
                                  : 'Data Convias: ${DateFormat('dd/MM/yyyy').format(dataConvias!.start)} - ${DateFormat('dd/MM/yyyy').format(dataConvias!.end)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenHelper.width(context) <
                                        ScreenHelper.breakpointTablet
                                    ? 14
                                    : 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: FilterDropDownWidget<bool?>(
                            dropDownKey: motoverficacaoConviasKey,
                            items: const [
                              DropdownMenuItem<bool>(
                                value: true,
                                child: Text('Sim'),
                              ),
                              DropdownMenuItem<bool>(
                                value: false,
                                child: Text('Não'),
                              ),
                            ],
                            title: 'Motoverificação CONVIAS',
                            onChanged: (value) {
                              motoverficacaoConvias = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: FilterDropDownWidget<bool?>(
                            dropDownKey: motoverficacaoIntelicityKey,
                            items: const [
                              DropdownMenuItem<bool>(
                                value: true,
                                child: Text('Sim'),
                              ),
                              DropdownMenuItem<bool>(
                                value: false,
                                child: Text('Não'),
                              ),
                            ],
                            title: 'Motoverificação INTELICITY',
                            onChanged: (value) {
                              motoverficacaoIntelicity = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () async {
                    controller.filter(
                        filterVia: viaController.text,
                        filterSubprefeitura: subprefeitura,
                        filterDataTermino: dataTermino,
                        filterFonte: fonte,
                        filterStatusObra: status,
                        filterId: idController.text,
                        filterStatusGeometria: statusGeometria,
                        filterLogradouro: logradouroGeosampaController.text,
                        filterMotoverficacaoConvias: motoverficacaoConvias,
                        filterMotoverficacaoIntelicity:
                            motoverficacaoIntelicity,
                        filterDataConvias: dataConvias);
                  },
                  child: Text('FILTRAR',
                      style: AppTextStyles.headline3
                          .copyWith(color: Colors.white)),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () async {
                    setState(() {
                      clearTextFields();
                      controller.clear();
                    });
                  },
                  child: Text('LIMPAR',
                      style: AppTextStyles.headline3
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
