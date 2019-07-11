import 'package:event_bus/event_bus.dart';

import 'DbProvider.dart';

EventBus eventBus = new EventBus();

class TransEvent{

  MovidBean bean;
  bool isAdd;

  TransEvent(this.bean,this.isAdd);

}