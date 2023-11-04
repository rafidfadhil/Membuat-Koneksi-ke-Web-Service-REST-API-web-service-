import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/data_model.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService =
      ApiService('https://jsonplaceholder.typicode.com/posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas 7 REST API'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Tindakan saat tombol pengaturan ditekan
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: apiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> data = snapshot.data ?? [];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                DataModel item = DataModel.fromJson(data[index]);
                return InkWell(
                  onTap: () {
                    // Tindakan saat item di-klik
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            item.body,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Tindakan saat tombol ditekan
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[800],
                                  onPrimary: Colors.white,
                                ),
                                child: Text(
                                  'Lihat Detail',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Tindakan saat tombol favorit ditekan
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan saat tombol ditekan
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[800],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Tindakan saat tombol ditekan
              },
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                // Tindakan saat tombol ditekan
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                // Navigasi ke Profil Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              icon: Icon(Icons.person),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
