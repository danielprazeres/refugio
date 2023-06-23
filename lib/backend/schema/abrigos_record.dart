import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AbrigosRecord extends FirestoreRecord {
  AbrigosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('abrigos');

  static Stream<AbrigosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AbrigosRecord.fromSnapshot(s));

  static Future<AbrigosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AbrigosRecord.fromSnapshot(s));

  static AbrigosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AbrigosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AbrigosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AbrigosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AbrigosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AbrigosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAbrigosRecordData({
  String? name,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}
