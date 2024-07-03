import '../database.dart';

class SocialMediaTable extends SupabaseTable<SocialMediaRow> {
  @override
  String get tableName => 'social-media';

  @override
  SocialMediaRow createRow(Map<String, dynamic> data) => SocialMediaRow(data);
}

class SocialMediaRow extends SupabaseDataRow {
  SocialMediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SocialMediaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get telegram => getField<String>('telegram');
  set telegram(String? value) => setField<String>('telegram', value);

  String? get instgram => getField<String>('instgram');
  set instgram(String? value) => setField<String>('instgram', value);

  String? get whatsapp => getField<String>('whatsapp');
  set whatsapp(String? value) => setField<String>('whatsapp', value);

  String? get vider => getField<String>('vider');
  set vider(String? value) => setField<String>('vider', value);

  String? get facebook => getField<String>('facebook');
  set facebook(String? value) => setField<String>('facebook', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  bool? get showCoupon => getField<bool>('show-coupon');
  set showCoupon(bool? value) => setField<bool>('show-coupon', value);

  bool? get epayment => getField<bool>('epayment');
  set epayment(bool? value) => setField<bool>('epayment', value);
}
