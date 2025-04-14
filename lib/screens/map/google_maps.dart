import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shop {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Shop({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}



class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {

  final List<Shop> shops = [
    Shop(
      name: "Patel General store",
      address: "near lpu law gate, face3, Phagwara, Punjab 144411",
      latitude: 31.25666837251882,
      longitude:  75.69184778161134,
    ),
    Shop(
      name: "B.B. superstore",
      address: "near green valley, LPU, Phagwara, Punjab 144401",
      latitude: 31.25293147033417,
      longitude: 75.69752099325366,
    ),
    Shop(
      name: "B.B. MART",
      address: "Law Gate Rd, near apna chai wala lpu, Jalandhar, Punjab 144411",
          latitude: 31.253100685173393,
      longitude: 75.69750269896258,
    ),
    Shop(
      name: "Freshmart",
      address: "Shop No 39, Shree Nand Enclave, Near, SN Chowk, Maheru, Phagwara, Punjab 144402",
          latitude: 31.24859787472209,
      longitude: 75.69547653373174,
    ),
    Shop(
      name: "OWL STORE",
      address: "Green Valley Colony, Maheru Road, LPU, Law Gate Rd, Punjab 144411",
          latitude: 31.253247435585852,
      longitude: 75.69818934445178,
    ),
    Shop(
      name: "Lucky Grocery Store",
      address: "6MXW+WFV, Chaheru Khusropur Link Rd, Khajurla, Punjab 144411",
          latitude: 31.250477483070092,
      longitude: 75.69597920428338,
    ),
    Shop(
      name: "Uni Mall",
      address: "Lovely Professional University, Phagwara, Punjab 144411",
          latitude: 31.25618599491785,
      longitude: 75.70555760160627,
    ),
  ];

  late List<Shop> randomShops;

  @override
  void initState() {
    super.initState();
    randomShops = _getRandomShops(4);
  }

  List<Shop> _getRandomShops(int count) {
    final random = Random();
    final shuffled = List<Shop>.from(shops)..shuffle(random);
    return shuffled.take(count).toList();
  }

  Future<void> openMap(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch map';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Nearby Shops'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                randomShops = _getRandomShops(4);
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: randomShops.length,
        itemBuilder: (context, index) {
          final shop = randomShops[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.store, color: Colors.green),
              title: Text(shop.name),
              subtitle: Text(shop.address),
              trailing: const Icon(Icons.map_outlined),
              onTap: () => openMap(shop.latitude, shop.longitude),
            ),
          );
        },
      ),
    );
  }
}

