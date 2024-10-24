// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{schema, select, SUSPENSO{Suspended} PLANEJADO{Planning} A_CONTRATAR{To be hired} A_CONTRATAR_CURTO_PRAZO{To be hired (Short Term)} CONTRATADO{Hired} EM_EXECUCAO{In Execution} CONCLUIDO_RATIFICAR{Concluded - Ratificar} CONCLUIDO{Concluded} EXCLUIDO{Excluded} other{Uninformed}}`
  String stateNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
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
      },
      name: 'stateNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, CDHU{CDHU} CONSEMAVI_2017_2020{CONSEMAVI 2017-2020} CONSEMAVI_2021_2024{CONSEMAVI 2021-2024} DECRETO_58756_2019_DEMAIS{DECRETO 58.756/2019 (DEMAIS)} DECRETO_58756_2019_SABESP{DECRETO 58.756/2019 (SABESP)} SABESP_2020{SABESP 2020} SABESP_2022_2023{SABESP 2022-2023} PARALELEPIPEDO{PARALELEPÍPEDO} PAVIMENTACAO{PAVIMENTAÇÃO} CALCADA{CALÇADA} SPOBRAS{SP OBRAS} other{Uninformed}}`
  String fonteNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
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
      },
      name: 'fonteNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, SMA{SMA} CBUQ{CBUQ} CONCRETO{CONCRETE} INTERTRAVADO{INTERLOCKED} other{Uninformed}}`
  String revestimentoNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'SMA': 'SMA',
        'CBUQ': 'CBUQ',
        'CONCRETO': 'CONCRETE',
        'INTERTRAVADO': 'INTERLOCKED',
        'other': 'Uninformed',
      },
      name: 'revestimentoNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, NOVO{New way: without geometry} PRE_PROCESSADO{Preprocessed Geometry} PROCESSADO{Processed Geometry} APROVADO{Approved and Finalized Geometry} EDITADO{Edited geometry: awaiting processing} other{Não informado}}`
  String statusGeometriaNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'NOVO': 'New way: without geometry',
        'PRE_PROCESSADO': 'Preprocessed Geometry',
        'PROCESSADO': 'Processed Geometry',
        'APROVADO': 'Approved and Finalized Geometry',
        'EDITADO': 'Edited geometry: awaiting processing',
        'other': 'Não informado',
      },
      name: 'statusGeometriaNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, ATIVO{Active} INATIVO{Inactive} other{}}`
  String activeNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'ATIVO': 'Active',
        'INATIVO': 'Inactive',
        'other': '',
      },
      name: 'activeNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, SIM{Yes} NAO{No} other{Uninformed}}`
  String boolNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'SIM': 'Yes',
        'NAO': 'No',
        'other': 'Uninformed',
      },
      name: 'boolNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, AD{AD - CIDADE ADEMAR} AF{AF - ARICANDUVA/FORMOSA/CARRAO} BT{BT - BUTANTA} CL{CL - CAMPO LIMPO} CS{CS - CAPELA DO SOCORRO} CT{CT - CIDADE TIRADENTES} CV{CV - CASA VERDE/CACHOEIRINHA} EM{EM - ERMELINO MATARAZZO} FB{FB - FREGUESIA/BRASILANDIA} G{G - GUAIANASES} IP{IP - IPIRANGA} IQ{IQ - ITAQUERA} IT{IT - ITAIM PAULISTA} JA{JA - JABAQUARA} JT{JT - JACANA/TREMEMBE} LA{LA - LAPA} MB{MB - M BOI MIRIM} MG{MG - VILA MARIA/VILA GUILHERME} MO{MO - MOOCA} MP{MP - SAO MIGUEL PAULISTA} PA{PA - PARELHEIROS} PE{PE - PENHA} PI{PI - PINHEIROS} PJ{PJ - PIRITUBA/JARAGUA} PR{PR - PERUS} SA{SA - SANTO AMARO} SB{SB - SAPOPEMBA} SE{SE - SE} SM{SM - SAO MATEUS} ST{ST - SANTANA/TUCURUVI} VM{VM - VILA MARIANA} VP{VP - VILA PRUDENTE} other{Não informado}}`
  String subprefeituraNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'AD': 'AD - CIDADE ADEMAR',
        'AF': 'AF - ARICANDUVA/FORMOSA/CARRAO',
        'BT': 'BT - BUTANTA',
        'CL': 'CL - CAMPO LIMPO',
        'CS': 'CS - CAPELA DO SOCORRO',
        'CT': 'CT - CIDADE TIRADENTES',
        'CV': 'CV - CASA VERDE/CACHOEIRINHA',
        'EM': 'EM - ERMELINO MATARAZZO',
        'FB': 'FB - FREGUESIA/BRASILANDIA',
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
      },
      name: 'subprefeituraNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Campo é obrigatório`
  String get fieldRequired {
    return Intl.message(
      'Campo é obrigatório',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnectionErrorMessage {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get noDataFoundError {
    return Intl.message(
      'No data found',
      name: 'noDataFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error, please try again`
  String get unknownError {
    return Intl.message(
      'Unknown error, please try again',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `An error was found in the parameters, following parameters are required: `
  String get textErrorHome {
    return Intl.message(
      'An error was found in the parameters, following parameters are required: ',
      name: 'textErrorHome',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
