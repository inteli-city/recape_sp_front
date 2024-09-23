import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/base_recape_controller.dart';
import 'package:recape_sp_front/app/modules/base-recape/ui/dialogs/multiple_fiscalizacao_convias_dialog.dart';
import 'package:recape_sp_front/app/modules/base-recape/ui/dialogs/unique_fiscalizacao_dialog.dart';
import 'package:recape_sp_front/app/modules/base-recape/ui/widgets/filter_widget.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/status_obra_enum.dart';
import 'package:recape_sp_front/app/shared/helpers/functions/show_snack_bar_function.dart';
import 'package:recape_sp_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:recape_sp_front/app/shared/themes/app_colors.dart';
import 'package:recape_sp_front/app/shared/themes/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../shared/domain/enums/geometry_status_enum.dart';
import '../../../shared/domain/enums/role_enum.dart';
import '../states/base_recape_state.dart';
import 'dialogs/create_obra_dialog.dart';
import 'dialogs/show_obra_dialog.dart';
import 'dialogs/update_obra_dialog.dart';

class BaseRecapePage extends StatefulWidget {
  const BaseRecapePage({super.key});

  @override
  State<BaseRecapePage> createState() => _BaseRecapePageState();
}

class _BaseRecapePageState extends State<BaseRecapePage> {
  var controller = Modular.get<BaseRecapeController>();
  var userStore = Modular.get<UserStore>();
  final int _rowsPerPage = 30;
  final double _dataPagerHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Base de Recapeamentos',
                    style: AppTextStyles.headline1.copyWith(fontSize: 36),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () async {
                      await controller.getAllObras();
                    },
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  userStore.user!.role == RoleEnum.CONVIAS_VIEW ||
                          userStore.user!.role == RoleEnum.FISCALIZACAO
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => const CreateObraDialog(),
                            );
                          },
                          child: Text(
                            'ADICIONAR',
                            style: AppTextStyles.headline3
                                .copyWith(color: Colors.white),
                          ),
                        ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () async {
                      await controller.createAndExportXlsFile();
                    },
                    child: Text(
                      'EXPORTAR XLS',
                      style:
                          AppTextStyles.headline3.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.black26,
                ),
              ),
              const FilterWidget(),
              Center(
                child: Observer(builder: (_) {
                  var state = controller.state;
                  final DataGridController dataGridController =
                      DataGridController();
                  return state is BaseRecapeLoadedSuccessState
                      ? LayoutBuilder(builder: (context, constraints) {
                          var obraTableDataSource = ObraDataSourceTable(
                              obras: state.listObras, context: context);
                          return Column(
                            children: [
                              userStore.user!.role != RoleEnum.FISCALIZACAO
                                  ? const SizedBox.shrink()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBlue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () async {
                                            dataGridController
                                                    .selectedRows.isEmpty
                                                ? showCustomSnackBar(context,
                                                    'Selecione ao menos uma obra para realizar a motoverificação.')
                                                : showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        MultipleFiscalizacaoConviasDialog(
                                                      listIDs:
                                                          dataGridController
                                                              .selectedRows
                                                              .map((e) => e
                                                                  .getCells()[0]
                                                                  .value
                                                                  .toString())
                                                              .toList(),
                                                    ),
                                                  );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.motorcycle,
                                                  color: Colors.white),
                                              const SizedBox(width: 8),
                                              Text('MOTOVERIFICAÇÃO CONVIAS',
                                                  style: AppTextStyles.headline3
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBlue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () async {
                                            dataGridController
                                                    .selectedRows.isEmpty
                                                ? showCustomSnackBar(context,
                                                    'Selecione ao menos uma obra para realizar a motoverificação.')
                                                : showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        MultipleFiscalizacaoConviasDialog(
                                                      listIDs:
                                                          dataGridController
                                                              .selectedRows
                                                              .map((e) => e
                                                                  .getCells()[0]
                                                                  .value
                                                                  .toString())
                                                              .toList(),
                                                      isConvias: false,
                                                    ),
                                                  );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.motorcycle,
                                                  color: Colors.white),
                                              const SizedBox(width: 8),
                                              Text('MOTOVERIFICAÇÃO INTELICITY',
                                                  style: AppTextStyles.headline3
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: ScreenHelper.height(context) * 0.8,
                                child: SfDataGrid(
                                  isScrollbarAlwaysShown: true,
                                  controller: dataGridController,
                                  allowSorting: true,
                                  allowMultiColumnSorting: true,
                                  columnWidthMode: ColumnWidthMode.fill,
                                  rowHeight: 80,
                                  selectionMode: SelectionMode.multiple,
                                  source: obraTableDataSource,
                                  columns: [
                                    _getColumn('id', 'ID'),
                                    _getColumn('fonte', 'Fonte'),
                                    _getColumn('status', 'Status'),
                                    _getColumn('via', 'Via'),
                                    _getColumn('de', 'De'),
                                    _getColumn('ate', 'Até'),
                                    _getColumn(
                                        'subprefeitura', 'Subprefeitura'),
                                    _getColumn('dataTermino', 'Data Término'),
                                    _getColumn(
                                        'statusGeometria', 'Status Geometria'),
                                    _getColumn('edit', null),
                                  ],
                                ),
                              ),
                              state.listObras.length <= _rowsPerPage
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      height: _dataPagerHeight,
                                      child: SfDataPagerTheme(
                                        data: SfDataPagerThemeData(
                                          selectedItemColor:
                                              AppColors.primaryBlue,
                                          backgroundColor: Colors.white,
                                        ),
                                        child: SfDataPager(
                                          delegate: obraTableDataSource,
                                          pageCount: state.listObras.length /
                                              _rowsPerPage,
                                          direction: Axis.horizontal,
                                        ),
                                      ))
                            ],
                          );
                        })
                      : state is BaseRecapeErrorState
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Erro ao carregar dados: ${state.error.errorMessage}')
                              ],
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryBlue,
                            ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  GridColumn _getColumn(String columnName, String? label) {
    return GridColumn(
      maximumWidth: ScreenHelper.width(context) * 0.14,
      columnName: columnName,
      label: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: label == null
            ? null
            : Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.headline3,
              ),
      ),
    );
  }
}

