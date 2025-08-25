import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final double precoOriginal;
  final double desconto;
  final double precoFinal;

  Produto({
    required this.nome,
    required this.precoOriginal,
    required this.desconto,
    required this.precoFinal,
  });
}

class Pagina3 extends StatefulWidget {
  @override
  _Pagina3State createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _descontoController = TextEditingController();
  List<Produto> _produtos = [];
  double? _precoFinal;

  void _calcularDesconto() {
    final nome = _nomeController.text.trim();
    final preco = double.tryParse(_precoController.text);
    final desconto = double.tryParse(_descontoController.text);
    if (nome.isNotEmpty && preco != null && desconto != null) {
      final precoFinal = preco - (preco * desconto / 100);
      setState(() {
        _precoFinal = precoFinal;
        _produtos.add(
          Produto(
            nome: nome,
            precoOriginal: preco,
            desconto: desconto,
            precoFinal: precoFinal,
          ),
        );
      });
    } else {
      setState(() {
        _precoFinal = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos corretamente!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Desconto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _precoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Original',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _descontoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Desconto (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calcularDesconto,
                child: Text('Calcular e Adicionar Produto'),
              ),
              SizedBox(height: 16),
              if (_precoFinal != null)
                Text(
                  'Preço com desconto: R\$ ${_precoFinal!.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              SizedBox(height: 24),
              Text(
                'Produtos cadastrados:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              ..._produtos.map(
                (p) => Card(
                  child: ListTile(
                    title: Text(p.nome),
                    subtitle: Text(
                      'Original: R\$ ${p.precoOriginal.toStringAsFixed(2)} | Desconto: ${p.desconto.toStringAsFixed(2)}%',
                    ),
                    trailing: Text(
                      'Final: R\$ ${p.precoFinal.toStringAsFixed(2)}',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('visualizar exercício 4'),
                onPressed: () {
                  Navigator.pushNamed(context, '/pagina4');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
