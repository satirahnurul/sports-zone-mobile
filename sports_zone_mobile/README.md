# Tugas 7

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

= **Widget tree** adalah struktur hierarki berbentuk pohon yang menggambarkan susunan widget dalam aplikasi Flutter untuk membentuk antarmuka pengguna (UI). Setiap widget dapat memiliki widget lain sebagai child (anak), dan widget tersebut menjadi parent (induk) bagi child-nya. Hubungan parent-child ini bekerja secara nested, di mana parent widget bertanggung jawab untuk mengatur dan menampilkan child widget-nya. Misalnya, jika ada widget Column yang berisi beberapa Text widget, maka Column adalah parent dan Text adalah child. Parent widget menentukan bagaimana child-nya ditampilkan, seperti alignment, spacing, dan constraints lainnya. Informasi mengalir dari parent ke child melalui constructor parameters, sementara child dapat berkomunikasi dengan parent melalui callbacks.

Contoh struktur yg menggambarkan hubungan Parent-Child:
- Scaffold (induk) -> AppBar (anak) dan body (anak)
- Column (induk) -> Text (anak) dan ElevatedButton (anak)
- Container (induk) -> Row (anak)

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

= Berikut adalah semua widget yang digunakan dalam proyek Sports Zone beserta fungsinya:
1. **MaterialApp**: Widget root yang menyediakan konfigurasi Material Design untuk aplikasi, termasuk theme, routes, dan title.
2. **Scaffold**: Menyediakan struktur layout dasar Material Design dengan AppBar, body, dan elemen UI lainnya.
3. **AppBar**: Menampilkan bar di bagian atas layar yang berisi judul aplikasi dan styling.
4. **Text**: Menampilkan teks dengan styling tertentu seperti font weight, size, dan color.
5. **SingleChildScrollView**: Membuat area yang dapat di-scroll ketika konten melebihi ukuran layar.
6. **Padding**: Memberikan jarak/padding di sekitar child widget-nya.
7. **Column**: Menyusun widget child secara vertikal dari atas ke bawah.
8. **Row**: Menyusun widget child secara horizontal dari kiri ke kanan.
9. **Center**: Menempatkan child widget-nya di tengah area yang tersedia.
10. **GridView.count**: Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap.
11. **Card**: Membuat kotak dengan elevasi/bayangan untuk menampilkan informasi.
12. **Container**: Widget serbaguna untuk styling dan positioning, dapat mengatur padding, margin, decoration, dll.
13. **Material**: Menyediakan visual Material Design seperti elevation, border radius, dan color.
14. **InkWell**: Memberikan efek ripple saat widget ditekan dan menangani gesture tap.
15. **Icon**: Menampilkan icon dari Material Icons library.
16. **SizedBox**: Memberikan spacing atau ukuran tetap untuk layout.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

= **MaterialApp** adalah widget utama yang mengimplementasikan Material Design untuk aplikasi Flutter. Widget ini sering digunakan sebagai widget root karena menyediakan berbagai konfigurasi penting seperti:
- **Theme**: Mengatur skema warna, typography, dan styling global aplikasi
- **Routes & Navigation**: Mengelola perpindahan antar halaman
- **Title**: Judul aplikasi yang muncul di task manager
- **Localization**: Mendukung multi-bahasa
- **Debug Banner**: Menampilkan banner debug di mode development

MaterialApp membungkus aplikasi dengan berbagai widget internal yang diperlukan seperti Navigator, Theme, dan MediaQuery, sehingga widget-widget child-nya bisa mengakses informasi dan fungsi-fungsi tersebut. Tanpa MaterialApp, kita harus mengkonfigurasi semua hal tersebut secara manual. Widget MaterialApp membantu kita untuk menciptakan aplikasi dengan tampilan yang konsisten di berbagai platform (responsif).

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

