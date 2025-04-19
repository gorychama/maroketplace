import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final defaultFont = const TextStyle(fontFamily: 'Poppins');

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.person_outline, 'label': 'Account Information'},
    {'icon': Icons.dashboard_outlined, 'label': 'My Ads'},
    {'icon': Icons.language, 'label': 'Language'},
    {'icon': Icons.subscriptions_outlined, 'label': 'Subscription Packages'},
    {'icon': Icons.settings_outlined, 'label': 'Settings'},
    {'icon': Icons.logout, 'label': 'Logout', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile', style: defaultFont.copyWith(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 12,
                    child: Icon(Icons.edit, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text('Kazi Mahbub', style: defaultFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  leading: Icon(item['icon'], color: item['color'] ?? Colors.black54),
                  title: Text(item['label'], style: defaultFont.copyWith(color: item['color'] ?? Colors.black87)),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
     
    );
  }
}
