import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_card/models/project_model.dart';

Future<List<Project>> getProjects() async {
  final dio = Dio();
  final Response response = await dio.get(
    'https://api.github.com/users/leonardfreitas/repos',
  );

  final projects =
      (response.data as List).map((value) => Project.fromMap(value)).toList();

  return projects;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Project>>(
        future: getProjects(),
        builder: (context, snapshop) {
          final projects = snapshop.data!;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(projects[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
