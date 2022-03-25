import 'package:get/get.dart';
import 'package:pos_sepatu/model/transaksi.dart';

import '../model/sepatu.dart';

class HomeController extends GetxController {
  final listSepatu = <SepatuModel>[].obs;
  final listTransaksi = <TransaksiModel>[].obs;
  final keranjang = <ProdukTransaksiModel>[].obs;

  addSepatu(SepatuModel sepatuModel) {
    // fungsi nambah data ke db

    // SOON GAN

    // fungsi add di getx
    listSepatu.add(sepatuModel);
    listSepatu.refresh();
  }

  deleteSepatu(int index) {
    // cek coba

    print(index);
    listSepatu.removeAt(index);
    listSepatu.refresh();
  }

  updateListSepatu(SepatuModel sepatuModel, index) {
    listSepatu[index] = sepatuModel;
    listSepatu.refresh();
  }

  addKeranjang(ProdukTransaksiModel ptm, int index) {
    if (index == -1) {
      keranjang.add(ptm);
      keranjang.refresh();
    } else {
      keranjang[index].qty = keranjang[index].qty! + 1;
      keranjang[index].hargaTotal =
          keranjang[index].hargaAsli! * keranjang[index].qty!;
      keranjang.refresh();
    }
  }

  deleteKeranjang(int index) {
    keranjang.removeAt(index);
    keranjang.refresh();
  }
}
