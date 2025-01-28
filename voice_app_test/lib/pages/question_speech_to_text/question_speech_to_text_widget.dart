import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'question_speech_to_text_model.dart';
export 'question_speech_to_text_model.dart';

class QuestionSpeechToTextWidget extends StatefulWidget {
  /// Speech to text page for the main question
  const QuestionSpeechToTextWidget({super.key});

  @override
  State<QuestionSpeechToTextWidget> createState() =>
      _QuestionSpeechToTextWidgetState();
}

class _QuestionSpeechToTextWidgetState
    extends State<QuestionSpeechToTextWidget> {
  late QuestionSpeechToTextModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionSpeechToTextModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().apiresponseMain);
    _model.textFieldFocusNode ??= FocusNode();

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
                                'iayv63oi' /* Review Your Voice */,
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
                                'fjluloda' /* Click the text to edit, or rec... */,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (_model.isRecording == true) {
                                              return FlutterFlowIconButton(
                                                borderRadius: 80.0,
                                                buttonSize: 80.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.square_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 30.0,
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
                                                      _model.secondMainRecordingPath =
                                                          audioFilePath;
                                                      _model.recordedFileBytes1 =
                                                          audioBytes;
                                                    },
                                                  );

                                                  _model.isRecording = false;
                                                  safeSetState(() {});
                                                  _model.loading = true;
                                                  safeSetState(() {});
                                                  _model.apiresultmainsecond =
                                                      await SttApiCall.call(
                                                    file: _model
                                                        .recordedFileBytes1,
                                                  );

                                                  if ((_model
                                                          .apiresultmainsecond
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState()
                                                            .apiresponseMain =
                                                        '${FFAppState().apiresponseMain} ${SttApiCall.text(
                                                      (_model.apiresultmainsecond
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()}';
                                                    safeSetState(() {});
                                                    _model.hasRecorded = true;
                                                    safeSetState(() {});
                                                    _model.loading = false;
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model.textController
                                                              ?.text =
                                                          FFAppState()
                                                              .apiresponseMain;
                                                    });
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
                                                buttonSize: 80.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.mic,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  await startAudioRecording(
                                                    context,
                                                    audioRecorder:
                                                        _model.audioRecorder ??=
                                                            AudioRecorder(),
                                                  );

                                                  _model.isRecording = true;
                                                  safeSetState(() {});
                                                  _model.timerController
                                                      .onStartTimer();
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
                                                    initialTime: _model
                                                        .timerInitialTimeMs,
                                                    getDisplayTime: (value) =>
                                                        StopWatchTimer
                                                            .getDisplayTime(
                                                      value,
                                                      hours: false,
                                                      milliSecond: false,
                                                    ),
                                                    controller:
                                                        _model.timerController,
                                                    updateStateInterval:
                                                        Duration(
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
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      await stopAudioRecording(
                                                        audioRecorder: _model
                                                            .audioRecorder,
                                                        audioName:
                                                            'recordedFileBytes2',
                                                        onRecordingComplete:
                                                            (audioFilePath,
                                                                audioBytes) {
                                                          _model.mainRecordingtimer2 =
                                                              audioFilePath;
                                                          _model.recordedFileBytes2 =
                                                              audioBytes;
                                                        },
                                                      );

                                                      _model.isRecording =
                                                          false;
                                                      safeSetState(() {});
                                                      _model.loading = true;
                                                      safeSetState(() {});
                                                      _model.apiresulttimer2 =
                                                          await SttApiCall.call(
                                                        file: _model
                                                            .recordedFileBytes1,
                                                      );

                                                      if ((_model
                                                              .apiresulttimer2
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                                .apiresponseMain =
                                                            '${FFAppState().apiresponseMain} ${SttApiCall.text(
                                                          (_model.apiresulttimer2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()}';
                                                        safeSetState(() {});
                                                        _model.hasRecorded =
                                                            true;
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
                                                                  child: Text(
                                                                      'Ok'),
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
                                                    width: 170.0,
                                                    height: 45.0,
                                                    fit: BoxFit.contain,
                                                    animate: true,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dt5i27n3' /* Tap to Record */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
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
                                          width: 170.0,
                                          height: 140.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'j6595oaz' /* Loading ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
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
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        FFAppState().apiresponseMain =
                                            _model.textController.text;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: FFAppState().apiresponseMain,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 12,
                                    minLines: 8,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ],
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
                            StreamBuilder<List<QuestionsDBRecord>>(
                              stream: queryQuestionsDBRecord(
                                queryBuilder: (questionsDBRecord) =>
                                    questionsDBRecord.where(
                                  'mainQuestion',
                                  isEqualTo: FFAppState().mainQuestion,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<QuestionsDBRecord>
                                    rowQuestionsDBRecordList = snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final rowQuestionsDBRecord =
                                    rowQuestionsDBRecordList.isNotEmpty
                                        ? rowQuestionsDBRecordList.first
                                        : null;

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'MainQuestionRecordPage',
                                            queryParameters: {
                                              'mainQuestion': serializeParam(
                                                FFAppState().mainQuestion,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9dmk3mnj' /* Back */,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.38,
                                          height: 56.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                    Builder(
                                      builder: (context) {
                                        if (!(rowQuestionsDBRecord!
                                            .probingQuestions.isNotEmpty)) {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));
                                                  _model.apiResultQuestion =
                                                      await ProbingQuestionsCall
                                                          .call(
                                                    mainquestion: FFAppState()
                                                        .mainQuestion,
                                                    answer: FFAppState()
                                                        .apiresponseMain,
                                                  );

                                                  if ((_model.apiResultQuestion
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().Question1 =
                                                        ProbingQuestionsCall
                                                            .question1(
                                                      (_model.apiResultQuestion
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString();
                                                    FFAppState().Question2 =
                                                        ProbingQuestionsCall
                                                            .question2(
                                                      (_model.apiResultQuestion
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString();
                                                    FFAppState().Question3 =
                                                        ProbingQuestionsCall
                                                            .question3(
                                                      (_model.apiResultQuestion
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString();
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                        'ProbingQuestionRecordingPage1');
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Error'),
                                                          content: Text(
                                                              'AI couldn\'t generate extra questions, please try again.'),
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
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dalv83d6' /* Next */,
                                                ),
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.38,
                                                  height: 56.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconAlignment:
                                                      IconAlignment.start,
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 2.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().Question1 =
                                                            rowQuestionsDBRecord!
                                                                .probingQuestions
                                                                .firstOrNull!;
                                                        FFAppState().Question2 =
                                                            rowQuestionsDBRecord!
                                                                .probingQuestions
                                                                .elementAtOrNull(
                                                                    1)!;
                                                        FFAppState().Question3 =
                                                            rowQuestionsDBRecord!
                                                                .probingQuestions
                                                                .lastOrNull!;
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            'ProbingQuestionRecordingPage1');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'u97wilta' /* Next */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.38,
                                                        height: 56.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 2.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().Question1 =
                                                            rowQuestionsDBRecord!
                                                                .probQuestionsNL
                                                                .firstOrNull!;
                                                        FFAppState().Question2 =
                                                            rowQuestionsDBRecord!
                                                                .probQuestionsNL
                                                                .elementAtOrNull(
                                                                    1)!;
                                                        FFAppState().Question3 =
                                                            rowQuestionsDBRecord!
                                                                .probQuestionsNL
                                                                .lastOrNull!;
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            'ProbingQuestionRecordingPage1');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ib8uyve2' /* Back */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.38,
                                                        height: 56.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 2.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
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
      ),
    );
  }
}
