import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_catecory_model.dart';
export 'add_catecory_model.dart';

class AddCatecoryWidget extends StatefulWidget {
  const AddCatecoryWidget({super.key});

  @override
  State<AddCatecoryWidget> createState() => _AddCatecoryWidgetState();
}

class _AddCatecoryWidgetState extends State<AddCatecoryWidget> {
  late AddCatecoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCatecoryModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'أضافة مادة',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderRadius: 12.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'اسم المادة',
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
            cursorColor: FlutterFlowTheme.of(context).primary,
            validator: _model.textControllerValidator.asValidator(context),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'اضف صورة للمادة',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading1 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();
                  } finally {
                    _model.isDataUploading1 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }
              },
              child: Container(
                width: 300.0,
                height: 207.0,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?ssl=1',
                          width: 300.0,
                          height: 205.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(191.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.uploadedLocalFile1 != null &&
                        (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false))
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.memory(
                            _model.uploadedLocalFile1.bytes ??
                                Uint8List.fromList([]),
                            width: 300.0,
                            height: 205.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
            child: FFButtonWidget(
              onPressed: () async {
                {
                  setState(() => _model.isDataUploading2 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];
                  var selectedMedia = <SelectedFile>[];
                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles =
                        _model.uploadedLocalFile1.bytes!.isNotEmpty
                            ? [_model.uploadedLocalFile1]
                            : <FFUploadedFile>[];
                    selectedMedia = selectedFilesFromUploadedFiles(
                      selectedUploadedFiles,
                      storageFolderPath: 'category-pics',
                    );
                    downloadUrls = await uploadSupabaseStorageFiles(
                      bucketName: 'uploaded',
                      selectedFiles: selectedMedia,
                    );
                  } finally {
                    _model.isDataUploading2 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl2 = downloadUrls.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }

                _model.courses = await CategoryTable().insert({
                  'name': _model.textController.text,
                  'image': _model.uploadedFileUrl2,
                });
                Navigator.pop(context);

                setState(() {});
              },
              text: 'اضافة المادة',
              icon: Icon(
                Icons.receipt_long,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 48.0,
                padding: EdgeInsets.all(0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 4.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(60.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
