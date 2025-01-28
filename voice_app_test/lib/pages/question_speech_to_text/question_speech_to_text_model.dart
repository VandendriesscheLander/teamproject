import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'question_speech_to_text_widget.dart' show QuestionSpeechToTextWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class QuestionSpeechToTextModel
    extends FlutterFlowModel<QuestionSpeechToTextWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool loading = false;

  bool hasRecorded = false;

  ///  State fields for stateful widgets in this page.

  String? secondMainRecordingPath;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? apiresultmainsecond;
  AudioRecorder? audioRecorder;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 5400000;
  int timerMilliseconds = 5400000;
  String timerValue = StopWatchTimer.getDisplayTime(
    5400000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? mainRecordingtimer2;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in Timer widget.
  ApiCallResponse? apiresulttimer2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Probing Questions)] action in Button widget.
  ApiCallResponse? apiResultQuestion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
