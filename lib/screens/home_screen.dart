import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> productos = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http.get(Uri.parse('https://6c2b-2800-e2-a00-919-8e0-39c0-5479-82a1.ngrok-free.app/api/imagen/Lista'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        productos = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Productos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');              
                },
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          final stock = producto['stock'];
          final stockMin = producto['stockMin'];
          final isEscaseando = stock < stockMin;

          return Column(
            children: [
              ListTile(
                title: Text(
                  producto['nombre'],
                  style: TextStyle(fontSize: 20), // Aumenta el tamaño de la fuente
                ),
                subtitle: Text(
                  'Stock: $stock',
                  style: TextStyle(fontSize: 16), // Aumenta el tamaño de la fuente
                ),
                trailing: Text(
                  'Stock Mínimo: $stockMin',
                  style: TextStyle(fontSize: 16), // Aumenta el tamaño de la fuente
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                child: const Divider(
                  color: Colors.grey, // Puedes ajustar el color aquí
                  thickness: 1.0, // Puedes ajustar el grosor aquí
                ),
              ),
              if (isEscaseando)
                const Text(
                  '¡Escaseando!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
