import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CouponCodeRecord extends FirestoreRecord {
  CouponCodeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "used" field.
  bool? _used;
  bool get used => _used ?? false;
  bool hasUsed() => _used != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _used = snapshotData['used'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('couponCode');

  static Stream<CouponCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponCodeRecord.fromSnapshot(s));

  static Future<CouponCodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponCodeRecord.fromSnapshot(s));

  static CouponCodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponCodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponCodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponCodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponCodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponCodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponCodeRecordData({
  String? code,
  bool? used,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'used': used,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponCodeRecordDocumentEquality implements Equality<CouponCodeRecord> {
  const CouponCodeRecordDocumentEquality();

  @override
  bool equals(CouponCodeRecord? e1, CouponCodeRecord? e2) {
    return e1?.code == e2?.code && e1?.used == e2?.used;
  }

  @override
  int hash(CouponCodeRecord? e) =>
      const ListEquality().hash([e?.code, e?.used]);

  @override
  bool isValidKey(Object? o) => o is CouponCodeRecord;
}
