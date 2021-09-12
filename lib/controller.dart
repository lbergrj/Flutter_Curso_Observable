import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//a utlilizalçao mixin Store é para geração de códigos automáticos
abstract class ControllerBase with Store{

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;


  @computed
  String get emailSenha => "$email - $senha";

  @computed
  bool get formularioValidado => email.contains("@")
      && email.contains(".")
      && email.length > 5
      && senha.length > 5;



  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar()async{
    carregando = true;
    await Future.delayed(Duration (seconds: 3));
    carregando = false;
    usuarioLogado = true;
  }

  ControllerBase(){

    //Sempre executado qundo um observárel tem seu resultado alterado
    autorun((_){
      /*
      print(email);
      print(senha);
      print(formularioValidado);
       */

    });

  }

 // @observable
 // int contador = 0;

 // @action
 // incrementar(){
 //   contador ++;
//}

  //Versão Manual
 /*
  var _contador = Observable(0);
  Action incrementar;

  Controller(){
    incrementar = Action(_incrementar);
  }

  int get contador => _contador.value;

  set contador(int valor) => _contador.value = valor;

  _incrementar(){
    contador++;
  }
  */
}