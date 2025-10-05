# Aplikasi Buku (Frontend - Flutter)

- **Nama:** Leksa Andana Oktaviansa  
- **No. Absen:** 29  
- **Kelas:** XII RPL 1

---

## Deskripsi Proyek

Frontend ini adalah aplikasi mobile Flutter untuk Proyek *Aplikasi Buku*. Aplikasi ini menampilkan antarmuka pengguna yang terhubung dengan backend API untuk autentikasi dan manajemen data buku.

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

   Contoh tampilan:

   ![Screenshot Dashboard](screenshot_dashboard.png)

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

Aplikasi ini berkomunikasi dengan backend melalui endpoint:
- `POST /api/auth/login`
- `POST /api/auth/registrasi`
- `GET /api/books`
- `POST /api/books`
- `PUT /api/books/{id}`
- `DELETE /api/books/{id}`

---

<img width="217" height="465" alt="image" src="https://github.com/user-attachments/assets/8571d506-cbf9-43d1-b327-58d4dc453327" />
<img width="236" height="478" alt="image" src="https://github.com/user-attachments/assets/0ffefd68-58d3-4cb7-841a-f90a8aa59433" />
<img width="215" height="466" alt="image" src="https://github.com/user-attachments/assets/a64cae05-7450-47a3-9a86-4bb422aef08a" />



