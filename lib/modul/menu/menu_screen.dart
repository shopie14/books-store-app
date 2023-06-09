import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // aksi yang ingin dilakukan saat tombol "Home" ditekan
              },
              icon: Icon(Icons.home),
              label: const Text('Home'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // aksi yang ingin dilakukan saat tombol "Anime List" ditekan
              },
              icon: Icon(Icons.list),
              label: const Text('Anime List'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // aksi yang ingin dilakukan saat tombol "Setting" ditekan
              },
              icon: Icon(Icons.settings),
              label: const Text('Setting'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // aksi yang ingin dilakukan saat tombol "Profile" ditekan
              },
              icon: Icon(Icons.person),
              label: const Text('Profile'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // aksi yang ingin dilakukan saat tombol "Logout" ditekan
              },
              icon: Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
