import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileRecord extends FirestoreRecord {
  UserProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "dt_nasc" field.
  DateTime? _dtNasc;
  DateTime? get dtNasc => _dtNasc;
  bool hasDtNasc() => _dtNasc != null;

  // "user_profile" field.
  String? _userProfile;
  String get userProfile => _userProfile ?? '';
  bool hasUserProfile() => _userProfile != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _dtNasc = snapshotData['dt_nasc'] as DateTime?;
    _userProfile = snapshotData['user_profile'] as String?;
    _genero = snapshotData['genero'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_profile');

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfileRecord.fromSnapshot(s));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfileRecord.fromSnapshot(s));

  static UserProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfileRecordData({
  String? name,
  String? cpf,
  DateTime? dtNasc,
  String? userProfile,
  String? genero,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'CPF': cpf,
      'dt_nasc': dtNasc,
      'user_profile': userProfile,
      'genero': genero,
    }.withoutNulls,
  );

  return firestoreData;
}
