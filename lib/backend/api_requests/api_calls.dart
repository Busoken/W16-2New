import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TetsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Tets',
      apiUrl:
          'https://htwqmzblresezidexpyx.supabase.co/rest/v1/rpc/getwatchlist',
      callType: ApiCallType.POST,
      headers: {
        'apiKey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0d3FtemJscmVzZXppZGV4cHl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2NDMyMTMsImV4cCI6MjAyMzIxOTIxM30.JEXazetwodZ1Nnhvc8dr3nmuQVIlnT3dAHM1sIPXsBo',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0d3FtemJscmVzZXppZGV4cHl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2NDMyMTMsImV4cCI6MjAyMzIxOTIxM30.JEXazetwodZ1Nnhvc8dr3nmuQVIlnT3dAHM1sIPXsBo',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageurl(dynamic response) => (getJsonField(
        response,
        r'''$[:].image_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
