import '../database.dart';

class TeachersTable extends SupabaseTable<TeachersRow> {
  @override
  String get tableName => 'teachers';

  @override
  TeachersRow createRow(Map<String, dynamic> data) => TeachersRow(data);
}

class TeachersRow extends SupabaseDataRow {
  TeachersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeachersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get discription => getField<String>('discription');
  set discription(String? value) => setField<String>('discription', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get profileId => getField<int>('profileId');
  set profileId(int? value) => setField<int>('profileId', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get whatsapp => getField<String>('whatsapp');
  set whatsapp(String? value) => setField<String>('whatsapp', value);

  bool? get onwhatsapp => getField<bool>('onwhatsapp');
  set onwhatsapp(bool? value) => setField<bool>('onwhatsapp', value);

  String? get telegram => getField<String>('telegram');
  set telegram(String? value) => setField<String>('telegram', value);

  bool? get ontelegram => getField<bool>('ontelegram');
  set ontelegram(bool? value) => setField<bool>('ontelegram', value);

  String? get facebook => getField<String>('facebook');
  set facebook(String? value) => setField<String>('facebook', value);

  bool? get onfacebook => getField<bool>('onfacebook');
  set onfacebook(bool? value) => setField<bool>('onfacebook', value);

  String? get instagram => getField<String>('instagram');
  set instagram(String? value) => setField<String>('instagram', value);

  bool? get oninstagram => getField<bool>('oninstagram');
  set oninstagram(bool? value) => setField<bool>('oninstagram', value);

  String? get viber => getField<String>('viber');
  set viber(String? value) => setField<String>('viber', value);

  bool? get onviber => getField<bool>('onviber');
  set onviber(bool? value) => setField<bool>('onviber', value);
}
