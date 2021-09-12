import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller_principal.dart';
import 'package:provider/provider.dart';
import '../controller.dart';

class ScreenPrincipal extends StatefulWidget {
  @override
  _ScreenPrincipalState createState() => _ScreenPrincipalState();
}

class _ScreenPrincipalState extends State<ScreenPrincipal> {

  ControllerPrincipal _controllerPrincipal = ControllerPrincipal();

  _dialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma descrição..."
              ),
              onChanged: _controllerPrincipal.setNovoItem,
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    },
                  child: Text("Cancelar", style: TextStyle(
                    color: Colors.red
                  ),)
              ),
              TextButton(
                  onPressed:(){
                    _controllerPrincipal.adicionarItem();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final  controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${controller.email}",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body:Observer(
        builder: (_){
          return  ListView.builder(
            itemCount: _controllerPrincipal.listaItens.length,
            itemBuilder: (_, indice){
              //item é do tipo ControllerItem
              var item = _controllerPrincipal.listaItens[indice];
              return Observer(
                builder: (_){
                  return ListTile(
                    title: Text(item.titulo,
                      style: TextStyle(
                       // decoration: item.marcado ? TextDecoration.lineThrough: null,
                      ),
                    ),
                    leading: Checkbox(
                      value: item.marcado,
                      onChanged: item.alterarMarcado,
                    ),
                    onTap: (){
                      item.marcado = !item.marcado;
                    },
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _dialog();
        },
      ),
    );
  }
}
