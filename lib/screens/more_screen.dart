import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luci_mobile/state/app_state.dart'; // فقط این AppState استفاده شود

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider); // از state/app_state.dart گرفته می‌شود

    return Scaffold(
      appBar: AppBar(
        title: const Text('More Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('App Version'),
            subtitle: const Text('1.0.0'),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: appState.notificationsEnabled,
            onChanged: (val) {
              appState.setNotificationsEnabled(val);
            },
            thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.orange;
                }
                return null;
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              appState.logout(); // متد logout در AppState تعریف شده باشد
            },
          ),
        ],
      ),
    );
  }
}
