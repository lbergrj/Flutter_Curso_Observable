import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'controller_item.g.dart';

class ControllerItem = ControllerItemBase with _$ControllerItem;

//a utlilizalçao mixin Store é para geração de códigos automáticos
abstract class ControllerItemBase with Store{

  ControllerItemBase(this.titulo);
  // O titulo não será alterado por isso não é um observable
  final String titulo;

  @observable
  bool marcado = false;

  void alterarMarcado(bool valor) => this.marcado = valor;


}