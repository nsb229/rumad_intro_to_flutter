import 'package:flutter/material.dart';
import 'package:my_app/projects_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Flutter Profile App',
      'description':
          'A demo app showcasing navigation and UI design in Flutter.',
      'isPinned': false
    },
    {
      'title': 'Rutgers Research Project',
      'description':
          'Developed as part of the CS program at Rutgers University.',
      'isPinned': false
    },
    {
      'title': 'Rusty Linux',
      'description': 'Rebuilt Linux in rust.',
      'isPinned': false
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Full Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rutgers University",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "I'm a CS student at Rutgers, and I love da code.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Icon(Icons.work, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "Company Inc.",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.school, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "Ruggers",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.location_on, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "New Jersey",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildSocialButton(
                    Icons.code, "GitHub", "https://github.com/{your_gh_here}"),
                _buildSocialButton(Icons.work_history_outlined, "LinkedIn",
                    "https://www.linkedin.com/in/{your_linkedin_here}/")
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProjectScreen(projects: projects)),
                  );
                },
                child: const Text('View Projects'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String labelText, String url) {
    return ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(labelText),
        onPressed: () {
          launchUrl(Uri.parse(url));
        });
  }
}
