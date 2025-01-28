import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsDBRecord extends FirestoreRecord {
  QuestionsDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mainQuestion" field.
  String? _mainQuestion;
  String get mainQuestion => _mainQuestion ?? '';
  bool hasMainQuestion() => _mainQuestion != null;

  // "mainQuestionNL" field.
  String? _mainQuestionNL;
  String get mainQuestionNL => _mainQuestionNL ?? '';
  bool hasMainQuestionNL() => _mainQuestionNL != null;

  // "probingQuestions" field.
  List<String>? _probingQuestions;
  List<String> get probingQuestions => _probingQuestions ?? const [];
  bool hasProbingQuestions() => _probingQuestions != null;

  // "probQuestionsNL" field.
  List<String>? _probQuestionsNL;
  List<String> get probQuestionsNL => _probQuestionsNL ?? const [];
  bool hasProbQuestionsNL() => _probQuestionsNL != null;

  void _initializeFields() {
    _mainQuestion = snapshotData['mainQuestion'] as String?;
    _mainQuestionNL = snapshotData['mainQuestionNL'] as String?;
    _probingQuestions = getDataList(snapshotData['probingQuestions']);
    _probQuestionsNL = getDataList(snapshotData['probQuestionsNL']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QuestionsDB');

  static Stream<QuestionsDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsDBRecord.fromSnapshot(s));

  static Future<QuestionsDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsDBRecord.fromSnapshot(s));

  static QuestionsDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsDBRecordData({
  String? mainQuestion,
  String? mainQuestionNL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mainQuestion': mainQuestion,
      'mainQuestionNL': mainQuestionNL,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsDBRecordDocumentEquality implements Equality<QuestionsDBRecord> {
  const QuestionsDBRecordDocumentEquality();

  @override
  bool equals(QuestionsDBRecord? e1, QuestionsDBRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mainQuestion == e2?.mainQuestion &&
        e1?.mainQuestionNL == e2?.mainQuestionNL &&
        listEquality.equals(e1?.probingQuestions, e2?.probingQuestions) &&
        listEquality.equals(e1?.probQuestionsNL, e2?.probQuestionsNL);
  }

  @override
  int hash(QuestionsDBRecord? e) => const ListEquality().hash([
        e?.mainQuestion,
        e?.mainQuestionNL,
        e?.probingQuestions,
        e?.probQuestionsNL
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionsDBRecord;
}
