import 'package:fruit_e_commerce/core/servers/firebase_auth_server.dart';
import 'package:fruit_e_commerce/feautres/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServer>(FirebaseAuthServer());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthServer: getIt<FirebaseAuthServer>(),
  ));
}
