import '../database.dart';

class CouponCodeTable extends SupabaseTable<CouponCodeRow> {
  @override
  String get tableName => 'coupon-code';

  @override
  CouponCodeRow createRow(Map<String, dynamic> data) => CouponCodeRow(data);
}

class CouponCodeRow extends SupabaseDataRow {
  CouponCodeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CouponCodeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  bool? get used => getField<bool>('used');
  set used(bool? value) => setField<bool>('used', value);

  double? get value => getField<double>('value');
  set value(double? value) => setField<double>('value', value);
}
