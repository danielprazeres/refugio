import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txt_nome widget.
  TextEditingController? txtNomeController;
  String? Function(BuildContext, String?)? txtNomeControllerValidator;
  // State field(s) for txt_dt widget.
  TextEditingController? txtDtController;
  final txtDtMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? txtDtControllerValidator;
  // State field(s) for txt_cpf widget.
  TextEditingController? txtCpfController;
  final txtCpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? txtCpfControllerValidator;
  // State field(s) for dd_genero widget.
  String? ddGeneroValue;
  FormFieldController<String>? ddGeneroValueController;
  // Stores action output result for [Custom Action - converteTextInDateTime] action in Button widget.
  DateTime? dataNascimentoAjustada;

  /// Query cache managers for this widget.

  final _buscaUserManager = StreamRequestManager<List<UserProfileRecord>>();
  Stream<List<UserProfileRecord>> buscaUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserProfileRecord>> Function() requestFn,
  }) =>
      _buscaUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBuscaUserCache() => _buscaUserManager.clear();
  void clearBuscaUserCacheKey(String? uniqueKey) =>
      _buscaUserManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNomeController?.dispose();
    txtDtController?.dispose();
    txtCpfController?.dispose();

    /// Dispose query cache managers for this widget.

    clearBuscaUserCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
