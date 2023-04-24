import 'package:mobx/mobx.dart';

part 'mobx_store.g.dart';

class MobXStore = _MobXStore with _$MobXStore;

abstract class _MobXStore with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void minimize() {
    counter = counter - 1;
  }
}
