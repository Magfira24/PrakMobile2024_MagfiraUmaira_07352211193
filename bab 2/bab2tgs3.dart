/// Enum untuk peran anggota
enum Peran { AnggotaBiasa, AnggotaVIP }

/// Kelas abstrak untuk mendefinisikan pengguna perpustakaan
abstract class Pengguna {
  String nama;
  int umur;

  Pengguna(this.nama, this.umur);

  void info();
}

/// Kelas Buku yang mewakili buku dalam perpustakaan
class Buku {
  String judul;
  String penulis;
  late int tahunTerbit;
  late double harga;

  // Konstruktor dengan positional argument
  Buku(this.judul, this.penulis, this.tahunTerbit, this.harga);

  @override
  String toString() => "$judul oleh $penulis (Tahun: $tahunTerbit, Harga: \$$harga)";
}

/// Kelas Anggota yang mewakili anggota perpustakaan
class Anggota extends Pengguna {
  Peran peran;  // Positional argument untuk peran anggota
  List<Buku> koleksiBuku = [];

  // Konstruktor dengan named argument untuk umur
  Anggota(String nama, {required this.peran, required int umur}) : super(nama, umur);

  // Metode untuk meminjam buku
  void pinjamBuku(Buku buku) {
    koleksiBuku.add(buku);
    print("$nama meminjam buku: ${buku.toString()}");  // Menampilkan informasi detail buku
  }

  @override
  void info() {
    print("Nama Anggota: $nama, Umur: $umur, Peran: $peran");
  }
}

/// Mixin untuk menambah pengalaman membaca pada anggota VIP
mixin PengalamanMembaca on Anggota {
  void tambahPengalaman() {
    print("$nama mendapatkan pengalaman membaca yang lebih baik sebagai anggota VIP!");
  }
}

/// Kelas khusus AnggotaVIP yang menggabungkan Anggota dan mixin PengalamanMembaca
class AnggotaVIP extends Anggota with PengalamanMembaca {
  AnggotaVIP(String nama, {required int umur})
      : super(nama, peran: Peran.AnggotaVIP, umur: umur);
}

/// Fungsi utama untuk menjalankan sistem perpustakaan
void main() {
  // Membuat buku
  var buku1 = Buku('Dart untuk Pemula', 'John Doe', 2020, 45.0);
  var buku2 = Buku('Flutter Lanjutan', 'Jane Smith', 2021, 60.0);

  // Membuat anggota biasa
  var anggota1 = Anggota('Alice', peran: Peran.AnggotaBiasa, umur: 25);
  anggota1.pinjamBuku(buku1);
  anggota1.info();
  
  print("\n");

  // Membuat anggota VIP menggunakan kelas AnggotaVIP
  var anggotaVIP = AnggotaVIP('Bob', umur: 30);
  anggotaVIP.pinjamBuku(buku2);
  anggotaVIP.info();
  anggotaVIP.tambahPengalaman();

  print("\n");
}