class ObraDataSourceTable extends DataGridSource {
  ObraDataSourceTable(
      {required List<ObraEntity> obras, required BuildContext context}) {
    _obras = obras.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<int>(
          columnName: 'id',
          value: int.parse(e.id!),
        ),
        DataGridCell<String>(columnName: 'fonte', value: e.fonte!.typeName),
        DataGridCell<String>(columnName: 'status', value: e.status!.typeName),
        DataGridCell<String>(columnName: 'via', value: e.via),
        DataGridCell<String>(columnName: 'de', value: e.de),
        DataGridCell<String>(columnName: 'ate', value: e.ate),
        DataGridCell<String>(
            columnName: 'subprefeitura', value: e.subprefeitura!.name),
        DataGridCell<DateTime?>(
            columnName: 'dataTermino',
            value: e.dataTermino == null
                ? null
                : DateFormat("dd/MM/yyyy").parse(e.dataTermino!)),
        DataGridCell<String>(
            columnName: 'statusGeometria', value: e.statusGeometria.typeName),
        DataGridCell<ObraEntity>(
          columnName: 'edit',
          value: e,
        ),
      ]);
    }).toList();
  }

  List<DataGridRow> _obras = [];

  @override
  List<DataGridRow> get rows => _obras.isEmpty ? [] : _obras;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'dataTermino'
            ? Text(dataGridCell.value == null
                ? ''
                : DateFormat("dd/MM/yyyy").format(dataGridCell.value!))
            : dataGridCell.columnName == 'edit'
                ? LayoutBuilder(builder: (context, BoxConstraints constraints) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: AppColors.primaryBlue,
                              size: 24,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => ShowObraDialog(
                                  obra: dataGridCell.value,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Modular.get<UserStore>().user!.role ==
                                  RoleEnum.CONVIAS_VIEW
                              ? const SizedBox.shrink()
                              : Modular.get<UserStore>().user!.role ==
                                      RoleEnum.FISCALIZACAO
                                  ? IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) =>
                                              UniqueFiscalizacaoDialog(
                                            obraId: dataGridCell.value.id!,
                                            motoverificacao: dataGridCell
                                                .value.motoverificacao,
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.motorcycle,
                                        color: AppColors.primaryBlue,
                                        size: 24,
                                      ))
                                  : IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) =>
                                              UpdateObraDialog(
                                            obra: dataGridCell.value,
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: AppColors.primaryBlue,
                                        size: 24,
                                      ))
                        ]);
                  })
                : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
