import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  double? _media;

  void _calcularMedia() {
    final n1 = double.tryParse(_nota1Controller.text);
    final n2 = double.tryParse(_nota2Controller.text);
    final n3 = double.tryParse(_nota3Controller.text);
    if (n1 != null && n2 != null && n3 != null) {
      setState(() {
        _media = (n1 + n2 + n3) / 3;
      });
    } else {
      setState(() {
        _media = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite todas as notas corretamente!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Média Aritmética')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nota 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nota 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nota 3',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularMedia,
              child: Text('Calcular Média'),
            ),
            SizedBox(height: 16),
            if (_media != null)
              Text(
                'Média: ${_media!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Visualizar exercício 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/pagina3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
