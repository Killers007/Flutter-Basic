import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

class ProductEntities {
  final String id;
  final String nama;
  final int harga;
  final String gambar;
  int qty;

  ProductEntities({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    this.qty = 0,
  });

  factory ProductEntities.fromJson(Map<String, dynamic> json) {
    return ProductEntities(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      gambar: json['gambar'],
    );
  }

  getHargaRupiah() {
    return currencyFormatter.format(harga);
  }
}

List<ProductEntities> productEntitiessFromJson(
    List<Map<String, dynamic>> jsonData) {
  // Use map to convert each map in the list to a ProductEntities
  return jsonData.map((json) => ProductEntities.fromJson(json)).toList();
}
