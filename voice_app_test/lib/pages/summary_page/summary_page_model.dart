import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'summary_page_widget.dart' show SummaryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class SummaryPageModel extends FlutterFlowModel<SummaryPageWidget> {
  ///  Local state fields for this page.

  bool loadingQ2 = false;

  bool isRecordingQ2 = false;

  bool loadingQ1 = false;

  bool isRecordingQ1 = false;

  bool loadingQ3 = false;

  bool isRecordingQ3 = false;

  bool loadingmain = false;

  bool isRecordingmain = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? summarymainpath;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? summarymain;
  AudioRecorder? audioRecorder1;
  // State field(s) for Timer widget.
  final timerInitialTimeMs1 = 5400000;
  int timerMilliseconds1 = 5400000;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    5400000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? summarymaintimer;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in Timer widget.
  ApiCallResponse? summarymaintimerapi;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? summaryQ1path;
  FFUploadedFile recordedFileBytes3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? summaryQ1;
  AudioRecorder? audioRecorder2;
  // State field(s) for Timer widget.
  final timerInitialTimeMs2 = 5400000;
  int timerMilliseconds2 = 5400000;
  String timerValue2 = StopWatchTimer.getDisplayTime(
    5400000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? summaryQ1timer;
  FFUploadedFile recordedFileBytes4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in Timer widget.
  ApiCallResponse? summaryQ1timerapi;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? summaryQ2path;
  FFUploadedFile recordedFileBytes5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? summaryQ2;
  AudioRecorder? audioRecorder3;
  // State field(s) for Timer widget.
  final timerInitialTimeMs3 = 5400000;
  int timerMilliseconds3 = 5400000;
  String timerValue3 = StopWatchTimer.getDisplayTime(
    5400000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController3 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? summaryQ2timer;
  FFUploadedFile recordedFileBytes6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in Timer widget.
  ApiCallResponse? summaryQ2timerapi;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? summaryQ3path;
  FFUploadedFile recordedFileBytes7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? summaryQ3;
  AudioRecorder? audioRecorder4;
  // State field(s) for Timer widget.
  final timerInitialTimeMs4 = 5400000;
  int timerMilliseconds4 = 5400000;
  String timerValue4 = StopWatchTimer.getDisplayTime(
    5400000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController4 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? summaryQ3timer;
  FFUploadedFile recordedFileBytes8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in Timer widget.
  ApiCallResponse? summaryQ3timerapi;
  // Stores action output result for [Backend Call - API (Extract Themes)] action in Button widget.
  ApiCallResponse? apiResultuwl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    timerController1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    timerController2.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    timerController3.dispose();
    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    timerController4.dispose();
  }
}
