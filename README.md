# Aplikasi Buku (Frontend - Flutter)

- **Nama:** Leksa Andana Oktaviansa  
- **No. Absen:** 29  
- **Kelas:** XII RPL 1

---

## Deskripsi Proyek

Ini adalah aplikasi mobile Flutter untuk Proyek *Aplikasi Buku*. Aplikasi ini menampilkan antarmuka pengguna yang terhubung dengan backend API untuk autentikasi dan manajemen data buku.

📦 **Backend Repository:** [Aplikasi Buku - Backend (CodeIgniter 4)](https://github.com/Leksastropsil/AplikasiBuku-CI4.git)  


---

## Fitur Utama

1. **Splash Screen**  
   Menampilkan logo dan nama aplikasi sebelum masuk ke halaman login.

2. **Login Page**  
   Pengguna dapat masuk menggunakan email dan password yang terdaftar.  
   - Tombol menuju halaman registrasi.  
   - Validasi input sederhana.

3. **Register Page**  
   Form pendaftaran akun baru dengan field: nama, email, dan password.  
   Setelah berhasil, pengguna akan diarahkan kembali ke halaman login.

4. **Dashboard (Beranda Buku)**  
   - Menampilkan daftar buku dalam bentuk *card grid*.  
   - Setiap card berisi **cover**, **judul**, dan **author**.  
   - Di pojok kanan bawah terdapat **Floating Action Button (FAB)** berikon `+` untuk menambahkan buku baru.  
   - Klik pada card buku akan membuka halaman **Detail Buku**.

5. **Halaman Detail Buku**  
   - Menampilkan detail lengkap buku:  
     - Cover (kiri)  
     - Title dan Author (kanan)  
     - Rating (jika ada)  
     - Deskripsi di bawahnya  
   - Dua tombol aksi di bagian bawah:  
     - **Edit Buku**  
     - **Hapus Buku**

6. **Halaman Create / Edit Buku**  
   Form untuk menambahkan atau memperbarui buku berisi:  
   - Title  
   - Author  
   - URL Cover (opsional)  
   - Deskripsi  
   - Rating (opsional)

   Data dikirim ke endpoint backend sesuai operasi (`POST` atau `PUT`).

---

## Struktur Folder Utama

```
lib/
 ├── main.dart
 ├── screens/
 │    ├── splash_screen.dart
 │    ├── login_screen.dart
 │    ├── register_screen.dart
 │    ├── buku_list_page.dart
 │    ├── buku_detail_screen.dart
 │    └── buku_form_screen.dart
 ├── models/
 │    └── book.dart
 ├── services/
      └── api_service.dart
```

---

## API Integrasi

Base URL untuk semua endpoint adalah:  
- `http://localhost:8080` *(jika dijalankan di browser)*  
- `http://10.0.2.2:8080` *(jika dijalankan di Android Emulator)*

Aplikasi ini berkomunikasi dengan backend melalui endpoint:
- `POST /api/auth/login`
- `POST /api/auth/registrasi`
- `GET /api/books`
- `POST /api/books`
- `PUT /api/books/{id}`
- `DELETE /api/books/{id}`

---

## Preview Aplikasi

<img width="217" height="465" alt="image" src="https://github.com/user-attachments/assets/8571d506-cbf9-43d1-b327-58d4dc453327" />
<img width="215" height="466" alt="image" src="https://github.com/user-attachments/assets/a64cae05-7450-47a3-9a86-4bb422aef08a" />
<img width="215" height="463" alt="image" src="https://github.com/user-attachments/assets/3392af51-240b-42de-bb52-b9a56017ae6c" />
<img width="214" height="461" alt="image" src="https://github.com/user-attachments/assets/cb71813d-a7a7-4587-b2b4-24a011e4f185" />
<img width="213" height="462" alt="image" src="https://github.com/user-attachments/assets/1f70700d-53a8-4aa2-b507-acc28bd9b7a7" />
<img width="214" height="464" alt="image" src="https://github.com/user-attachments/assets/97920851-2caf-44b0-93bb-b0c0a9ff6729" />
