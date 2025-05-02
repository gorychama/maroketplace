import 'package:flutter/material.dart';
import 'package:maroketplace/screens/bookmarks/bookmarks.dart';
import 'package:maroketplace/screens/profile/profile.dart';

class ClassifiedHomeScreen extends StatefulWidget {
  const ClassifiedHomeScreen({Key? key}) : super(key: key);

  @override
  State<ClassifiedHomeScreen> createState() => _ClassifiedHomeScreenState();
}

class _ClassifiedHomeScreenState extends State<ClassifiedHomeScreen> {
  int selectedCategoryIndex = 0;
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.apartment, 'label': 'Property'},
    {'icon': Icons.directions_car, 'label': 'Vehicles'},
    {'icon': Icons.smartphone, 'label': 'Mobile'},
    {'icon': Icons.computer, 'label': 'Computer'},
  ];

  @override
  Widget build(BuildContext context) {
    final defaultFont = const TextStyle(fontFamily: 'Poppins');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.green),
        title: Text('USA', style: defaultFont.copyWith(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
           IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen()
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category', style: defaultFont.copyWith(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {
  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarksScreen()
                ),
              );
                }, child: Text('See All', style: defaultFont)),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: _buildCategoryIcon(
                      categories[index]['icon'],
                      categories[index]['label'],
                      selectedCategoryIndex == index,
                      defaultFont,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            _buildSection('Property', [
              _buildCard('Property Name, Address & SQ Fit D...', '7h Ago', '21,32,000 MAD', true, 'assets/11.jpg', defaultFont),
              _buildCard('Property Name, Address & SQ Fit D...', '9h Ago', '12,12,123 MAD', false, 'assets/12.jpg', defaultFont),
              _buildCard('Property Name, Address & SQ Fit D...', '7h Ago', '21,32,000 MAD', true, 'assets/14.jpg', defaultFont),
              _buildCard('Property Name, Address & SQ Fit D...', '9h Ago', '12,12,123 MAD', false, 'assets/13.jpg', defaultFont),
            ]),
            SizedBox(height: 10),
            _buildSection('Vehicles', [
              _buildCard('Vehicle Name, Address', '4h Ago', '1,32,000 MAD', true, 'assets/13.jpg', defaultFont),
              _buildCard('Bike Name, Address', '2h Ago', '82,000 MAD', false, 'assets/14.jpg', defaultFont),
              _buildCard('Bike Name, Address', '2h Ago', '82,000 MAD', false, 'assets/14.jpg', defaultFont),
            ]),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.add),
      // ),
  
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label, bool selected, TextStyle font) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: selected ? Colors.blue : Colors.grey[200],
            child: Icon(icon, color: selected ? Colors.white : Colors.black),
          ),
          SizedBox(height: 5),
          Text(label, style: font.copyWith(fontSize: 12 , fontFamily: 'Poppins', ),)
        ],
      ),
    );
  }

  Widget _buildCard(String title, String timeAgo, String price, bool featured, String image, TextStyle font) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
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
                  image,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              if (featured)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('Featured', style: font.copyWith(color: Colors.white, fontSize: 10)),
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
                  child: Text(timeAgo, style: font.copyWith(color: Colors.white, fontSize: 10)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: font),
                SizedBox(height: 4),
                Text(price, style: font.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
            TextButton(onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarksScreen()
                ),
              );

            }, child: Text('See All', style: TextStyle(fontFamily: 'Poppins'))),
          ],
        ),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cards,
          ),
        ),
      ],
    );
  }
}
