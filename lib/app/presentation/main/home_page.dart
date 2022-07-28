import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import 'details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
      "visive - smart - csc",
    ];
    List<String> uuids = [
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
      "4654441",
    ];
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
    String? name;
    List<ScanResult> scanResults = [];
    Future _scanForDevices() async {
      // Start scanning
      flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
      var subscription = flutterBlue.scanResults.listen((results) {
        for (ScanResult r in results) {
          setState(() {
            scanResults.add(r);
          });
          name = r.device.name;
          print(
              '////////////////////////////////////////////////////////////////////////${scanResults.length}');
        }
      });
      print(subscription);
// Stop scanning
      flutterBlue.stopScan();
    }

    bool _isLoading = false;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 230,
            color: const Color(0xff004385),
            child: Image.asset(
              'assets/logos/logo2.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              _scanForDevices();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: const Color(0xff0078EF),
              child: const Center(
                child: Text(
                  'Find Local Devices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBluePlus.instance.scanResults,
            initialData: [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!.map((r) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              Get.to(
                                DetailsScreen(
                                  deviceName: items[index],
                                  deviceUUIDS: uuids[index],
                                ),
                              );
                              print(uuids[index]);
                            },
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
                              ),
                            ),
                            title: Text(
                              snapshot.data![index].device.id.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('No Devices Found'),
                  );
                }
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
