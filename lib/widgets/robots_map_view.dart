import 'package:flutter/material.dart';


class RobotsMapView extends StatefulWidget {
  const RobotsMapView({super.key});

  @override
  State<RobotsMapView> createState() => _RobotsMapViewState();
}

class _RobotsMapViewState extends State<RobotsMapView> {
  
  @override
  Widget build(BuildContext context) {
    
    return  
      Expanded(child: Container(color: const Color(0xff121417),
                    child: const Center(
                      child: Icon(
                        Icons.map_outlined,
                        size: 200,
                        color: Colors.white, // Icon color
                      ),
                    ),
      ));
  }
}
