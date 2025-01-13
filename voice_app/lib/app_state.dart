import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _popUpBoolean = false;
  bool get popUpBoolean => _popUpBoolean;
  set popUpBoolean(bool value) {
    _popUpBoolean = value;
  }

  String _apiresponseMain = '';
  String get apiresponseMain => _apiresponseMain;
  set apiresponseMain(String value) {
    _apiresponseMain = value;
  }

  String _Question1 = '';
  String get Question1 => _Question1;
  set Question1(String value) {
    _Question1 = value;
  }

  String _Question2 = '';
  String get Question2 => _Question2;
  set Question2(String value) {
    _Question2 = value;
  }

  String _Question3 = '';
  String get Question3 => _Question3;
  set Question3(String value) {
    _Question3 = value;
  }

  String _apiresponseQ1 = '';
  String get apiresponseQ1 => _apiresponseQ1;
  set apiresponseQ1(String value) {
    _apiresponseQ1 = value;
  }

  String _apiresponseQ2 = '';
  String get apiresponseQ2 => _apiresponseQ2;
  set apiresponseQ2(String value) {
    _apiresponseQ2 = value;
  }

  String _apiresponseQ3 = '';
  String get apiresponseQ3 => _apiresponseQ3;
  set apiresponseQ3(String value) {
    _apiresponseQ3 = value;
  }

  String _mainQuestion = '';
  String get mainQuestion => _mainQuestion;
  set mainQuestion(String value) {
    _mainQuestion = value;
  }
}
