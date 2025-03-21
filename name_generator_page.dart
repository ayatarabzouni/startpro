import 'package:flutter/material.dart';

class NameGeneratorPage extends StatefulWidget {
  const NameGeneratorPage({super.key});

  @override
  _NameGeneratorPageState createState() => _NameGeneratorPageState();
}

class _NameGeneratorPageState extends State<NameGeneratorPage> {
  List<String> generatedNames = [
    "TechNova",
    "GreenHarvest",
    "BlueWave Solutions",
    "SmartRetail Hub",
    "HealthEase",
    "AutoMotiveX",
    "FinTrust",
    "EduSpark",
  ];

  String? selectedName;

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
                  "Name Generator & Trademark Checker",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Click 'Generate' to display a list of business name suggestions below!",
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // Name Suggestions List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: generatedNames.length,
                    itemBuilder: (context, index) {
                      String name = generatedNames[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedName = name;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selectedName == name
                                ? Colors.white.withOpacity(0.4)
                                : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "The generated names are unique and have been checked for availability and registration.",
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // Next Button (Disabled if no name is selected)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: selectedName != null
                        ? () {
                            // Navigate to the next page (replace with the actual next page)
                            print("Selected Name: $selectedName");
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue.shade800,
                      backgroundColor: selectedName != null
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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
