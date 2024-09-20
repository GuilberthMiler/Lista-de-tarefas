import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/form_tasks.dart';
import 'package:projeto_flutter/view/list_view_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyWidget(),
      routes: {
        '/listarTarefas': (context) => const ListViewTasks(),
        '/criarTarefas': (context) => const CreateTasks()
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minha Lista de Tarefas'),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('Guilberth', style: TextStyle(fontSize: 24)),
                accountEmail: Text('Miler@email.com.br'),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white, child: Icon(Icons.person))),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Listagem de Tarefas'),
              onTap: () {
                Navigator.pushNamed(context, '/listarTarefas');
              },
            )
          ],
        )),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 30),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/criarTarefas');
                        },
                        child: const Icon(Icons.add))))
          ],
        ));
  }
}