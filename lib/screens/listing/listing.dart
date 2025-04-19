import 'package:flutter/material.dart';

class ListingScreen extends StatelessWidget {
  final defaultFont = const TextStyle(fontFamily: 'Poppins');

  final List<Map<String, dynamic>> vehicles = [
    {
      'image': 'assets/car1.jpg',
      'title': 'Car Name, Model, Year and Details here',
      'price': '10,540 MAD',
      'time': '1h Ago',
      'featured': true
    },
    {
      'image': 'assets/car2.jpg',
      'title': 'Car Name, Model, Year and Details here',
      'price': '61,22,000 MAD',
      'time': '2h Ago',
      'featured': false
    },
    {
      'image': 'assets/bike1.jpg',
      'title': 'Bike Name, Model, Year and Details here',
      'price': '12,120 MAD',
      'time': '6h Ago',
      'featured': false
    },
    {
      'image': 'assets/car3.jpg',
      'title': 'Car Name, Model, Year and Details here',
      'price': '90 MAD',
      'time': '9h Ago',
      'featured': true
    },
    {
      'image': 'assets/car4.jpg',
      'title': 'Car Name, Model, Year and Details here',
      'price': '12,120 MAD',
      'time': '6h Ago',
      'featured': false
    },
    {
      'image': 'assets/bike2.jpg',
      'title': 'Bike Name, Model, Year and Details here',
      'price': '90 MAD',
      'time': '9h Ago',
      'featured': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: RichText(
          text: TextSpan(
            text: 'Vehicles ',
            style: defaultFont.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '(2234 Results)',
                style: defaultFont.copyWith(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: vehicles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final vehicle = vehicles[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          vehicle['image'],
                          height: 110,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (vehicle['featured'])
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text('Featured', style: defaultFont.copyWith(color: Colors.white, fontSize: 10)),
                          ),
                        ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(vehicle['time'], style: defaultFont.copyWith(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: defaultFont.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                            color: Colors.black.withOpacity(0.85),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          vehicle['price'],
                          style: defaultFont.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
