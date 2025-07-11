import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/features/profile/model/profile_model.dart';
import 'package:shopping_app/features/profile/service/profile_service.dart';

part 'profile_provider.g.dart';

@riverpod
Future<ProfileModel?> fetchUserDataProvider(FetchUserDataProviderRef ref) {
  return ProfileService.fetchCurrentUserProfile();
}
