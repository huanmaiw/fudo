// controllers/combo_controller.dart
import 'package:get/get.dart';
import 'combo_model.dart';

class ComboController extends GetxController {
  var comboSuggestions = <ComboModel>[
    ComboModel(
      title: 'Combo mình ên\n02 túi lớn TISSUEPack x 01 lốc',
      image: 'assets/pub/hot2.png',
      price: '80.000đ',
    ),
    ComboModel(
      title: 'Dành cho 2 người\n03 túi lớn TISSUEPack x 02 lốc',
      image: 'assets/pub/hot2.png',
      price: '80.000đ',
    ),
  ].obs;

// Future method to fetch combo data from an API (if needed)
// Future<void> fetchComboSuggestions() async {
//   // Your API call logic here
//   comboSuggestions.value = fetchedCombos;
// }
}
