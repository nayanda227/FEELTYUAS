import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_feelty/gnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.edit, color: Colors.black),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/86990795?v=4'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lana',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('luthfihakim@gmail.com'),
                      Text('0831524308'),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              // Stats Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileStatCard(title: '55 kg', subtitle: 'Weight'),
                  ProfileStatCard(title: '20', subtitle: 'Years Old'),
                  ProfileStatCard(title: '167 cm', subtitle: 'Height'),
                ],
              ),
              SizedBox(height: 20),
              // Account Section
              SectionTitle('Account'),
              ProfileMenuItem('Your profile', Icons.person),
              ProfileMenuItem('Settings', Icons.settings),
              ProfileMenuItem('Help center', Icons.help),
              ProfileMenuItem('Notifications', Icons.notifications),
              ProfileMenuItem('Change language', Icons.language),
              ProfileMenuItem('Manage accounts', Icons.account_circle),
              SizedBox(height: 20),
              // General Section
              SectionTitle('General'),
              ProfileMenuItem('Privacy Policy', Icons.lock),
              ProfileMenuItem('Terms of Service', Icons.article),
              ProfileMenuItem('Rate Feetly App', Icons.thumb_up),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileStatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfileStatCard(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(subtitle),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileMenuItem(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
