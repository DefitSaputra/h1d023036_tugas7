
---

# 📘 **README — H1D023036_Tugas7**

## 🧾 **Identitas**

**Nama:** Defit Bagus Saputra
**NIM:** H1D023036
**Shift:** Shift C (Awal) / Shift F (Baru)
**Mata Kuliah:** Praktikum Pemrograman Mobile

---

# 📱 **Deskripsi Aplikasi**

Aplikasi ini mengimplementasikan:

* Login dan auto login
* Named routes
* Drawer (side menu)
* Local storage menggunakan SharedPreferences
* Fitur Notes (tambah, edit, hapus)
* Halaman Profile
* Halaman About
* Logout

Aplikasi berjalan dengan **gaya bawaan Flutter (default Material style)**.
Alur kerja aplikasi tersusun rapi dan setiap halaman memiliki tanggung jawab yang jelas.

---

# 📁 **Struktur Folder**

```
lib/
 ├─ main.dart
 ├─ screens/
 │   ├─ login_page.dart
 │   ├─ home_page.dart
 │   ├─ add_note_page.dart
 │   ├─ profile_page.dart
 │   └─ about_page.dart
 └─ widgets/
    └─ main_drawer.dart
```

---

# 🖼️ **Screenshot Aplikasi**

Tambahkan screenshot asli aplikasi ke folder `screenshots/`.
Berikut daftar gambar yang diperlukan:

1. `screenshots/login.jpeg — Tampilan Login
2. `screenshots/home.jpeg` — Tampilan Home (notes list)
3. `screenshots/add_note.jpeg` — Halaman Add Note
4. `screenshots/edit_note.jpeg` — Mode Edit Note
5. `screenshots/profile.jpeg` — Halaman Profile
6. `screenshots/about.jpeg` — Halaman About
7. `screenshots/sidebar.jpeg` — Side Bar Drawer Terbuka


---

# 🧠 **Penjelasan Bagian Kode**


---

## 🔷 **1. main.dart**

File ini berfungsi sebagai titik awal aplikasi.
Tugas utamanya:

* Mengatur tema Material bawaan
* Mendefinisikan named routes
* Menentukan halaman awal (LoginPage)
* Menyediakan akses global ke route melalui konstanta

Kode rute dideklarasikan seperti ini:

```dart
static const String routeLogin = '/';
static const String routeHome = '/home';
static const String routeAddNote = '/add';
static const String routeProfile = '/profile';
static const String routeAbout = '/about';
```

Aplikasi memulai dari `routeLogin` untuk menampilkan halaman login.

---

## 🔷 **2. login_page.dart**

Halaman ini memuat:

* Input username
* Input password
* Tombol login
* Validasi login
* Sistem auto login

Ketika pengguna sukses login, aplikasi menyimpan username:

```dart
prefs.setString('username', u);
```

Aplikasi langsung menavigasi ke Home menggunakan named route:

```dart
Navigator.pushReplacementNamed(context, MyApp.routeHome);
```

---

## 🔷 **3. home_page.dart**

Home Page menampilkan daftar catatan yang tersimpan di `SharedPreferences`.

Tugas halaman ini:

* Mengambil username yang sedang login
* Mengambil daftar notes
* Menampilkan catatan dalam ListView
* Menghapus catatan
* Menavigasi ke Add Note Page

Pengambilan notes:

```dart
notes = prefs.getStringList('notes') ?? [];
```

---

## 🔷 **4. add_note_page.dart**

Halaman ini menyediakan dua fungsi:

* Membuat catatan baru
* Mengedit catatan yang sudah ada

Aplikasi menerima parameter `arguments` ketika dalam mode edit:

```dart
final args = ModalRoute.of(context)?.settings.arguments;
```

Penyimpanan notes:

```dart
prefs.setStringList('notes', list);
```

---

## 🔷 **5. profile_page.dart**

Profile Page memberikan ruang bagi pengguna untuk menyimpan informasi pribadi.
Data yang disimpan:

* `profile_name`
* `profile_bio`

Penyimpanan data profile:

```dart
prefs.setString('profile_name', _nameCtrl.text.trim());
prefs.setString('profile_bio', _bioCtrl.text.trim());
```

Data tersebut ditampilkan kembali saat halaman dibuka.

---

## 🔷 **6. about_page.dart**

Halaman ini memuat informasi tentang aplikasi dan identitas mahasiswa.
Kontennya statis dan ditampilkan menggunakan widget teks sederhana.

---

## 🔷 **7. main_drawer.dart**

Drawer berfungsi sebagai menu navigasi.
Isi menu:

* Home
* Add Note
* Profile
* About
* Logout

Drawer menggunakan header berbasis `UserAccountsDrawerHeader`.

Ketika Logout ditekan:

```dart
prefs.remove('username');
Navigator.pushNamedAndRemoveUntil(context, MyApp.routeLogin, (_) => false);
```

Perintah ini menghapus session login dan kembali ke halaman login.

---

# 🚀 **Cara Menjalankan**

1. Jalankan perintah:

   ```
   flutter pub get
   ```
2. Jalankan aplikasi:

   ```
   flutter run
   ```

---
