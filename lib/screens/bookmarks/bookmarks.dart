import 'package:flutter/material.dart';
import 'package:maroketplace/screens/detailscreen/detailscreen.dart';

class BookmarksScreen extends StatelessWidget {
  final defaultFont = const TextStyle(fontFamily: 'Poppins');

  final List<Map<String, String>> items = [
    {
      'title': 'House Name, SQ Fit and ...',
      'address': 'House 1/A, Hnahar, Sunamganj Sadar,Sun...',
      'price': '21,32,000 MAD',
      'image': 'assets/11.jpg'
    },
    {
      'title': 'Car Name, Model, Year & ...',
      'address': 'House 1/A, Hnahar, Sunamganj Sadar,Sun...',
      'price': '16,120 MAD',
      'image': 'assets/12.jpg'
    },
    {
      'title': 'Car Name, Model, Year & ...',
      'address': 'House 1/A, Hnahar, Sunamganj Sadar,Sun...',
      'price': '15,190 MAD',
      'image': 'assets/14.jpg'
    },
    {
      'title': 'Bike Name, Model, Year & ...',
      'address': 'House 1/A, Hnahar, Sunamganj Sadar,Sun...',
      'price': '10,161 MAD',
      'image': 'assets/13.jpg'
    },
    {
      'title': 'Bike Name, Model, Year & ...',
      'address': 'House 1/A, Hnahar, Sunamganj Sadar,Sun...',
      'price': '11,724 MAD',
      'image': 'assets/14.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white
,      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Bookmarks', style: defaultFont.copyWith(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return 
          
          InkWell(
            onTap: () {
              // Navigate to detail screen
  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen()
                ),
              );
            },child:
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item['image']!,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                
//                 Padding(           
//                    padding: const EdgeInsets.all(10),
// child:
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title']!, style: defaultFont.copyWith(fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(item['address']!, style: defaultFont.copyWith(fontSize: 12), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(item['price']!, style: defaultFont.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                // )
                ),
              ],
            ),
          )
          ); 
        
         },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    
    );
  }
}