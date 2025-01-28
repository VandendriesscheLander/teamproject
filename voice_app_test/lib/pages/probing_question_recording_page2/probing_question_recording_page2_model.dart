import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'probing_question_recording_page2_widget.dart'
    show ProbingQuestionRecordingPage2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class ProbingQuestionRecordingPage2Model
    extends FlutterFlowModel<ProbingQuestionRecordingPage2Widget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool hasRecorded = false;

  bool? loading = false;

  ///  State fields for stateful widgets in this page.

  String? q2RecorderPath;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (STT API)] action in IconButton widget.
  ApiCallResponse? apiresultq2;
  AudioRecorder? audioRecorder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
