import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  final TextEditingController _controller = TextEditingController();
  double? _resultado;

  void _converter() {
    final texto = _controller.text;
    final celsius = double.tryParse(texto);
    if (celsius != null) {
      setState(() {
        _resultado = celsius * 9 / 5 + 32;
      });
    } else {
      setState(() {
        _resultado = null;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Digite um número válido!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor Celsius para Fahrenheit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura em Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _converter, child: Text('Converter')),
            SizedBox(height: 16),
            if (_resultado != null)
              Text(
                'Fahrenheit: ${_resultado!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Visualizar exercício 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/pagina2');
              },
            ),
          ],
        ),
      ),
    );
  }
}
