import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'main_question_record_page_model.dart';
export 'main_question_record_page_model.dart';

class MainQuestionRecordPageWidget extends StatefulWidget {
  const MainQuestionRecordPageWidget({
    super.key,
    required this.mainQuestion,
  });

  final String? mainQuestion;

  @override
  State<MainQuestionRecordPageWidget> createState() =>
      _MainQuestionRecordPageWidgetState();
}

class _MainQuestionRecordPageWidgetState
    extends State<MainQuestionRecordPageWidget> {
  late MainQuestionRecordPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainQuestionRecordPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.home,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            FFAppState().apiresponseQ1 = '';
                            FFAppState().apiresponseQ2 = '';
                            FFAppState().apiresponseQ3 = '';
                            FFAppState().Question1 = '';
                            FFAppState().Question2 = '';
                            FFAppState().Question3 = '';
                            FFAppState().apiresponseMain = '';
                            FFAppState().mainQuestion = '';
                            safeSetState(() {});

                            context.pushNamed('HomePage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '3sx25g4n' /* Share Your Voice */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.mainQuestion,
                              'mainquestion',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 280.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (!_model.loading) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 40.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isRecording == true) {
                                            return FlutterFlowIconButton(
                                              borderRadius: 80.0,
                                              buttonSize: 120.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.square_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 40.0,
                                              ),
                                              onPressed: () async {
                                                _model.timerController
                                                    .onStopTimer();
                                                await stopAudioRecording(
                                                  audioRecorder:
                                                      _model.audioRecorder,
                                                  audioName:
                                                      'recordedFileBytes1',
                                                  onRecordingComplete:
                                                      (audioFilePath,
                                                          audioBytes) {
                                                    _model.mainRecordingPath =
                                                        audioFilePath;
                                                    _model.recordedFileBytes1 =
                                                        audioBytes;
                                                  },
                                                );

                                                _model.isRecording = false;
                                                safeSetState(() {});
                                                _model.loading = true;
                                                safeSetState(() {});
                                                _model.apiresultmain =
                                                    await SttApiCall.call(
                                                  file:
                                                      _model.recordedFileBytes1,
                                                );

                                                if ((_model.apiresultmain
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().apiresponseMain =
                                                      SttApiCall.text(
                                                    (_model.apiresultmain
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString();
                                                  safeSetState(() {});
                                                  _model.hasRecorded = true;
                                                  safeSetState(() {});
                                                  _model.loading = false;
                                                  safeSetState(() {});
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Error'),
                                                        content:
                                                            Text('Error API'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                            );
                                          } else {
                                            return FlutterFlowIconButton(
                                              borderRadius: 80.0,
                                              buttonSize: 120.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.mic,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 40.0,
                                              ),
                                              onPressed: () async {
                                                await requestPermission(
                                                    microphonePermission);
                                                _model.isRecording = true;
                                                safeSetState(() {});
                                                _model.timerController
                                                    .onStartTimer();
                                                await startAudioRecording(
                                                  context,
                                                  audioRecorder:
                                                      _model.audioRecorder ??=
                                                          AudioRecorder(),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.isRecording == true) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowTimer(
                                                  initialTime:
                                                      _model.timerInitialTimeMs,
                                                  getDisplayTime: (value) =>
                                                      StopWatchTimer
                                                          .getDisplayTime(
                                                    value,
                                                    hours: false,
                                                    milliSecond: false,
                                                  ),
                                                  controller:
                                                      _model.timerController,
                                                  updateStateInterval: Duration(
                                                      milliseconds: 1000),
                                                  onChanged: (value,
                                                      displayTime,
                                                      shouldUpdate) {
                                                    _model.timerMilliseconds =
                                                        value;
                                                    _model.timerValue =
                                                        displayTime;
                                                    if (shouldUpdate)
                                                      safeSetState(() {});
                                                  },
                                                  onEnded: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'You have reached the time limit'),
                                                          content: Text(
                                                              'Please click Ok to continue'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    await stopAudioRecording(
                                                      audioRecorder:
                                                          _model.audioRecorder,
                                                      audioName:
                                                          'recordedFileBytes2',
                                                      onRecordingComplete:
                                                          (audioFilePath,
                                                              audioBytes) {
                                                        _model.mainRecordingtimer =
                                                            audioFilePath;
                                                        _model.recordedFileBytes2 =
                                                            audioBytes;
                                                      },
                                                    );

                                                    _model.isRecording = false;
                                                    safeSetState(() {});
                                                    _model.loading = true;
                                                    safeSetState(() {});
                                                    _model.apiresulttimer =
                                                        await SttApiCall.call(
                                                      file: _model
                                                          .recordedFileBytes1,
                                                    );

                                                    if ((_model.apiresulttimer
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState()
                                                              .apiresponseMain =
                                                          SttApiCall.text(
                                                        (_model.apiresulttimer
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      safeSetState(() {});
                                                      _model.hasRecorded = true;
                                                      safeSetState(() {});
                                                      _model.loading = false;
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Error'),
                                                            content: Text(
                                                                'Error API'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 1.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Lottie.asset(
                                                  'assets/jsons/Animation_-_1736771025732.json',
                                                  width: 200.0,
                                                  height: 50.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't8hifcjb' /* Tap to Record */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(SizedBox(height: 24.0)),
                                  ),
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Lottie.asset(
                                        'assets/jsons/Animation_-_1736774612175.json',
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.contain,
                                        animate: true,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '0vq83vxu' /* Loading ... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('HomePage');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'outov8hp' /* Back */,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.38,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconAlignment: IconAlignment.end,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 2.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.hasRecorded) {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: FFButtonWidget(
                                            onPressed: (_model.hasRecorded ==
                                                    false)
                                                ? null
                                                : () async {
                                                    FFAppState().mainQuestion =
                                                        widget!.mainQuestion!;
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                        'QuestionSpeechToText');
                                                  },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'wsm2u9qi' /* Next */,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.38,
                                              height: 56.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 2.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: (_model.hasRecorded ==
                                                    false)
                                                ? null
                                                : () {
                                                    print('Button pressed ...');
                                                  },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6n9ptg1t' /* Next */,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.38,
                                              height: 56.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x8E95A1AC),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 2.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
