import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luci_mobile/main.dart';

class RouterDashboardSettingsScreen extends ConsumerWidget {
  const RouterDashboardSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Router Dashboard Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Features',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          // نمونه Switch اصلاح شده
          SwitchListTile(
            title: const Text('Enable Feature A'),
            value: appState.featureAEnabled,
            onChanged: (val) {
              appState.setFeatureAEnabled(val);
            },
            thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.blue; // رنگ فعال
                }
                return null; // رنگ پیش‌فرض غیرفعال
              },
            ),
          ),

          SwitchListTile(
            title: const Text('Enable Feature B'),
            value: appState.featureBEnabled,
            onChanged: (val) {
              appState.setFeatureBEnabled(val);
            },
            thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.green;
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 32),
          const Text(
            'Other Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          // نمونه یک Switch ساده داخل Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Enable Notifications'),
              Switch(
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
            ],
          ),
        ],
      ),
    );
  }
}
