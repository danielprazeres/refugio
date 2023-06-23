import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'contato_emergencia_model.dart';
export 'contato_emergencia_model.dart';

class ContatoEmergenciaWidget extends StatefulWidget {
  const ContatoEmergenciaWidget({
    Key? key,
    required this.uid,
    bool? bitCadastro,
  })  : this.bitCadastro = bitCadastro ?? false,
        super(key: key);

  final String? uid;
  final bool bitCadastro;

  @override
  _ContatoEmergenciaWidgetState createState() =>
      _ContatoEmergenciaWidgetState();
}

class _ContatoEmergenciaWidgetState extends State<ContatoEmergenciaWidget> {
  late ContatoEmergenciaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContatoEmergenciaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ContatoEmergenciaRecord>>(
      stream: queryContatoEmergenciaRecord(
        queryBuilder: (contatoEmergenciaRecord) => contatoEmergenciaRecord
            .where('contato_vinculo_usuario', isEqualTo: currentUserUid),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).slateBlue,
                ),
              ),
            ),
          );
        }
        List<ContatoEmergenciaRecord>
            contatoEmergenciaContatoEmergenciaRecordList = snapshot.data!;
        final contatoEmergenciaContatoEmergenciaRecord =
            contatoEmergenciaContatoEmergenciaRecordList.isNotEmpty
                ? contatoEmergenciaContatoEmergenciaRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Text(
              'Contato de emergência',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineSmallFamily,
                    fontSize: 18.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineSmallFamily),
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: Text(
                    'Contatos de emergência são pessoas que você confia em casos de urgência',
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.txtNomeController ??=
                        TextEditingController(
                      text: contatoEmergenciaContatoEmergenciaRecord!
                                      .contatoVinculoUsuario !=
                                  null &&
                              contatoEmergenciaContatoEmergenciaRecord!
                                      .contatoVinculoUsuario !=
                                  ''
                          ? contatoEmergenciaContatoEmergenciaRecord!.nome
                          : ' ',
                    ),
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.txtNomeControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.txtphoneController ??=
                        TextEditingController(
                      text: contatoEmergenciaContatoEmergenciaRecord!
                                      .contatoVinculoUsuario !=
                                  null &&
                              contatoEmergenciaContatoEmergenciaRecord!
                                      .contatoVinculoUsuario !=
                                  ''
                          ? contatoEmergenciaContatoEmergenciaRecord!.telefone
                          : ' ',
                    ),
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: TextInputType.phone,
                    validator:
                        _model.txtphoneControllerValidator.asValidator(context),
                    inputFormatters: [_model.txtphoneMask],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.ddParentescoValueController ??=
                        FormFieldController<String>(
                      _model.ddParentescoValue ??=
                          contatoEmergenciaContatoEmergenciaRecord!
                                          .contatoVinculoUsuario !=
                                      null &&
                                  contatoEmergenciaContatoEmergenciaRecord!
                                          .contatoVinculoUsuario !=
                                      ''
                              ? contatoEmergenciaContatoEmergenciaRecord!
                                  .parentesco
                              : ' ',
                    ),
                    options: [
                      'Cônjuje',
                      'Pai',
                      'Mãe',
                      'Irmão',
                      'Irmã',
                      'Amigo'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.ddParentescoValue = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    hintText: 'Parentesco',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (contatoEmergenciaContatoEmergenciaRecord!
                                .bitCadastro ==
                            true) {
                          await contatoEmergenciaContatoEmergenciaRecord!
                              .reference
                              .update(createContatoEmergenciaRecordData(
                            nome: _model.txtNomeController.text,
                            telefone: _model.txtphoneController.text,
                            parentesco: _model.ddParentescoValue,
                            bitCadastro: false,
                          ));
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Sucesso!'),
                                content: Text(
                                    'Contato de Emergencia cadastrado com sucesso!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await contatoEmergenciaContatoEmergenciaRecord!
                              .reference
                              .update(createContatoEmergenciaRecordData(
                            nome: _model.txtNomeController.text,
                            telefone: _model.txtphoneController.text,
                            parentesco: _model.ddParentescoValue,
                          ));
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Sucesso!'),
                                content: Text(
                                    'Contato de Emergencia atualizado com sucesso!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        context.pushNamed(
                          'home',
                          queryParameters: {
                            'uid': serializeParam(
                              currentUserUid,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Salvar',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).slateBlue,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
