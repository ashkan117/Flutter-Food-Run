import 'package:flutter_gmr_run/Data/Choice.dart';


abstract class ChoicePageContract {
  void onLoadChoices(List<Choice> choices);
}