import 'package:flutter/material.dart';
import 'package:flutter_3/services/mqtt_client_wrapper.dart';
import 'package:flutter_3/widgets/custom_upper_bar.dart';
import 'package:flutter_3/models/robot.dart';
import 'package:flutter_3/widgets/tabbed_view.dart';
import 'package:flutter_3/widgets/monitoring_view.dart';
import 'package:gap/gap.dart';


class RobotDetailedScreen extends StatefulWidget {
  final Robot robot;

  const RobotDetailedScreen({Key? key, required this.robot}) : super(key: key);

  @override
  _RobotDetailedScreenState createState() => _RobotDetailedScreenState();
}

class _RobotDetailedScreenState extends State<RobotDetailedScreen> {
  late MQTTClientWrapper _mqttClient;
  Map<String, dynamic> mqttData = {};

  @override
  void initState() {
    super.initState();
    _mqttClient = MQTTClientWrapper();
    _mqttClient.onDataReceived = _updateMqttData;
    _mqttClient.prepareMqttClient();
  }

  void _updateMqttData(Map<String, dynamic> data) {
    setState(() {
      mqttData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final robot = widget.robot;
    return Scaffold(
      backgroundColor: const Color(0xff121417),
      appBar: CustomUpperBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: robot.name,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Container(
                      width: 175,
                      height: 175, // Adjust size of the video placeholder
                      color: Colors.grey[300], // Placeholder color
                      child: Center(
                        child: Icon(
                          Icons.video_library,
                          size: 100,
                          color: Colors.grey[600], // Icon color
                        ),
                      ),
                    ),),
          Expanded(
            child: TabbedView(
              length: 2,
              tabs: const <Widget>[
                Tab(
                  text: 'Monitoring',
                ),
                Tab(
                  text: 'Controlling',
                ),
              ],
              tabContents: [
                Container(
                  padding:EdgeInsets.only(top:10),
                  child:                  MonitoringView(  mqttData: mqttData,
                    robot: robot,),
                    // Content for Tab 2 (replace with your map view widget)
                ),
              ],
            ),

          ),
  
        ],
      ),
    );
  }
}
