import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SttApiCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'STT API',
      apiUrl: 'http://172.30.248.75:8080/transcribe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.text''',
      );
}

class ProbingQuestionsCall {
  static Future<ApiCallResponse> call({
    String? mainquestion = '',
    String? answer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mainquestion": "${escapeStringForJson(mainquestion)}",
  "answer": "${escapeStringForJson(answer)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Probing Questions',
      apiUrl: 'http://172.30.248.75:8080/questions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic question1(dynamic response) => getJsonField(
        response,
        r'''$.question1''',
      );
  static dynamic question2(dynamic response) => getJsonField(
        response,
        r'''$.question2''',
      );
  static dynamic question3(dynamic response) => getJsonField(
        response,
        r'''$.question3''',
      );
}

class ExtractThemesCall {
  static Future<ApiCallResponse> call({
    String? mainAnswer = '',
    String? a1 = '',
    String? a2 = '',
    String? a3 = '',
    String? mainquestion = '',
    String? q1 = '',
    String? q2 = '',
    String? q3 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mainanswer": "${escapeStringForJson(mainAnswer)}",
  "A1": "${escapeStringForJson(a1)}",
  "A2": "${escapeStringForJson(a2)}",
  "A3": "${escapeStringForJson(a3)}",
  "mainquestion": "${escapeStringForJson(mainquestion)}",
  "Q1": "${escapeStringForJson(q1)}",
  "Q2": "${escapeStringForJson(q2)}",
  "Q3": "${escapeStringForJson(q3)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Extract Themes',
      apiUrl: 'http://172.30.248.75:8080/extract-themes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic themes(dynamic response) => getJsonField(
        response,
        r'''$.themes''',
      );
  static dynamic mainquestion(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.mainquestion''',
      );
  static dynamic mainanswer(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.mainanswer''',
      );
  static dynamic q1(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.Q1''',
      );
  static dynamic q2(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.Q2''',
      );
  static dynamic q3(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.Q3''',
      );
  static dynamic a1(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.A1''',
      );
  static dynamic a2(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.A2''',
      );
  static dynamic a3(dynamic response) => getJsonField(
        response,
        r'''$.translated_questions_and_answers.A3''',
      );
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
