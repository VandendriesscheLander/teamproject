import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'summary_page_model.dart';
export 'summary_page_model.dart';

class SummaryPageWidget extends StatefulWidget {
  /// Page with all question/probing questions and their answers
  const SummaryPageWidget({super.key});

  @override
  State<SummaryPageWidget> createState() => _SummaryPageWidgetState();
}

class _SummaryPageWidgetState extends State<SummaryPageWidget> {
  late SummaryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryPageModel());

    _model.textController1 ??=
        TextEditingController(text: FFAppState().apiresponseMain);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: FFAppState().apiresponseQ1);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: FFAppState().apiresponseQ2);
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: FFAppState().apiresponseQ3);
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            child: SingleChildScrollView(
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
                                'j0gopu3q' /* Summary */,
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
                              FFLocalizations.of(context).getText(
                                'xmc6bp4y' /* Review your responses before s... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                                'z0ei0fh9' /* Main Question */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFAppState().mainQuestion,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController1',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              FFAppState().apiresponseMain =
                                                  _model.textController1.text;
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'b6cu6ntp' /* TextField */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 10,
                                          minLines: 1,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (!_model.loadingmain) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .isRecordingmain ==
                                                          true) {
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 80.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons
                                                                  .square_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 15.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              _model
                                                                  .timerController4
                                                                  .onStopTimer();
                                                              await stopAudioRecording(
                                                                audioRecorder:
                                                                    _model
                                                                        .audioRecorder1,
                                                                audioName:
                                                                    'recordedFileBytes1',
                                                                onRecordingComplete:
                                                                    (audioFilePath,
                                                                        audioBytes) {
                                                                  _model.summarymainpath =
                                                                      audioFilePath;
                                                                  _model.recordedFileBytes1 =
                                                                      audioBytes;
                                                                },
                                                              );

                                                              _model.isRecordingmain =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              _model.loadingmain =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              _model.summarymain =
                                                                  await SttApiCall
                                                                      .call(
                                                                file: _model
                                                                    .recordedFileBytes1,
                                                              );

                                                              if ((_model
                                                                      .summarymain
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                FFAppState()
                                                                        .apiresponseMain =
                                                                    '${_model.textController1.text} ${SttApiCall.text(
                                                                  (_model.summarymain
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString()}';
                                                                safeSetState(
                                                                    () {});
                                                                _model.loadingmain =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model.textController1
                                                                          ?.text =
                                                                      FFAppState()
                                                                          .apiresponseMain;
                                                                });
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Error'),
                                                                      content: Text(
                                                                          'Error API'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      } else {
                                                        return FlutterFlowIconButton(
                                                          borderRadius: 80.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.mic,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            await startAudioRecording(
                                                              context,
                                                              audioRecorder: _model
                                                                      .audioRecorder1 ??=
                                                                  AudioRecorder(),
                                                            );

                                                            _model.isRecordingmain =
                                                                true;
                                                            safeSetState(() {});
                                                            _model
                                                                .timerController4
                                                                .onStartTimer();
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .isRecordingmain ==
                                                          true) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowTimer(
                                                              initialTime: _model
                                                                  .timerInitialTimeMs1,
                                                              getDisplayTime: (value) =>
                                                                  StopWatchTimer
                                                                      .getDisplayTime(
                                                                value,
                                                                hours: false,
                                                                milliSecond:
                                                                    false,
                                                              ),
                                                              controller: _model
                                                                  .timerController1,
                                                              updateStateInterval:
                                                                  Duration(
                                                                      milliseconds:
                                                                          1000),
                                                              onChanged: (value,
                                                                  displayTime,
                                                                  shouldUpdate) {
                                                                _model.timerMilliseconds1 =
                                                                    value;
                                                                _model.timerValue1 =
                                                                    displayTime;
                                                                if (shouldUpdate)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              onEnded:
                                                                  () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
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
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                await stopAudioRecording(
                                                                  audioRecorder:
                                                                      _model
                                                                          .audioRecorder1,
                                                                  audioName:
                                                                      'recordedFileBytes2',
                                                                  onRecordingComplete:
                                                                      (audioFilePath,
                                                                          audioBytes) {
                                                                    _model.summarymaintimer =
                                                                        audioFilePath;
                                                                    _model.recordedFileBytes2 =
                                                                        audioBytes;
                                                                  },
                                                                );

                                                                _model.isRecordingmain =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.loadingmain =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.summarymaintimerapi =
                                                                    await SttApiCall
                                                                        .call(
                                                                  file: _model
                                                                      .recordedFileBytes1,
                                                                );

                                                                if ((_model
                                                                        .summarymaintimerapi
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  FFAppState()
                                                                          .apiresponseMain =
                                                                      '${_model.textController1.text} ${SttApiCall.text(
                                                                    (_model.summarymaintimerapi
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()}';
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.loadingmain =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model.textController1
                                                                            ?.text =
                                                                        FFAppState()
                                                                            .apiresponseMain;
                                                                  });
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Error'),
                                                                        content:
                                                                            Text('Error API'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter Tight',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        1.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'f50r6nts' /* Button */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 0.0,
                                                            height: 0.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter Tight',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Lottie.asset(
                                                    'assets/jsons/Animation_-_1736774612175.json',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                    animate: true,
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ].divide(SizedBox(height: 24.0)),
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
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'mdhe4vg4' /* Probing Questions */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFAppState().Question1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController2',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  FFAppState().apiresponseQ1 =
                                                      _model
                                                          .textController2.text;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '76vgvkdj' /* No Answer Recorded */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: 10,
                                              minLines: 1,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (!_model.loadingQ1) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ1 ==
                                                              true) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    80.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .square_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 15.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .timerController1
                                                                      .onStopTimer();
                                                                  await stopAudioRecording(
                                                                    audioRecorder:
                                                                        _model
                                                                            .audioRecorder2,
                                                                    audioName:
                                                                        'recordedFileBytes3',
                                                                    onRecordingComplete:
                                                                        (audioFilePath,
                                                                            audioBytes) {
                                                                      _model.summaryQ1path =
                                                                          audioFilePath;
                                                                      _model.recordedFileBytes3 =
                                                                          audioBytes;
                                                                    },
                                                                  );

                                                                  _model.isRecordingQ1 =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.loadingQ1 =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.summaryQ1 =
                                                                      await SttApiCall
                                                                          .call(
                                                                    file: _model
                                                                        .recordedFileBytes3,
                                                                  );

                                                                  if ((_model
                                                                          .summaryQ1
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                            .apiresponseQ1 =
                                                                        '${FFAppState().apiresponseQ1} ${SttApiCall.text(
                                                                      (_model.summaryQ1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()}';
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ1 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textController2
                                                                              ?.text =
                                                                          FFAppState()
                                                                              .apiresponseQ1;
                                                                    });
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Error'),
                                                                          content:
                                                                              Text('Error API'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            );
                                                          } else {
                                                            return FlutterFlowIconButton(
                                                              borderRadius:
                                                                  80.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.mic,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 15.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await startAudioRecording(
                                                                  context,
                                                                  audioRecorder:
                                                                      _model.audioRecorder2 ??=
                                                                          AudioRecorder(),
                                                                );

                                                                _model.isRecordingQ1 =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                _model
                                                                    .timerController1
                                                                    .onStartTimer();
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ1 ==
                                                              true) {
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowTimer(
                                                                  initialTime:
                                                                      _model
                                                                          .timerInitialTimeMs2,
                                                                  getDisplayTime:
                                                                      (value) =>
                                                                          StopWatchTimer
                                                                              .getDisplayTime(
                                                                    value,
                                                                    hours:
                                                                        false,
                                                                    milliSecond:
                                                                        false,
                                                                  ),
                                                                  controller: _model
                                                                      .timerController2,
                                                                  updateStateInterval:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                  onChanged: (value,
                                                                      displayTime,
                                                                      shouldUpdate) {
                                                                    _model.timerMilliseconds2 =
                                                                        value;
                                                                    _model.timerValue2 =
                                                                        displayTime;
                                                                    if (shouldUpdate)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                  onEnded:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('You have reached the time limit'),
                                                                          content:
                                                                              Text('Please click Ok to continue'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    await stopAudioRecording(
                                                                      audioRecorder:
                                                                          _model
                                                                              .audioRecorder2,
                                                                      audioName:
                                                                          'recordedFileBytes4',
                                                                      onRecordingComplete:
                                                                          (audioFilePath,
                                                                              audioBytes) {
                                                                        _model.summaryQ1timer =
                                                                            audioFilePath;
                                                                        _model.recordedFileBytes4 =
                                                                            audioBytes;
                                                                      },
                                                                    );

                                                                    _model.isRecordingQ1 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ1 =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.summaryQ1timerapi =
                                                                        await SttApiCall
                                                                            .call(
                                                                      file: _model
                                                                          .recordedFileBytes3,
                                                                    );

                                                                    if ((_model
                                                                            .summaryQ1timerapi
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      FFAppState()
                                                                              .apiresponseQ1 =
                                                                          '${_model.textController2.text} ${SttApiCall.text(
                                                                        (_model.summaryQ1timerapi?.jsonBody ??
                                                                            ''),
                                                                      ).toString()}';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.loadingQ1 =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController2
                                                                            ?.text = FFAppState().apiresponseQ1;
                                                                      });
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('Error API'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter Tight',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            1.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            return FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ocys503v' /* Button */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 0.0,
                                                                height: 0.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter Tight',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Lottie.asset(
                                                        'assets/jsons/Animation_-_1736774612175.json',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFAppState().Question2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode3,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController3',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  FFAppState().apiresponseQ2 =
                                                      _model
                                                          .textController3.text;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0nxkwnf2' /* No Answer Recorded */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: 10,
                                              minLines: 1,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (!_model.loadingQ2) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ2 ==
                                                              true) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    80.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .square_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 15.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .timerController2
                                                                      .onStopTimer();
                                                                  await stopAudioRecording(
                                                                    audioRecorder:
                                                                        _model
                                                                            .audioRecorder3,
                                                                    audioName:
                                                                        'recordedFileBytes5',
                                                                    onRecordingComplete:
                                                                        (audioFilePath,
                                                                            audioBytes) {
                                                                      _model.summaryQ2path =
                                                                          audioFilePath;
                                                                      _model.recordedFileBytes5 =
                                                                          audioBytes;
                                                                    },
                                                                  );

                                                                  _model.isRecordingQ2 =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.loadingQ2 =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.summaryQ2 =
                                                                      await SttApiCall
                                                                          .call(
                                                                    file: _model
                                                                        .recordedFileBytes5,
                                                                  );

                                                                  if ((_model
                                                                          .summaryQ2
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                            .apiresponseQ2 =
                                                                        '${FFAppState().apiresponseQ2} ${SttApiCall.text(
                                                                      (_model.summaryQ2
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()}';
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ2 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textController3
                                                                              ?.text =
                                                                          FFAppState()
                                                                              .apiresponseQ2;
                                                                    });
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Error'),
                                                                          content:
                                                                              Text('Error API'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            );
                                                          } else {
                                                            return FlutterFlowIconButton(
                                                              borderRadius:
                                                                  80.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.mic,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 15.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await startAudioRecording(
                                                                  context,
                                                                  audioRecorder:
                                                                      _model.audioRecorder3 ??=
                                                                          AudioRecorder(),
                                                                );

                                                                _model.isRecordingQ2 =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                _model
                                                                    .timerController2
                                                                    .onStartTimer();
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ2 ==
                                                              true) {
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowTimer(
                                                                  initialTime:
                                                                      _model
                                                                          .timerInitialTimeMs3,
                                                                  getDisplayTime:
                                                                      (value) =>
                                                                          StopWatchTimer
                                                                              .getDisplayTime(
                                                                    value,
                                                                    hours:
                                                                        false,
                                                                    milliSecond:
                                                                        false,
                                                                  ),
                                                                  controller: _model
                                                                      .timerController3,
                                                                  updateStateInterval:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                  onChanged: (value,
                                                                      displayTime,
                                                                      shouldUpdate) {
                                                                    _model.timerMilliseconds3 =
                                                                        value;
                                                                    _model.timerValue3 =
                                                                        displayTime;
                                                                    if (shouldUpdate)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                  onEnded:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('You have reached the time limit'),
                                                                          content:
                                                                              Text('Please click Ok to continue'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    await stopAudioRecording(
                                                                      audioRecorder:
                                                                          _model
                                                                              .audioRecorder3,
                                                                      audioName:
                                                                          'recordedFileBytes6',
                                                                      onRecordingComplete:
                                                                          (audioFilePath,
                                                                              audioBytes) {
                                                                        _model.summaryQ2timer =
                                                                            audioFilePath;
                                                                        _model.recordedFileBytes6 =
                                                                            audioBytes;
                                                                      },
                                                                    );

                                                                    _model.isRecordingQ2 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ2 =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.summaryQ2timerapi =
                                                                        await SttApiCall
                                                                            .call(
                                                                      file: _model
                                                                          .recordedFileBytes5,
                                                                    );

                                                                    if ((_model
                                                                            .summaryQ2timerapi
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      FFAppState()
                                                                              .apiresponseQ2 =
                                                                          '${_model.textController3.text} ${SttApiCall.text(
                                                                        (_model.summaryQ2timerapi?.jsonBody ??
                                                                            ''),
                                                                      ).toString()}';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.loadingQ2 =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController3
                                                                            ?.text = FFAppState().apiresponseQ2;
                                                                      });
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('Error API'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter Tight',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            1.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            return FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'oazyy5w7' /* Button */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 0.0,
                                                                height: 0.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter Tight',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Lottie.asset(
                                                        'assets/jsons/Animation_-_1736774612175.json',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFAppState().Question3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController4,
                                              focusNode:
                                                  _model.textFieldFocusNode4,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController4',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  FFAppState().apiresponseQ3 =
                                                      _model
                                                          .textController4.text;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'f5o9coyc' /* No Answer Recorded */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: 10,
                                              minLines: 1,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController4Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (!_model.loadingQ3) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ3 ==
                                                              true) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    80.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .square_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 15.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .timerController3
                                                                      .onStopTimer();
                                                                  await stopAudioRecording(
                                                                    audioRecorder:
                                                                        _model
                                                                            .audioRecorder4,
                                                                    audioName:
                                                                        'recordedFileBytes7',
                                                                    onRecordingComplete:
                                                                        (audioFilePath,
                                                                            audioBytes) {
                                                                      _model.summaryQ3path =
                                                                          audioFilePath;
                                                                      _model.recordedFileBytes7 =
                                                                          audioBytes;
                                                                    },
                                                                  );

                                                                  _model.isRecordingQ3 =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.loadingQ3 =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.summaryQ3 =
                                                                      await SttApiCall
                                                                          .call(
                                                                    file: _model
                                                                        .recordedFileBytes7,
                                                                  );

                                                                  if ((_model
                                                                          .summaryQ3
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                            .apiresponseQ3 =
                                                                        '${FFAppState().apiresponseQ3} ${SttApiCall.text(
                                                                      (_model.summaryQ3
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()}';
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ3 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textController4
                                                                              ?.text =
                                                                          FFAppState()
                                                                              .apiresponseQ3;
                                                                    });
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Error'),
                                                                          content:
                                                                              Text('Error API'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            );
                                                          } else {
                                                            return FlutterFlowIconButton(
                                                              borderRadius:
                                                                  80.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.mic,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 15.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await startAudioRecording(
                                                                  context,
                                                                  audioRecorder:
                                                                      _model.audioRecorder4 ??=
                                                                          AudioRecorder(),
                                                                );

                                                                _model.isRecordingQ3 =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                _model
                                                                    .timerController3
                                                                    .onStartTimer();
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isRecordingQ3 ==
                                                              true) {
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowTimer(
                                                                  initialTime:
                                                                      _model
                                                                          .timerInitialTimeMs4,
                                                                  getDisplayTime:
                                                                      (value) =>
                                                                          StopWatchTimer
                                                                              .getDisplayTime(
                                                                    value,
                                                                    hours:
                                                                        false,
                                                                    milliSecond:
                                                                        false,
                                                                  ),
                                                                  controller: _model
                                                                      .timerController4,
                                                                  updateStateInterval:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                  onChanged: (value,
                                                                      displayTime,
                                                                      shouldUpdate) {
                                                                    _model.timerMilliseconds4 =
                                                                        value;
                                                                    _model.timerValue4 =
                                                                        displayTime;
                                                                    if (shouldUpdate)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                  onEnded:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('You have reached the time limit'),
                                                                          content:
                                                                              Text('Please click Ok to continue'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    await stopAudioRecording(
                                                                      audioRecorder:
                                                                          _model
                                                                              .audioRecorder4,
                                                                      audioName:
                                                                          'recordedFileBytes8',
                                                                      onRecordingComplete:
                                                                          (audioFilePath,
                                                                              audioBytes) {
                                                                        _model.summaryQ3timer =
                                                                            audioFilePath;
                                                                        _model.recordedFileBytes8 =
                                                                            audioBytes;
                                                                      },
                                                                    );

                                                                    _model.isRecordingQ3 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.loadingQ3 =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.summaryQ3timerapi =
                                                                        await SttApiCall
                                                                            .call(
                                                                      file: _model
                                                                          .recordedFileBytes7,
                                                                    );

                                                                    if ((_model
                                                                            .summaryQ3timerapi
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      FFAppState()
                                                                              .apiresponseQ3 =
                                                                          '${_model.textController4.text} ${SttApiCall.text(
                                                                        (_model.summaryQ3timerapi?.jsonBody ??
                                                                            ''),
                                                                      ).toString()}';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.loadingQ3 =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController4
                                                                            ?.text = FFAppState().apiresponseQ3;
                                                                      });
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('Error API'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter Tight',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            1.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            return FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'qyxtqro4' /* Button */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 0.0,
                                                                height: 0.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter Tight',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Lottie.asset(
                                                        'assets/jsons/Animation_-_1736774612175.json',
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          'ProbingQuestionRecordingPage3');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'chuyif19' /* Back */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.38,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 2.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  Flexible(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultuwl =
                                            await ExtractThemesCall.call(
                                          a1: FFAppState().apiresponseQ1,
                                          a2: FFAppState().apiresponseQ2,
                                          a3: FFAppState().apiresponseQ3,
                                          mainAnswer:
                                              FFAppState().apiresponseMain,
                                          mainquestion:
                                              FFAppState().mainQuestion,
                                          q1: FFAppState().Question1,
                                          q2: FFAppState().Question2,
                                          q3: FFAppState().Question3,
                                        );

                                        if ((_model.apiResultuwl?.succeeded ??
                                            true)) {
                                          await VoiceDBRecord.collection
                                              .doc()
                                              .set({
                                            ...createVoiceDBRecordData(
                                              question: ExtractThemesCall
                                                  .mainquestion(
                                                (_model.apiResultuwl
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              questionAnswer:
                                                  ExtractThemesCall.mainanswer(
                                                (_model.apiResultuwl
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              followup1: ExtractThemesCall.q1(
                                                (_model.apiResultuwl
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              followup1Answer:
                                                  valueOrDefault<String>(
                                                ExtractThemesCall.a1(
                                                  (_model.apiResultuwl
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                'No Answer Recorded',
                                              ),
                                              followup2: ExtractThemesCall.q2(
                                                (_model.apiResultuwl
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              followup2Answer:
                                                  valueOrDefault<String>(
                                                ExtractThemesCall.a2(
                                                  (_model.apiResultuwl
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                'No Answer Recorded',
                                              ),
                                              followup3: ExtractThemesCall.q3(
                                                (_model.apiResultuwl
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              followup3Answer:
                                                  valueOrDefault<String>(
                                                ExtractThemesCall.a3(
                                                  (_model.apiResultuwl
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                'No Answer Recorded',
                                              ),
                                              originalQuestion:
                                                  FFAppState().mainQuestion,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'themes':
                                                    ExtractThemesCall.themes(
                                                  (_model.apiResultuwl
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                              },
                                            ),
                                          });
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
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Failed to extract themes'),
                                                content: Text(
                                                    'Press Ok to try again'),
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
                                      text: FFLocalizations.of(context).getText(
                                        'otm83xrm' /* Submit */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.38,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
