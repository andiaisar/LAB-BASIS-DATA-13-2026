# LAB-BASIS-DATA-13-2026 Repository

Selamat datang di repositori LAB-BASIS-DATA-13-2026! Repositori ini adalah tempat pengumpulan tugas praktikum untuk mata kuliah Praktikum Basis Data 2026. Berikut adalah panduan singkat untuk mengumpulkan tugas di repositori ini.

## Alur pengumpulan tugas ke repositori ini:

1. **Fork** repositori ini

2. **Clone** repositori hasil **fork** Anda

   ```sh
   git clone [https://github.com/YOUR_USERNAME/LAB-BASIS-DATA-13-2026.git](https://github.com/YOUR_USERNAME/LAB-BASIS-DATA-13-2026.git)

```

3. Setelah Anda clone, masuk ke folder hasil clone tersebut lalu buat branch dengan nama NIM Anda
```sh
cd LAB-BASIS-DATA-13-2026
git branch NIM_ANDA
git checkout NIM_ANDA

```


4. Setelah Anda pindah ke **branch** yang telah Anda buat, buat sebuah folder dengan nama **NIM** Anda dan masuk ke folder tersebut.
```sh
mkdir NIM_ANDA
cd NIM_ANDA

```


5. Di dalam folder tersebut, buat sebuah folder dengan nama **Praktikum-n**, **n** = praktikum keberapa
```sh
mkdir "Praktikum-n"
cd "Praktikum-n"

CATATAN: n DI SINI ADALAH NOMOR PRAKTIKUM KE BERAPA
CONTOH: Praktikum-1

```


6. Semua *file* untuk tugas praktikum ke-**n**, disimpan ke dalam folder **Praktikum-n**
7. Setiap kali melakukan perubahan, lakukan proses **commit** dengan pesan yang deskriptif
```sh
git add . # perintah ini memilih seluruh file sekaligus
git status # untuk mengecek apakah file sudah ter-add atau tidak.
# Jika file yang ingin di add sudah berwarna hijau lanjut ke commit.
# Jika file yang ingin di add berwarna merah lakukan add terlebih dahulu

git commit -m "pesan mengenai penambahan atau perubahan apa yang anda lakukan"

```


8. Setelah asistensi dan tugas Anda disetujui, **push** seluruh *file* jawaban yang telah Anda buat
```sh
# pastikan proses commit telah selesai terhadap setiap file
git push origin NIM_ANDA

```


9. Masuk ke akun GitHub Anda, dan buka repo yang telah Anda **fork** dan **clone**. Lihat perubahan yang terjadi pada repo tersebut dan pastikan bahwa tugas yang telah Anda **push** sesuai dan berada pada repo tersebut.
10. Pilih menu **Pull request** dan lakukan **pull request** pada tugas praktikum Anda.

## Tips Tambahan

* Pastikan untuk memberi nama yang deskriptif pada pesan commit tugas.
* Gunakan pesan commit yang jelas agar mudah dimengerti olehmu suatu saat nanti.
* Terima kasih sudah mengerjakan tugas ygy!

### -- LAB-BASIS-DATA-13-2026 --

```

```
