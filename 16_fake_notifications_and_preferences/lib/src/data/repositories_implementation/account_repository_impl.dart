import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';
import 'package:ui_ux/src/data/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountProvider _provider;

  AccountRepositoryImpl(this._provider);

  @override
  Future<User?> get userInformation => _provider.userInformation;
}
