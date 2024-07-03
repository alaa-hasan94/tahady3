import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'students_widget.dart' show StudentsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentsModel extends FlutterFlowModel<StudentsWidget> {
  ///  Local state fields for this page.

  List<OrdersRow> orders = [];
  void addToOrders(OrdersRow item) => orders.add(item);
  void removeFromOrders(OrdersRow item) => orders.remove(item);
  void removeAtIndexFromOrders(int index) => orders.removeAt(index);
  void insertAtIndexInOrders(int index, OrdersRow item) =>
      orders.insert(index, item);
  void updateOrdersAtIndex(int index, Function(OrdersRow) updateFn) =>
      orders[index] = updateFn(orders[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in students widget.
  List<OrdersRow>? ordersRow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
