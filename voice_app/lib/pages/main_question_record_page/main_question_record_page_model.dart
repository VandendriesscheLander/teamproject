import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'main_question_record_page_widget.dart'
    show MainQuestionRecordPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class MainQuestionRecordPageModel
    extends FlutterFlowModel<MainQuestionRecordPageWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool hasRecorded = false;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  String? mainRecordingPath;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? apiresultmain;
  AudioRecorder? audioRecorder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
