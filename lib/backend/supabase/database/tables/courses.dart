import '../database.dart';

class CoursesTable extends SupabaseTable<CoursesRow> {
  @override
  String get tableName => 'courses';

  @override
  CoursesRow createRow(Map<String, dynamic> data) => CoursesRow(data);
}

class CoursesRow extends SupabaseDataRow {
  CoursesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoursesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get courseTitle => getField<String>('course-title');
  set courseTitle(String? value) => setField<String>('course-title', value);

  String? get courseDiscription => getField<String>('course-discription');
  set courseDiscription(String? value) =>
      setField<String>('course-discription', value);

  String? get courseImage => getField<String>('course-image');
  set courseImage(String? value) => setField<String>('course-image', value);

  double? get coursePrice => getField<double>('course-price');
  set coursePrice(double? value) => setField<double>('course-price', value);

  String? get courseTeacher => getField<String>('course-teacher');
  set courseTeacher(String? value) => setField<String>('course-teacher', value);

  String? get teacherEmail => getField<String>('teacher-email');
  set teacherEmail(String? value) => setField<String>('teacher-email', value);

  String? get demoVideo => getField<String>('demo-video');
  set demoVideo(String? value) => setField<String>('demo-video', value);

  int? get category => getField<int>('category');
  set category(int? value) => setField<int>('category', value);

  int? get teacherId => getField<int>('teacherId');
  set teacherId(int? value) => setField<int>('teacherId', value);

  String? get categoryName => getField<String>('category-name');
  set categoryName(String? value) => setField<String>('category-name', value);
}
