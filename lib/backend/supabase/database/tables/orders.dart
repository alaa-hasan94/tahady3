import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get ordered => getField<bool>('ordered');
  set ordered(bool? value) => setField<bool>('ordered', value);

  int? get userId => getField<int>('user-id');
  set userId(int? value) => setField<int>('user-id', value);

  int? get courseId => getField<int>('course-id');
  set courseId(int? value) => setField<int>('course-id', value);

  bool? get courseCompeted => getField<bool>('course-competed');
  set courseCompeted(bool? value) => setField<bool>('course-competed', value);
}
