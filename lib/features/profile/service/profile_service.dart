import 'package:shopping_app/features/profile/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  static Future<ProfileModel?> fetchCurrentUserProfile() async {
    final userId = await Supabase.instance.client.auth.currentUser?.id;

    if (userId == null) {
      return null;
    }

    final result = await Supabase.instance.client
        .from("users")
        .select()
        .eq("id", userId)
        .maybeSingle();

    if (result != null) {
      return ProfileModel.fromJson(result);
    } else {
      print("Error fethcing data");
      throw Exception();
    }
  }
}
