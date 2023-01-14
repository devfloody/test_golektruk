import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_golektruk/features/user/user_model.dart';

class UserController extends StateNotifier<AsyncValue<UserModel?>> {
  UserController() : super(const AsyncData(null));

  submitUserData({required UserModel user}) {
    state = const AsyncLoading();
    try {
      state = AsyncData(user);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<UserModel?>>((ref) {
  return UserController();
});
