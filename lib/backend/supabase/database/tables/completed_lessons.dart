import '../database.dart';

class CompletedLessonsTable extends SupabaseTable<CompletedLessonsRow> {
  @override
  String get tableName => 'completed-lessons';

  @override
  CompletedLessonsRow createRow(Map<String, dynamic> data) =>
      CompletedLessonsRow(data);
}

class CompletedLessonsRow extends SupabaseDataRow {
  CompletedLessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompletedLessonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get checked => getField<bool>('checked');
  set checked(bool? value) => setField<bool>('checked', value);

  int? get lessonId => getField<int>('lesson-id');
  set lessonId(int? value) => setField<int>('lesson-id', value);

  int? get orderId => getField<int>('order-id');
  set orderId(int? value) => setField<int>('order-id', value);
}
