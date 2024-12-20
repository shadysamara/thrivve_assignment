import 'package:mocktail/mocktail.dart';
import 'package:thrivve_flutter_assignment/data/data_sources/withdraw_source_api.dart';
import 'package:thrivve_flutter_assignment/data/repositories/withdraw_repository.dart';

class MockWithdrawApiRepository extends Mock implements WithdrawApiRepository {}

class MockApiProvider extends Mock implements WithdrawApiProvider {}

class MockGet extends Mock {
  void offNamed(String routeName);
}
