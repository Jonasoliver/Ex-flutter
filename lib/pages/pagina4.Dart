import 'package:flutter/material.dart';

class Pagina4 extends StatefulWidget {
  @override
  _Pagina4State createState() => _Pagina4State();
}

class _Pagina4State extends State<Pagina4> {
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double? _area;

  void _calcularArea() {
    final largura = double.tryParse(_larguraController.text);
    final altura = double.tryParse(_alturaController.text);
    if (largura != null && altura != null) {
      setState(() {
        _area = largura * altura;
      });
    } else {
      setState(() {
        _area = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite valores válidos para largura e altura!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Área do Retângulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _larguraController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Largura',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularArea,
              child: Text('Calcular Área'),
            ),
            SizedBox(height: 16),
            if (_area != null)
              Text(
                'Área: ${_area!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Visualizar exercício 5.1'),
              onPressed: () {
                Navigator.pushNamed(context, '/pagina5');
              },
            ),
          ],
        ),
      ),
    );
  }
}
