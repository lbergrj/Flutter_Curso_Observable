import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/screens/screen_principal.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  ReactionDisposer _reactionDisposer;
  Controller controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

   //autorun Monitora todos os observpaveis sempre é chamado
    /*
    autorun((_){
      print(controller.emailSenha);
    });
     */

     //Controller Só retorna quando há alteração no parâmetro observado


    // Provider só pode ser recuperado dento do método didChangeDependencies()
    // ou no build
    // não pode ser recuparado o initState
    controller = Provider.of<Controller>(context);

    _reactionDisposer = reaction(
      (_) => controller.usuarioLogado,
      (usuarioLogado){
        if(usuarioLogado){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ScreenPrincipal()
              ),
          );
        }
      }
   );
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _reactionDisposer.reaction.dispose();
    super.dispose();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             /*
              Padding(padding: EdgeInsets.all(16),
                child: Observer(
                  builder: (_){
                    return Text(
                      "${controller.contador}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 80,
                      ),
                    );
                  },
                ),
              ),
              */

              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  onChanged: controller.setEmail,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      labelText: "Senha"
                  ),
                  onChanged: controller.setSenha,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child:Observer(
                  builder: (_){
                    return  Text(
                      controller.formularioValidado
                          ? "* Campos  validados"
                          : "* Campos  não validados"
                    );
                  },
                ),
              ),


              Padding(
                padding: EdgeInsets.all(16),
                child: Observer(
                  builder: (_){
                    return ElevatedButton(
                      child: controller.carregando
                            ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                        "Logar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                      onPressed:  controller.formularioValidado
                          ? controller.logar
                          :null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
