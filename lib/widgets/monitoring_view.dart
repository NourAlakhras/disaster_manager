import 'package:flutter/material.dart';
import 'package:flutter_3/models/robot.dart';
import 'package:gap/gap.dart'; 

class MonitoringView extends StatefulWidget {
  final Map<String, dynamic> mqttData;
  final Robot robot;

  const MonitoringView({
    Key? key,
    required this.mqttData,
    required this.robot,
  }) : super(key: key);

  @override
  State<MonitoringView> createState() => _MonitoringViewState();
}

class _MonitoringViewState extends State<MonitoringView> {
  // Define a map to associate each key with its respective icon
  final Map<String, IconData> iconMap = {
    'Location': Icons.location_on,
    'Operating Status': Icons.directions_run,
    'Battery Status': Icons.battery_full,
    'Temperature': Icons.thermostat,
    'Humidity': Icons.water_drop,
    'Gas Concentration': Icons.air,
    'Air Quality': Icons.waves,
    'Smoke Detection': Icons.smoke_free,
    'Earthquake Detection': Icons.public,
    'Radiation Level': Icons.radar,
    'Sound Level': Icons.volume_up,
  };

  // Define a list of keys to ensure all keys are displayed
  final List<String> allKeys = [
    'Location',
    'Operating Status',
    'Battery Status',
    'Temperature',
    'Humidity',
    'Gas Concentration',
    'Air Quality',
    'Smoke Detection',
    'Earthquake Detection',
    'Radiation Level',
    'Sound Level',
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: allKeys.length,
      itemBuilder: (context, index) {
        String key = allKeys[index];
        dynamic value = widget.mqttData.containsKey(key)
            ? widget.mqttData[key]
            : 'No value';
        IconData icon =
            iconMap[key] ?? Icons.info; // Use a default icon if not found

        if (index == 0) {
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff293038),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  key,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Container(
                  width: 175,
                  height: 175, // Adjust size of the video placeholder
                  color: Colors.grey[300], // Placeholder color
                  child: Center(
                    child: Icon(
                      Icons.map_outlined,
                      size: 100,
                      color: Colors.grey[600], // Icon color
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xff293038),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              key,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              value.toString(),
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          );
        }
      },
    );
  }
}
