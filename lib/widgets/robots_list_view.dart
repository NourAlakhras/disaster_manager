import 'package:flutter/material.dart';
import 'package:flutter_3/screens/robot_detailed_screen.dart'; // Import the RobotDetailedScreen
import 'package:flutter_3/models/robot.dart'; // Import the RobotDetailedScreen


class RobotsListView extends StatefulWidget {
  const RobotsListView({Key? key}) : super(key: key);

  @override
  State<RobotsListView> createState() => _RobotsListViewState();
}

class _RobotsListViewState extends State<RobotsListView> {
  List<Robot> robots = [
    Robot(name: 'Robot 1', isRunning: true, batteryStatus: 80),
    Robot(name: 'Robot 2', isRunning: false, batteryStatus: 60),
    Robot(name: 'Robot 3', isRunning: true, batteryStatus: 90),
    // Add more robots as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff121417),
      child: ListView.builder(
        itemCount: robots.length,
        itemBuilder: (context, index) {
          Robot robot = robots[index];
          return GestureDetector(
            onTap: () {
              // Navigate to RobotDetailedScreen when card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RobotDetailedScreen(robot: robot),
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            robot.name,
                            style: const TextStyle(
                              color: Colors.black, // Custom color for the title text
                              fontSize: 18, // Custom font size for the title text
                              fontWeight: FontWeight.bold, // Make the title bold
                            ),
                          ),
                          const SizedBox(height: 8), 
                          Text(
                            'Battery: ${robot.batteryStatus}%',
                            style: const TextStyle(
                              color: Colors.black54, // Custom color for the subtitle text
                              fontSize: 16, // Custom font size for the subtitle text
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16), // Add spacing between card content and video placeholder
                    Container(
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
