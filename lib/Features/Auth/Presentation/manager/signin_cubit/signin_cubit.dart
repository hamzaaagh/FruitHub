import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/Features/Auth/Presentation/manager/signin_cubit/signin_state.dart';
import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPass(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
