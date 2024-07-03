import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cart =
          prefs.getStringList('ff_cart')?.map((path) => path.ref).toList() ??
              _cart;
    });
    _safeInit(() {
      _cartSum = prefs.getDouble('ff_cartSum') ?? _cartSum;
    });
    _safeInit(() {
      _saveforlater = prefs
              .getStringList('ff_saveforlater')
              ?.map((path) => path.ref)
              .toList() ??
          _saveforlater;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  double _cartSum = 0.0;
  double get cartSum => _cartSum;
  set cartSum(double value) {
    _cartSum = value;
    prefs.setDouble('ff_cartSum', value);
  }

  List<DocumentReference> _saveforlater = [];
  List<DocumentReference> get saveforlater => _saveforlater;
  set saveforlater(List<DocumentReference> value) {
    _saveforlater = value;
    prefs.setStringList('ff_saveforlater', value.map((x) => x.path).toList());
  }

  void addToSaveforlater(DocumentReference value) {
    saveforlater.add(value);
    prefs.setStringList(
        'ff_saveforlater', _saveforlater.map((x) => x.path).toList());
  }

  void removeFromSaveforlater(DocumentReference value) {
    saveforlater.remove(value);
    prefs.setStringList(
        'ff_saveforlater', _saveforlater.map((x) => x.path).toList());
  }

  void removeAtIndexFromSaveforlater(int index) {
    saveforlater.removeAt(index);
    prefs.setStringList(
        'ff_saveforlater', _saveforlater.map((x) => x.path).toList());
  }

  void updateSaveforlaterAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    saveforlater[index] = updateFn(_saveforlater[index]);
    prefs.setStringList(
        'ff_saveforlater', _saveforlater.map((x) => x.path).toList());
  }

  void insertAtIndexInSaveforlater(int index, DocumentReference value) {
    saveforlater.insert(index, value);
    prefs.setStringList(
        'ff_saveforlater', _saveforlater.map((x) => x.path).toList());
  }

  bool _discussion = false;
  bool get discussion => _discussion;
  set discussion(bool value) {
    _discussion = value;
  }

  bool _coursecontent = false;
  bool get coursecontent => _coursecontent;
  set coursecontent(bool value) {
    _coursecontent = value;
  }

  bool _uploadphoto = false;
  bool get uploadphoto => _uploadphoto;
  set uploadphoto(bool value) {
    _uploadphoto = value;
  }

  bool _activesearch = false;
  bool get activesearch => _activesearch;
  set activesearch(bool value) {
    _activesearch = value;
  }

  List<DocumentReference> _emptyLesssons = [];
  List<DocumentReference> get emptyLesssons => _emptyLesssons;
  set emptyLesssons(List<DocumentReference> value) {
    _emptyLesssons = value;
  }

  void addToEmptyLesssons(DocumentReference value) {
    emptyLesssons.add(value);
  }

  void removeFromEmptyLesssons(DocumentReference value) {
    emptyLesssons.remove(value);
  }

  void removeAtIndexFromEmptyLesssons(int index) {
    emptyLesssons.removeAt(index);
  }

  void updateEmptyLesssonsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    emptyLesssons[index] = updateFn(_emptyLesssons[index]);
  }

  void insertAtIndexInEmptyLesssons(int index, DocumentReference value) {
    emptyLesssons.insert(index, value);
  }

  bool _updatepassword = false;
  bool get updatepassword => _updatepassword;
  set updatepassword(bool value) {
    _updatepassword = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
