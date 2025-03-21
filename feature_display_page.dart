import 'package:flutter/material.dart';
import 'name_generator_page.dart';

class FeatureDisplayPage extends StatefulWidget {
  const FeatureDisplayPage({super.key});

  @override
  _FeatureDisplayPageState createState() => _FeatureDisplayPageState();
}

class _FeatureDisplayPageState extends State<FeatureDisplayPage> {
  final List<String> features = [
    "Name Generator & Trademark Checker",
    "Logo Generator",
    "E-Commerce Platforms",
    "Shipping Companies",
    "Trend Analysis",
    "Saudi Laws and Regulations",
    "Sales Forecasting",
    "User Manual",
  ];

  final Set<String> selectedFeatures = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade400],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent extra white space
              children: [
                const SizedBox(height: 40),

                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 10),

                const Text(
                  "Discover Tools to Kickstart Your Business",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Feature Selection
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: features.map((feature) {
                      return CheckboxListTile(
                        title: Text(feature,
                            style: const TextStyle(color: Colors.white)),
                        value: selectedFeatures.contains(feature),
                        onChanged: (bool? selected) {
                          setState(() {
                            if (selected == true) {
                              selectedFeatures.add(feature);
                            } else {
                              selectedFeatures.remove(feature);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),

                // Continue Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NameGeneratorPage()),
                      );
                    },
                    child: const Text("Continue"),
                  ),
                ),
              ],
            ),
          ),

          // Back Button 🔙 - Positioned in the top-left corner
          Positioned(
            top: 40, // Adjust the top position as needed
            left: 10, // Adjust the left position as needed
            child: IconButton(
              icon: Image.asset(
                'assets/images/back_icon.png',
                width: 24, // Adjust the size of the icon
                height: 24,
              ),
              iconSize: 24, // Set the icon size
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
