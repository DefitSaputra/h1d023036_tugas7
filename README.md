

-----

# 📘 **Tugas 7 — Praktikum Pemrograman Mobile**

## 👤 **Identitas Mahasiswa**

| Atribut | Detail |
| :--- | :--- |
| **Nama** | Defit Bagus Saputra |
| **NIM** | H1D023036 |
| **Kelas/Shift** | Shift C (Awal) / Shift F (Baru) |
| **Mata Kuliah** | Praktikum Pemrograman Mobile |

-----

## 📱 **Deskripsi Aplikasi**

Aplikasi ini adalah implementasi sederhana dari manajemen catatan (*Notes App*) yang dibangun menggunakan **Flutter** dengan gaya **Material Design**. Aplikasi ini dirancang dengan alur kerja yang rapi dan pemisahan tanggung jawab kode yang jelas.

### **Fitur Utama:**

  * ✅ **Autentikasi:** Login user dan fitur *Auto Login* (sesi tersimpan).
  * ✅ **Navigasi:** Menggunakan *Named Routes* dan *Drawer* (Side Menu).
  * ✅ **Penyimpanan Lokal:** Menggunakan `SharedPreferences` untuk menyimpan data notes dan profil.
  * ✅ **Manajemen Notes:** Tambah, Edit, dan Hapus catatan.
  * ✅ **Profil Pengguna:** Halaman profil yang datanya dapat diubah dan disimpan.
  * ✅ **Informasi Aplikasi:** Halaman *About*.

-----

## 📁 **Struktur Folder**

Susunan file dalam proyek ini diatur agar mudah dipelihara:

```text
lib/
 ├── main.dart                # Entry point & Route configuration
 ├── screens/
 │    ├── login_page.dart     # Halaman Login
 │    ├── home_page.dart      # Halaman Utama (List Notes)
 │    ├── add_note_page.dart  # Halaman Tambah/Edit Note
 │    ├── profile_page.dart   # Halaman Profil User
 │    └── about_page.dart     # Halaman Informasi Aplikasi
 └── widgets/
      └── main_drawer.dart    # Widget Side Menu (Drawer)
```

-----

## 🖼️ **Galeri Aplikasi**

Berikut adalah tampilan antarmuka aplikasi:

| Halaman | Deskripsi |
| :--- | :--- |
| **Login** | `screenshots/login.jpeg` |
| **Home** | `screenshots/home.jpeg` |
| **Add Note** | `screenshots/add_note.jpeg` |
| **Edit Note** | `screenshots/edit_note.jpeg` |
| **Profile** | `screenshots/profile.jpeg` |
| **About** | `screenshots/about.jpeg` |
| **Sidebar** | `screenshots/sidebar.jpeg` |

> *Catatan: Pastikan file gambar telah tersedia di dalam folder `screenshots/` sesuai nama di atas.*

-----

## 🧠 **Penjelasan Kode & Logika**

### **1. Konfigurasi Utama (`main.dart`)**

Berfungsi sebagai titik awal aplikasi. File ini mengatur tema Material, mendaftarkan *Named Routes*, dan menentukan halaman awal.

**Route Definition:**

```dart
static const String routeLogin = '/';
static const String routeHome = '/home';
static const String routeAddNote = '/add';
static const String routeProfile = '/profile';
static const String routeAbout = '/about';
```

### **2. Halaman Login (`login_page.dart`)**

Menangani input username/password dan validasi. Jika login berhasil, username disimpan ke `SharedPreferences` untuk sesi *auto-login*.

**Penyimpanan Sesi:**

```dart
prefs.setString('username', u);
Navigator.pushReplacementNamed(context, MyApp.routeHome);
```

### **3. Halaman Utama (`home_page.dart`)**

Menampilkan daftar catatan yang diambil dari penyimpanan lokal.

**Logika Load Data:**

```dart
// Mengambil list notes atau array kosong jika null
notes = prefs.getStringList('notes') ?? [];
```

### **4. Tambah & Edit Catatan (`add_note_page.dart`)**

Halaman ini dinamis; bisa digunakan untuk membuat catatan baru atau mengedit yang sudah ada berdasarkan *arguments* yang dikirim.

**Menangkap Argumen (Mode Edit):**

```dart
final args = ModalRoute.of(context)?.settings.arguments;
```

**Menyimpan Data:**

```dart
prefs.setStringList('notes', list);
```

### **5. Halaman Profil (`profile_page.dart`)**

Memungkinkan pengguna mengelola data personal (Nama dan Bio). Data ini persisten (tetap ada meski aplikasi ditutup).

**Simpan Profil:**

```dart
prefs.setString('profile_name', _nameCtrl.text.trim());
prefs.setString('profile_bio', _bioCtrl.text.trim());
```

### **6. Navigasi Drawer (`main_drawer.dart`)**

Menu navigasi samping yang berisi tautan ke semua halaman utama dan fitur Logout.

**Logika Logout:**

```dart
// Menghapus sesi username & kembali ke login
prefs.remove('username');
Navigator.pushNamedAndRemoveUntil(context, MyApp.routeLogin, (_) => false);
```

-----

## 🚀 **Cara Menjalankan Aplikasi**

Ikuti langkah berikut untuk menjalankan proyek ini di emulator atau perangkat fisik:

1.  **Install Dependencies:**
    Pastikan berada di direktori project, lalu jalankan:

    ```bash
    flutter pub get
    ```

2.  **Run App:**
    Jalankan aplikasi dengan perintah:

    ```bash
    flutter run
    ```

-----
