class TransaksiModel {
  String? transaksiId;
  String? tanggal;
  String? bulan;
  String? createdAt;
  int? totalHarga;
  int? pembayaran;
  int? kembalian;
  bool? lunas;
  List<ProdukTransaksiModel>? produkTransaksi;
  TransaksiModel({
    this.transaksiId,
    this.tanggal,
    this.bulan,
    this.createdAt,
    this.totalHarga,
    this.pembayaran,
    this.kembalian,
    this.lunas,
    this.produkTransaksi,
  });
}

class ProdukTransaksiModel {
  String? produkId;
  int? qty;
  int? hargaAsli;
  int? hargaTotal;
  ProdukTransaksiModel({
    this.produkId,
    this.qty,
    this.hargaAsli,
    this.hargaTotal,
  });
}
