import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'searchcourse_widget.dart' show SearchcourseWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchcourseModel extends FlutterFlowModel<SearchcourseWidget> {
  ///  Local state fields for this page.

  String categoryName = 'all';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
  }
}
