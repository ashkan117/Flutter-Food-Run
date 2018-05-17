import 'dart:async';

import 'package:flutter_gmr_run/Data/Choice.dart';


abstract class ChoiceRepositoryContract {
  Future<List<Choice>> getChoiceList();
}