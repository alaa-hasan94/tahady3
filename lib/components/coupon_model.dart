import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'coupon_widget.dart' show CouponWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CouponModel extends FlutterFlowModel<CouponWidget> {
  ///  Local state fields for this component.

  List<CouponCodeRow> couponStat = [];
  void addToCouponStat(CouponCodeRow item) => couponStat.add(item);
  void removeFromCouponStat(CouponCodeRow item) => couponStat.remove(item);
  void removeAtIndexFromCouponStat(int index) => couponStat.removeAt(index);
  void insertAtIndexInCouponStat(int index, CouponCodeRow item) =>
      couponStat.insert(index, item);
  void updateCouponStatAtIndex(int index, Function(CouponCodeRow) updateFn) =>
      couponStat[index] = updateFn(couponStat[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CouponCodeRow>? usedCoupons;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
