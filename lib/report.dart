import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_feelty/gnavbar.dart';

void main() {
  runApp(const ReportApp());
}

class ReportApp extends StatelessWidget {
  const ReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportPage(),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      appBar: AppBar(
        title: const Text("Reports"),
        backgroundColor: Colors.white38,
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Workout, Calories, Time summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MetricCard(title: "Workout", value: "0"),
                  MetricCard(title: "Calories", value: "0.0"),
                  MetricCard(title: "Time", value: "0"),
                ],
              ),
              SizedBox(height: 20),

              // Calendar
              ReportCard(
                title: "Calendar",
                child: Text("October 20", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),

              // Water Intake
              ReportCard(
                title: "Water Intake",
                child: Text("1200 ml", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),

              // Calories Burned
              ReportCard(
                title: "Calories Burned",
                child: Text("5200 kcal", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),

              // Steps
              ReportCard(
                title: "Steps",
                child: Text("12000", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),

              // Weight
              ReportCard(
                title: "Weight (kg)",
                child: Column(
                  children: [
                    Text("Current: 65", style: TextStyle(fontSize: 16)),
                    Text("Last Week: 0.0", style: TextStyle(fontSize: 16)),
                    Text("Average: 65.4", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Calories Burned Chart
              ReportCard(
                title: "Calories Burned (Monthly)",
                child:
                    Text("Chart Placeholder", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;

  const MetricCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.orange[800]),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ReportCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.orange[800],
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
