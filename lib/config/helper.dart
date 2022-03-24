import 'dart:math';

import 'package:intl/intl.dart';

generateCode(int panjang) {
  // digunakan untuk mengenerate string,
  //contoh penggunaan pada generate code
  const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(panjang, (_) {
    return _chars.codeUnitAt(_rnd.nextInt(_chars.length));
  }));
}

String rupiah(int harga) {
  return NumberFormat.simpleCurrency(locale: "id_ID").format(harga);
}
