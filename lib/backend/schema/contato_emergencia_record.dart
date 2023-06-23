import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContatoEmergenciaRecord extends FirestoreRecord {
  ContatoEmergenciaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "parentesco" field.
  String? _parentesco;
  String get parentesco => _parentesco ?? '';
  bool hasParentesco() => _parentesco != null;

  // "contato_vinculo_usuario" field.
  String? _contatoVinculoUsuario;
  String get contatoVinculoUsuario => _contatoVinculoUsuario ?? '';
  bool hasContatoVinculoUsuario() => _contatoVinculoUsuario != null;

  // "bit_cadastro" field.
  bool? _bitCadastro;
  bool get bitCadastro => _bitCadastro ?? false;
  bool hasBitCadastro() => _bitCadastro != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _parentesco = snapshotData['parentesco'] as String?;
    _contatoVinculoUsuario = snapshotData['contato_vinculo_usuario'] as String?;
    _bitCadastro = snapshotData['bit_cadastro'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contato_emergencia');

  static Stream<ContatoEmergenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContatoEmergenciaRecord.fromSnapshot(s));

  static Future<ContatoEmergenciaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ContatoEmergenciaRecord.fromSnapshot(s));

  static ContatoEmergenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContatoEmergenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContatoEmergenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContatoEmergenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContatoEmergenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContatoEmergenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContatoEmergenciaRecordData({
  String? nome,
  String? telefone,
  String? parentesco,
  String? contatoVinculoUsuario,
  bool? bitCadastro,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'telefone': telefone,
      'parentesco': parentesco,
      'contato_vinculo_usuario': contatoVinculoUsuario,
      'bit_cadastro': bitCadastro,
    }.withoutNulls,
  );

  return firestoreData;
}
