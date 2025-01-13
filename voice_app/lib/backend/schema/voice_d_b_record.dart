import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoiceDBRecord extends FirestoreRecord {
  VoiceDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "questionAnswer" field.
  String? _questionAnswer;
  String get questionAnswer => _questionAnswer ?? '';
  bool hasQuestionAnswer() => _questionAnswer != null;

  // "followup1" field.
  String? _followup1;
  String get followup1 => _followup1 ?? '';
  bool hasFollowup1() => _followup1 != null;

  // "followup1Answer" field.
  String? _followup1Answer;
  String get followup1Answer => _followup1Answer ?? '';
  bool hasFollowup1Answer() => _followup1Answer != null;

  // "followup2" field.
  String? _followup2;
  String get followup2 => _followup2 ?? '';
  bool hasFollowup2() => _followup2 != null;

  // "followup2Answer" field.
  String? _followup2Answer;
  String get followup2Answer => _followup2Answer ?? '';
  bool hasFollowup2Answer() => _followup2Answer != null;

  // "followup3" field.
  String? _followup3;
  String get followup3 => _followup3 ?? '';
  bool hasFollowup3() => _followup3 != null;

  // "followup3Answer" field.
  String? _followup3Answer;
  String get followup3Answer => _followup3Answer ?? '';
  bool hasFollowup3Answer() => _followup3Answer != null;

  // "themes" field.
  List<String>? _themes;
  List<String> get themes => _themes ?? const [];
  bool hasThemes() => _themes != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _questionAnswer = snapshotData['questionAnswer'] as String?;
    _followup1 = snapshotData['followup1'] as String?;
    _followup1Answer = snapshotData['followup1Answer'] as String?;
    _followup2 = snapshotData['followup2'] as String?;
    _followup2Answer = snapshotData['followup2Answer'] as String?;
    _followup3 = snapshotData['followup3'] as String?;
    _followup3Answer = snapshotData['followup3Answer'] as String?;
    _themes = getDataList(snapshotData['themes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VoiceDB');

  static Stream<VoiceDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoiceDBRecord.fromSnapshot(s));

  static Future<VoiceDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoiceDBRecord.fromSnapshot(s));

  static VoiceDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VoiceDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoiceDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoiceDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoiceDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoiceDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoiceDBRecordData({
  String? question,
  String? questionAnswer,
  String? followup1,
  String? followup1Answer,
  String? followup2,
  String? followup2Answer,
  String? followup3,
  String? followup3Answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'questionAnswer': questionAnswer,
      'followup1': followup1,
      'followup1Answer': followup1Answer,
      'followup2': followup2,
      'followup2Answer': followup2Answer,
      'followup3': followup3,
      'followup3Answer': followup3Answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoiceDBRecordDocumentEquality implements Equality<VoiceDBRecord> {
  const VoiceDBRecordDocumentEquality();

  @override
  bool equals(VoiceDBRecord? e1, VoiceDBRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.questionAnswer == e2?.questionAnswer &&
        e1?.followup1 == e2?.followup1 &&
        e1?.followup1Answer == e2?.followup1Answer &&
        e1?.followup2 == e2?.followup2 &&
        e1?.followup2Answer == e2?.followup2Answer &&
        e1?.followup3 == e2?.followup3 &&
        e1?.followup3Answer == e2?.followup3Answer &&
        listEquality.equals(e1?.themes, e2?.themes);
  }

  @override
  int hash(VoiceDBRecord? e) => const ListEquality().hash([
        e?.question,
        e?.questionAnswer,
        e?.followup1,
        e?.followup1Answer,
        e?.followup2,
        e?.followup2Answer,
        e?.followup3,
        e?.followup3Answer,
        e?.themes
      ]);

  @override
  bool isValidKey(Object? o) => o is VoiceDBRecord;
}
