
import 'package:hydroponics_store/Model/plantsModel.dart';

class CartProductListModel {
  final PlantsModel plant;
  final double qty;

  CartProductListModel({required this.plant, required this.qty});

  Map toJson() {
    Map product = (this.plant != null ? this.plant.toJson() : null) as Map;

    return {'plant': plant, "qty": qty};
  }
}
