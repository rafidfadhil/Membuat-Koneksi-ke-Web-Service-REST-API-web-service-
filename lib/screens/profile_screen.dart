import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://jagofoto.com/uploads/pose-foto-keren-untuk-wanita-berhijab.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joko siswanto',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Jokosiswanto@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildInfoRow(Icons.location_on, 'Alamat', 'Jl. Telkom No. 123'),
              buildInfoRow(Icons.phone, 'Nomor Telepon', '+6281234567890'),
              buildInfoRow(Icons.cake, 'Tanggal Lahir', '12 Mei 1990'),
              buildInfoRow(Icons.person, 'Jenis Kelamin', 'Perempuan'),
              buildInfoRow(Icons.favorite, 'Hobi', 'Membaca, Memasak'),
              buildInfoRow(
                  Icons.school, 'Pendidikan Terakhir', 'Sarjana Komputer'),
              buildInfoRow(Icons.work, 'Riwayat Pekerjaan',
                  'Pengembang Flutter di Perusahaan XYZ'),
              SizedBox(height: 20),
              Text(
                'Deskripsi Diri Singkat',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Seorang pengembang Flutter yang suka dengan tantangan baru.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Tindakan saat tombol edit ditekan
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                child: Text('Edit Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
