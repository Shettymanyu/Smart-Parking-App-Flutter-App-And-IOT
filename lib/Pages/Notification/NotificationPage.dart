import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Column(children: [
        ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(
            'Manish Singh',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Phone No. 37248482746',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 10),
        
      ]),
    );
  }
}
