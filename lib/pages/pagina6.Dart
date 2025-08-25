import 'package:flutter/material.dart';

enum Prioridade { baixa, media, alta }

class Tarefa {
  String nome;
  String descricao;
  bool concluida;
  Prioridade prioridade;
  Tarefa({
    required this.nome,
    required this.descricao,
    this.concluida = false,
    required this.prioridade,
  });
}

class Pagina6 extends StatefulWidget {
  @override
  _Pagina6State createState() => _Pagina6State();
}

class _Pagina6State extends State<Pagina6> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  Prioridade _prioridadeSelecionada = Prioridade.baixa;
  List<Tarefa> _tarefas = [];

  void _adicionarTarefa() {
    final nome = _nomeController.text.trim();
    final descricao = _descricaoController.text.trim();
    if (nome.isNotEmpty && descricao.isNotEmpty) {
      setState(() {
        _tarefas.add(Tarefa(
          nome: nome,
          descricao: descricao,
          prioridade: _prioridadeSelecionada,
        ));
        _nomeController.clear();
        _descricaoController.clear();
        _prioridadeSelecionada = Prioridade.baixa;
      });
    }
  }

  void _toggleConcluida(int index, bool? value) {
    setState(() {
      _tarefas[index].concluida = value ?? false;
    });
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Tarefas Diárias')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Prioridade: '),
                Expanded(
                  child: Row(
                    children: [
                      Radio<Prioridade>(
                        value: Prioridade.baixa,
                        groupValue: _prioridadeSelecionada,
                        onChanged: (value) {
                          setState(() {
                            _prioridadeSelecionada = value!;
                          });
                        },
                      ),
                      Text('Baixa'),
                      Radio<Prioridade>(
                        value: Prioridade.media,
                        groupValue: _prioridadeSelecionada,
                        onChanged: (value) {
                          setState(() {
                            _prioridadeSelecionada = value!;
                          });
                        },
                      ),
                      Text('Média'),
                      Radio<Prioridade>(
                        value: Prioridade.alta,
                        groupValue: _prioridadeSelecionada,
                        onChanged: (value) {
                          setState(() {
                            _prioridadeSelecionada = value!;
                          });
                        },
                      ),
                      Text('Alta'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _adicionarTarefa,
              child: Text('Adicionar Tarefa'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = _tarefas[index];
                  return Dismissible(
                    key: Key(tarefa.nome + index.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _removerTarefa(index);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: tarefa.concluida,
                        onChanged: (value) => _toggleConcluida(index, value),
                      ),
                      title: Text(tarefa.nome),
                      subtitle: Text(
                        '${tarefa.descricao}\nPrioridade: ${tarefa.prioridade.name[0].toUpperCase()}${tarefa.prioridade.name.substring(1)}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removerTarefa(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