= **StatelessWidget** adalah widget yang bersifat immutable (tidak berubah). Setelah widget ini dibuat, tampilannya tidak akan berubah kecuali parent widget-nya rebuild. StatelessWidget cocok digunakan untuk UI yang statis, seperti text label, icon, atau layout yang tidak memerlukan perubahan data. Contohnya: halaman welcome yang hanya menampilkan informasi tetap.

**StatefulWidget** adalah widget yang bersifat mutable (dapat berubah). Widget ini memiliki state internal yang dapat berubah selama runtime, dan ketika state berubah, UI akan otomatis di-rebuild untuk mencerminkan perubahan tersebut. StatefulWidget cocok untuk UI yang interaktif atau menampilkan data dinamis, seperti form input, counter, checkbox, atau list yang bisa di-update.

Kita mneggunakan **StatelessWidget** jika UI tidak perlu berubah berdasarkan interaksi user atau perubahan data. Sedangkan kita menggunakan **StatefulWidget** jika UI perlu merespons perubahan data, input user, atau animasi.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

= **BuildContext** adalah objek yang merepresentasikan lokasi widget dalam widget tree. Setiap widget memiliki BuildContext sendiri yang diberikan oleh Flutter framework. BuildContext penting karena menyediakan akses ke:
- **Theme data**: Mengambil warna, typography dari theme aplikasi
- **MediaQuery**: Mendapatkan informasi ukuran layar, orientation
- **Navigator**: Untuk navigasi antar halaman
- **Inherited Widgets**: Mengakses data yang dibagikan dari parent widget

Di metode build, BuildContext digunakan untuk mengakses informasi kontekstual dari widget tree. Misalnya:
di file dart :
Theme.of(context).colorScheme.primary  // Mengambil warna primary dari theme
ScaffoldMessenger.of(context).showSnackBar()  // Menampilkan SnackBar

BuildContext memungkinkan widget untuk "berkomunikasi" dengan widget lain di atasnya dalam tree tanpa harus mem-passing data secara eksplisit melalui constructor.

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

= **Hot Reload** adalah fitur Flutter yang memungkinkan developer untuk melihat perubahan code secara instant tanpa kehilangan state aplikasi. Ketika melakukan hot reload, Flutter akan inject perubahan code yang baru ke dalam Dart VM yang sedang berjalan, kemudian rebuild widget tree dengan state yang tetap dipertahankan. Proses ini sangat cepat, biasanya hanya memakan waktu kurang dari satu detik. Hot reload sangat berguna untuk iterasi cepat saat mengembangkan UI atau memperbaiki bug kecil, karena kita bisa langsung melihat hasilnya tanpa perlu mengulangi interaksi yang sudah dilakukan (misalnya login, navigasi ke halaman tertentu, atau input data di form). Namun, hot reload memiliki keterbatasan: perubahan pada metode main(), inisialisasi global variables, atau perubahan pada enum tidak akan ter-reload dengan sempurna.

**Hot Restart**, di sisi lain, adalah proses yang lebih fundamental. Ketika melakukan hot restart, Flutter akan menghentikan aplikasi sepenuhnya dan memulai ulang dari awal, menjalankan metode main() lagi, dan semua state aplikasi akan di-reset ke kondisi awal. Proses ini memakan waktu lebih lama dibanding hot reload (sekitar 2-5 detik), namun memastikan bahwa semua perubahan code ter-apply dengan benar, termasuk perubahan pada inisialisasi, dependency injection, atau perubahan struktural besar. Hot restart diperlukan ketika hot reload tidak cukup, misalnya setelah menambahkan package baru, mengubah native code (Android/iOS), atau ketika terjadi error yang membuat hot reload gagal.

Perbedaan utama keduanya terletak pada scope perubahan dan preservation of state: hot reload mempertahankan state dan hanya update widget tree, sementara hot restart menghapus semua state dan memulai aplikasi dari nol. Dalam praktik development sehari-hari, developer biasanya menggunakan hot reload untuk perubahan UI kecil dan hot restart ketika melakukan perubahan besar atau mengalami masalah dengan hot reload. Kombinasi kedua fitur ini membuat Flutter development cycle menjadi sangat efisien dan produktif.