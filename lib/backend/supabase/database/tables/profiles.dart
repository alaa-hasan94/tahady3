import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get imageProfile => getField<String>('image-profile')!;
  set imageProfile(String value) => setField<String>('image-profile', value);

  String get phoneNumber => getField<String>('phone-number')!;
  set phoneNumber(String value) => setField<String>('phone-number', value);

  double get money => getField<double>('money')!;
  set money(double value) => setField<double>('money', value);

  bool get admin => getField<bool>('admin')!;
  set admin(bool value) => setField<bool>('admin', value);

  String get useId => getField<String>('use-id')!;
  set useId(String value) => setField<String>('use-id', value);

  bool? get isTeacher => getField<bool>('is-teacher');
  set isTeacher(bool? value) => setField<bool>('is-teacher', value);
}
