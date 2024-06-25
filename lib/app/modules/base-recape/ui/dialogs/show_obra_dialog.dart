import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/geometry_status_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/revestimento_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/status_obra_enum.dart';
import 'package:latlong2/latlong.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../shared/domain/enums/active_enum.dart';
import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import 'package:http/http.dart' as http;

class ShowObraDialog extends StatelessWidget {
  final ObraEntity obra;
  const ShowObraDialog({super.key, required this.obra});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: ScreenHelper.width(context) * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Recapeamento: ${obra.id}',
                  style: AppTextStyles.headline1,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              createData(
                                  label: 'Recurso',
                                  value: obra.fonte?.typeName),
                              createData(
                                  label: 'Status',
                                  value: obra.status?.typeName),
                              createData(
                                label: 'Data Término',
                                value: obra.dataTermino,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createData(label: 'Via', value: obra.via),
                                createData(label: 'De', value: obra.de),
                                createData(label: 'Até', value: obra.ate),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              createData(
                                  label: 'Subprefeitura',
                                  value: obra.subprefeitura?.name),
                              createData(
                                  label: 'Extensão (m)', value: obra.extensao),
                              createData(label: 'Área (m²)', value: obra.area),
                              createData(
                                  label: 'Revestimento',
                                  value: obra.revestimento?.typeName),
                              createData(
                                  label: 'Status Geometria',
                                  value: obra.statusGeometria.typeName),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              createData(
                                  label: 'Logradouro Geosampa',
                                  value: obra.viaPadrao),
                              createData(
                                  label: 'Complemento',
                                  value: obra.viaComplemento),
                              createData(
                                  label: 'Ativo',
                                  value: obra.isActive?.typeName),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: createData(
                                label: 'Comentários',
                                value: obra.comentarios,
                                isExpanded: false),
                          ),
                          createHistoric(
                              label: 'Atualizações', value: obra.atualizacoes),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.width(context) * 0.3,
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: (obra.statusGeometria ==
                                    StatusGeometriaEnum.PROCESSADO ||
                                obra.statusGeometria ==
                                    StatusGeometriaEnum.APROVADO)
                            ? createMap(json: obra.geometria!)
                            : Image.network(
                                obra.image,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Center(child: fileDownload(obra.image)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createMap({required Map<String, dynamic> json}) {
    var firstPoint = json['coordinates'][0][0];

    double long = firstPoint[0];
    double lat = firstPoint[1];

    GeoJsonParser geoJsonParser = GeoJsonParser(
        defaultPolylineColor: Colors.red, defaultPolylineStroke: 3);

    String geoJsonString = '''
    {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": ${jsonEncode(json)},
          "properties": {
            "section": "Multipoint M-10"
          }
        } 
      ]
    }
    ''';

    geoJsonParser.parseGeoJsonAsString(geoJsonString);
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCenter: LatLng(lat, long),
        initialZoom: 17,
      ),
      children: [
        TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c']),
        PolylineLayer(
          polylines: geoJsonParser.polylines,
        ),
      ],
    );
  }

  Widget createData(
          {required String label, required String? value, isExpanded = true}) =>
      isExpanded
          ? Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(value == null || value == '' ? '-' : value),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(value == null || value == '' ? '-' : value),
              ],
            );

  Widget createHistoric({required String label, required List<String> value}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          value.isEmpty
              ? const Text('-')
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) => Text(value[index]),
                  ),
                ),
        ],
      );

  Widget fileDownload(String url) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          final response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
            final bytes = response.bodyBytes;

            final blob = html.Blob([bytes]);

            final blobUrl = html.Url.createObjectUrlFromBlob(blob);

            final anchor = html.AnchorElement(href: blobUrl)
              ..setAttribute("download", "image-recape.png")
              ..style.display = 'none';
            html.document.body?.append(anchor);
            anchor.click();
            anchor.remove();

            html.Url.revokeObjectUrl(blobUrl);
          } else {
            html.window.alert(
              'Erro ao fazer download do arquivo, tente novamente',
            );
          }
        },
        child: Text('Download Croqui',
            style: AppTextStyles.headline3.copyWith(color: Colors.white)),
      );
}
