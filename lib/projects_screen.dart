import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final List<Map<String, dynamic>> projects;

  const ProjectScreen({super.key, required this.projects});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late List<Map<String, dynamic>> _projects;

  void sortProjectsList() {
    _projects.sort(
        (a, b) => b['isPinned'].toString().compareTo(a['isPinned'].toString()));
  }

  @override
  void initState() {
    super.initState();
    _projects = List.from(widget.projects);
    sortProjectsList();
  }

  void _togglePinProject(int index) {
    setState(() {
      _projects[index]['isPinned'] = !_projects[index]['isPinned'];
      sortProjectsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          final project = _projects[index];
          return ListTile(
            title: Text(project['title'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(project['description']),
            trailing: IconButton(
              icon: Icon(project['isPinned']
                  ? Icons.push_pin
                  : Icons.push_pin_outlined),
              onPressed: () => _togglePinProject(index),
            ),
          );
        },
      ),
    );
  }
}
