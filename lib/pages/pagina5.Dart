import 'package:flutter/material.dart';

class ItemCompra {
  String nome;
  bool comprado;
  ItemCompra({required this.nome, this.comprado = false});
}

class Pagina5 extends StatefulWidget {
  @override
  _Pagina5State createState() => _Pagina5State();
}

class _Pagina5State extends State<Pagina5> {
  final TextEditingController _itemController = TextEditingController();
  List<ItemCompra> _itens = [];

  void _adicionarItem() {
    final nome = _itemController.text.trim();
    if (nome.isNotEmpty) {
      setState(() {
        _itens.add(ItemCompra(nome: nome));
        _itemController.clear();
      });
    }
  }

  void _removerItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }

  void _toggleComprado(int index, bool? value) {
    setState(() {
      _itens[index].comprado = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: InputDecoration(
                      labelText: 'Adicionar item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _adicionarItem,
                  child: Text('Adicionar'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, index) {
                  final item = _itens[index];
                  return Dismissible(
                    key: Key(item.nome + index.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _removerItem(index);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: item.comprado,
                        onChanged: (value) => _toggleComprado(index, value),
                      ),
                      title: Text(
                        item.nome,
                        style: TextStyle(
                          decoration: item.comprado
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removerItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Visualizar exercício 5.2'),
              onPressed: () {
                Navigator.pushNamed(context, '/pagina6');
              },
            ),
          ],
        ),
      ),
    );
  }
}
