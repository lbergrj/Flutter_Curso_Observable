import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller_item.dart';
part 'controller_principal.g.dart';

class ControllerPrincipal = ControllerPrincipalBase with _$ControllerPrincipal;

//a utlilizalçao mixin Store é para geração de códigos automáticos
abstract class ControllerPrincipalBase with Store{

    @observable
    String novoItem = "";

    @action
    void setNovoItem(String valor) => novoItem = valor;

    @observable
    ObservableList<ControllerItem> listaItens = ObservableList<ControllerItem>();

    @action
    void adicionarItem(){
        listaItens.add(ControllerItem(novoItem));
        print(listaItens);
    }


}