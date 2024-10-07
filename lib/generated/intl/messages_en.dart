// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(schema) => "${Intl.select(schema, {
            'ATIVO': 'Active',
            'INATIVO': 'Inactive',
            'other': '',
          })}";

  static String m1(schema) => "${Intl.select(schema, {
            'SIM': 'Yes',
            'NAO': 'No',
            'other': 'Uninformed',
          })}";

  static String m2(schema) => "${Intl.select(schema, {
            'CDHU': 'CDHU',
            'CONSEMAVI_2017_2020': 'CONSEMAVI 2017-2020',
            'CONSEMAVI_2021_2024': 'CONSEMAVI 2021-2024',
            'DECRETO_58756_2019_DEMAIS': 'DECRETO 58.756/2019 (DEMAIS)',
            'DECRETO_58756_2019_SABESP': 'DECRETO 58.756/2019 (SABESP)',
            'SABESP_2020': 'SABESP 2020',
            'SABESP_2022_2023': 'SABESP 2022-2023',
            'PARALELEPIPEDO': 'PARALELEPÍPEDO',
            'PAVIMENTACAO': 'PAVIMENTAÇÃO',
            'CALCADA': 'CALÇADA',
            'SPOBRAS': 'SP OBRAS',
            'other': 'Uninformed',
          })}";

  static String m3(schema) => "${Intl.select(schema, {
            'SMA': 'SMA',
            'CBUQ': 'CBUQ',
            'CONCRETO': 'CONCRETE',
            'INTERTRAVADO': 'INTERLOCKED',
            'other': 'Uninformed',
          })}";

  static String m4(schema) => "${Intl.select(schema, {
            'SUSPENSO': 'Suspended',
            'PLANEJADO': 'Planning',
            'A_CONTRATAR': 'To be hired',
            'A_CONTRATAR_CURTO_PRAZO': 'To be hired (Short Term)',
            'CONTRATADO': 'Hired',
            'EM_EXECUCAO': 'In Execution',
            'CONCLUIDO_RATIFICAR': 'Concluded - Ratificar',
            'CONCLUIDO': 'Concluded',
            'EXCLUIDO': 'Excluded',
            'other': 'Uninformed',
          })}";

  static String m5(schema) => "${Intl.select(schema, {
            'NOVO': 'New way: without geometry',
            'PRE_PROCESSADO': 'Preprocessed Geometry',
            'PROCESSADO': 'Processed Geometry',
            'APROVADO': 'Approved and Finalized Geometry',
            'EDITADO': 'Edited geometry: awaiting processing',
            'other': 'Não informado',
          })}";

  static String m6(schema) => "${Intl.select(schema, {
            'AD': 'AD - CIDADE ADEMAR',
            'AF': 'AF - ARICANDUVA/FORMOSA/CARRAO',
            'BT': 'BT - BUTANTA',
            'CL': 'CL - CAMPO LIMPO',
            'CS': 'CS - CAPELA DO SOCORRO',
            'CT': 'CT - CIDADE TIRADENTES',
            'CV': 'CV - CASA VERDE/CACHOEIRINHA',
            'EM': 'EM - ERMELINO MATARAZZO',
            'FO': 'FO - FREGUESIA/BRASILANDIA',
            'G': 'G - GUAIANASES',
            'IP': 'IP - IPIRANGA',
            'IQ': 'IQ - ITAQUERA',
            'IT': 'IT - ITAIM PAULISTA',
            'JA': 'JA - JABAQUARA',
            'JT': 'JT - JACANA/TREMEMBE',
            'LA': 'LA - LAPA',
            'MB': 'MB - M BOI MIRIM',
            'MG': 'MG - VILA MARIA/VILA GUILHERME',
            'MO': 'MO - MOOCA',
            'MP': 'MP - SAO MIGUEL PAULISTA',
            'PA': 'PA - PARELHEIROS',
            'PE': 'PE - PENHA',
            'PI': 'PI - PINHEIROS',
            'PJ': 'PJ - PIRITUBA/JARAGUA',
            'PR': 'PR - PERUS',
            'SA': 'SA - SANTO AMARO',
            'SB': 'SB - SAPOPEMBA',
            'SE': 'SE - SE',
            'SM': 'SM - SAO MATEUS',
            'ST': 'ST - SANTANA/TUCURUVI',
            'VM': 'VM - VILA MARIANA',
            'VP': 'VP - VILA PRUDENTE',
            'other': 'Não informado',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "activeNameSchema": m0,
        "boolNameSchema": m1,
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "fonteNameSchema": m2,
        "noDataFoundError":
            MessageLookupByLibrary.simpleMessage("No data found"),
        "noInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "revestimentoNameSchema": m3,
        "stateNameSchema": m4,
        "statusGeometriaNameSchema": m5,
        "subprefeituraNameSchema": m6,
        "textErrorHome": MessageLookupByLibrary.simpleMessage(
            "An error was found in the parameters, following parameters are required: "),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Unknown error, please try again")
      };
}
