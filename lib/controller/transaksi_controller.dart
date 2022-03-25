import 'package:get/get.dart';
import 'package:pos_sepatu/model/transaksi.dart';

class TransaksiController extends GetxController {
  final keranjang = <ProdukTransaksiModel>[].obs;

  tambahKeranjang(ProdukTransaksiModel produkTransaksiModel) {
    keranjang.add(produkTransaksiModel);
    keranjang.refresh();
  }

  hapusKeranjang(int index) {
    keranjang.removeAt(index);
    keranjang.refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
