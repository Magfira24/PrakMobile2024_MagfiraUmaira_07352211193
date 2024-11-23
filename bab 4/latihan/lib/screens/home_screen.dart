import 'package:flutter/material.dart';
import 'package:latihan_bab4_mobile/screens/detail_screen.dart';
import 'edit_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

// Data berita statis
  final List<Map<String, String>> news = [
    {
      'imageUrl': 'assets/images/the.jpg', // Gambar dari assets
      'title': 'Kegunaan Moisturizer',
      'author': 'Magfira',
      'description':
          'Saat ini moisturizer menjadi salah satu produk skincare yang wajib digunakan. Sebab, moisturizer berfungsi untuk menghidrasi kulit agar lembab dan menjaga kelembaban tersebut agar tidak mudah hilang, dengan cara menahan kandungan air di dalam lapisan kulit.',
      'time': '4h ago',
    },
    {
      'imageUrl': 'assets/images/labo.jpg', // Gambar dari assets
      'title': "Kegunaan Facial Wash",
      'author': 'Magfira',
      'description':
          'Facial wash adalah sabun pembersih wajah yang berfungsi untuk mengangkat kotoran, debu, dan minyak dari kulit wajah. Beberapa kegunaan facial wash lainnya adalah: Mengurangi produksi minyak berlebih yang dapat menyebabkan jerawat, Memberikan efek segar pada wajah, Mencegah terjadinya infeksi mata, Meregenerasi kulit, Membantu skincare routine bekerja dengan lebih baik.',
      'time': '14m ago',
    },
    {
      'imageUrl': 'assets/images/skin.png', // Gambar dari assets
      'title': "Kegunaan Sunscreen",
      'author': 'Magfira',
      'description':
          'Sunscreen membantu menjaga kelembapan kulit dengan menghalangi dehidrasi yang disebabkan oleh paparan sinar matahari. Manfaat sunscreen sangat penting dalam menjaga kesehatan kulit. Fungsi sunscreen untuk wajah tidak hanya melindungi dari sinar matahari, tetapi juga membantu mempertahankan kelembapan alami kulit.',
      'time': '14m ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Halaman-halaman yang akan ditampilkan di IndexedStack
    final List<Widget> pages = [
      // Halaman Home dengan daftar berita menggunakan ListView.builder
      ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: news[index]['title'].toString(),
                      description: news[index]['description'].toString(),
                      imageUrl: news[index]['imageUrl'].toString(),
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Add border radius here
                      child: Image.asset(
                        news[index]['imageUrl']!, // Mengambil gambar dari assets
                        fit: BoxFit.cover, // Menyesuaikan gambar dengan area yang tersedia
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news[index]['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        news[index]['author']! + " • " + news[index]['time']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      Center(child: Text('Explore Page')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'HMTI',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'News',
              style: TextStyle(
                  color: Color.fromARGB(255, 242, 24, 177),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Pengaturan', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 24, 173),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ...pages, EditProfileScreen(), // Halaman Profil
          EditProfileScreen(), // Halaman Profil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color.fromARGB(255, 242, 24, 177),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

