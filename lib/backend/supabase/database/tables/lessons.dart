import '../database.dart';

class LessonsTable extends SupabaseTable<LessonsRow> {
  @override
  String get tableName => 'lessons';

  @override
  LessonsRow createRow(Map<String, dynamic> data) => LessonsRow(data);
}

class LessonsRow extends SupabaseDataRow {
  LessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get youtube => getField<String>('youtube');
  set youtube(String? value) => setField<String>('youtube', value);

  int? get courseId => getField<int>('course-id');
  set courseId(int? value) => setField<int>('course-id', value);

  double? get lessonNumber => getField<double>('lesson-number');
  set lessonNumber(double? value) => setField<double>('lesson-number', value);

  String? get videoid => getField<String>('videoid');
  set videoid(String? value) => setField<String>('videoid', value);
}
