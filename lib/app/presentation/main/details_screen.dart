import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    Key? key,
    required this.deviceName,
    required this.deviceUUIDS,
  }) : super(key: key);
  String deviceName;
  String deviceUUIDS;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff004385),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/logos/logo1.png',
              ),
            ),
          ),
          body: Column(
            children: [
            Expanded(
              //  height: 680,
              child: TabBarView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          color: const Color(0xff0078EF),
                          child: Center(
                            child: Text(
                              '$deviceName - $deviceUUIDS',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Desired',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 30),
                              Text(
                                'Actual',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: Center(
                      child: Text(
                        'Errors',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    child: Center(
                      child: Text(
                        'Setups',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            // the tab bar with two items
            SizedBox(
              height: 50,
              child: TabBar(
                indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                tabs: [
                  Tab(
                    icon: Text('Outputs',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  Tab(
                    icon: Text('Errors',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  Tab(
                    icon: Text('Setups',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            // create widgets for each tab bar here
          ]),
        ));
  }
}
