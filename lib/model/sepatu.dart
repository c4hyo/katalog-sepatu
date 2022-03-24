class SepatuModel {
  String? sepatuId;
  String? merk;
  int? harga;
  int? ukuran;
  String? seri;
  String? bahan;
  String? tahunProduksi;
  String? warna;
  String? deskripsi;
  int? stok;
  SepatuModel({
    this.sepatuId,
    this.merk,
    this.harga,
    this.ukuran,
    this.seri,
    this.bahan,
    this.tahunProduksi,
    this.warna,
    this.deskripsi,
    this.stok,
  });
}

class GambarSepatuModel {
  String? id;
  String? sepatuId;
  bool? primary;
  String? urlGambar;
  GambarSepatuModel({
    this.id,
    this.sepatuId,
    this.primary,
    this.urlGambar,
  });
}
//di luar class

List<String> listMerk = [
  "Nike",
  "Specs",
  "Addidas",
  "Puma",
  "Water Jordan",
];
