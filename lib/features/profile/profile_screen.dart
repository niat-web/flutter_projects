import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/features/profile/provider/profile_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(fetchUserDataProviderProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: profileAsync.when(
        data: (profileData) {
          if (profileData == null) {
            return CircularProgressIndicator();
          }
          return Column(
            children: [
              _buildInfoCard(Icons.person, "Username", profileData.username),
              _buildInfoCard(Icons.email, "Email", profileData.email),
              _buildInfoCard(Icons.location_city, "City", profileData.city),
              _buildInfoCard(Icons.cake, "DOB", profileData.dob),
              _buildLogoutCard(context),
            ],
          );
        },
        error: (e, _) => Text("Error: $e"),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

Widget _buildInfoCard(IconData icon, String label, String value) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    ),
  );
}

Widget _buildLogoutCard(BuildContext context) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: Icon(Icons.logout, color: Colors.red),
      title: Text(
        "Log Out",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      onTap: () async {
        await Supabase.instance.client.auth.signOut();
        if (context.mounted) {
          return context.go("/login");
        }
      },
    ),
  );
}
