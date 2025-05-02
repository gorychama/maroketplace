import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final PopupController _popupController = PopupController();

  final List<Map<String, dynamic>> vehicles = [
    {'image': 'assets/car1.jpg', 'title': 'Car Model A', 'price': '10,540 MAD', 'description': 'Excellent car.', 'location': LatLng(33.5731, -7.5898)},
    {'image': 'assets/car2.jpg', 'title': 'Car Model B', 'price': '61,22,000 MAD', 'description': 'Luxury car.', 'location': LatLng(33.5861, -7.6111)},
    {'image': 'assets/bike1.jpg', 'title': 'Bike Model A', 'price': '12,120 MAD', 'description': 'Fast bike.', 'location': LatLng(33.5690, -7.5800)},
    {'image': 'assets/car3.jpg', 'title': 'Car Model C', 'price': '90 MAD', 'description': 'Used car.', 'location': LatLng(33.5800, -7.6000)},
    {'image': 'assets/car4.jpg', 'title': 'Car Model D', 'price': '12,120 MAD', 'description': 'New model.', 'location': LatLng(33.5750, -7.6200)},
    {'image': 'assets/bike2.jpg', 'title': 'Bike Model B', 'price': '90 MAD', 'description': 'Sport bike.', 'location': LatLng(33.5780, -7.6050)},
  ];

  late List<Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = vehicles.map((vehicle) => Marker(
      point: vehicle['location'],
      width: 40,
      height: 40,
      child: Icon(Icons.location_on, size: 40, color: Colors.red),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PopupScope(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(33.5731, -7.5898),
                  initialZoom: 13,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  PopupMarkerLayer(
                    options: PopupMarkerLayerOptions(
                      markers: markers,
                      popupController: _popupController,
                      popupDisplayOptions: PopupDisplayOptions(
                        builder: (BuildContext context, Marker marker) {
                          final index = markers.indexOf(marker);
                          final vehicle = vehicles[index];
                          return CustomVehiclePopup(vehicle: vehicle);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.all(12.0),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomVehiclePopup extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const CustomVehiclePopup({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              vehicle['image'],
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vehicle['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                SizedBox(height: 4),
                Text(vehicle['description'],
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                SizedBox(height: 4),
                Text('Price: ${vehicle['price']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
