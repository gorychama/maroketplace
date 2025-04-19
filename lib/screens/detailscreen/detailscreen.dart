import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final defaultFont = const TextStyle(fontFamily: 'Poppins');
  int _currentImageIndex = 0;

  final List<String> imageList = [
    'assets/14.jpg',
    'assets/12.jpg',
    'assets/11.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: imageList.length,
                    onPageChanged: (index) => setState(() => _currentImageIndex = index),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        child: Image.asset(
                          imageList[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imageList.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentImageIndex == index ? 12 : 8,
                        height: _currentImageIndex == index ? 12 : 8,
                        decoration: BoxDecoration(
                          color: _currentImageIndex == index ? Colors.white : Colors.white54,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 40,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('1h Ago', style: defaultFont.copyWith(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // spaceBetween: true,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [    
                    SizedBox(width: MediaQuery.of(context).size.width * 0.5,child:
                                      Text('Car Name, Model, Year and Deatils here', style: defaultFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                                                        Text('10,540 MAD', style: defaultFont.copyWith(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)),
],), 
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text('dakhla 30000 ,MA.',
                            style: defaultFont.copyWith(color: Colors.grey[700])),
                      ),

                    ],
                  ),
                                        SizedBox(width: 10),

                       Text('House 1/A, Hnagar Sunamganj Sadar, Sunamganj, Post Code 3000.',
                            style: defaultFont.copyWith(color: Colors.black, fontFamily: 'Poppins')),
                      
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kazi Mahbub', style: defaultFont.copyWith(fontWeight: FontWeight.w600)),
                              Text('Owner', style: defaultFont.copyWith(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.phone, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.chat, color: Colors.blue),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildDetailRow('Make', 'Hyundai', defaultFont),
                  _buildDetailRow('Model', 'Model Name', defaultFont),
                  _buildDetailRow('Year', '2021', defaultFont),
                  _buildDetailRow('Fuel Type', 'Petrol', defaultFont),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, TextStyle font) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: font.copyWith(color: Colors.grey[700])),
          Text(value, style: font.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
