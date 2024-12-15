import 'package:flutter/material.dart';

class AllColorsPage extends StatelessWidget {
  const AllColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DE9B6), // Vibrant Teal
        title:
            Text('Vocablo App', style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: const Color(0xFF3D5AFE), // Light Indigo
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color(0xFF3D5AFE), // Light Indigo
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // **Different Sizes of Text**
          Text('Welcome to Vocablo',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text('Learning Vocabulary Made Fun!',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),

          // **Buttons**
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6F61)),
            child: const Text('Primary Action'), // Coral Button Color
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA5E1D5)),
            child: const Text('Secondary Action'), // Light Teal Button
          ),
          const SizedBox(height: 20),

          // **Links**
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Click here for more info',
              style: TextStyle(color: Color(0xFF1DE9B6)), // Teal for links
            ),
          ),
          const SizedBox(height: 20),

          // **Warning Messages**
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFFF9E79F), // Light Yellow (Warning)
            child: const Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                    child: Text('This is a warning message',
                        style: TextStyle(color: Color(0xFF2F4F4F)))),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // **Cards**
          Card(
            color: const Color(0xFFF1F1F1), // Soft Light Gray Card Background
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Title',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text('This is some content inside the card.',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // **ListView**
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.check_circle,
                      color: Color(0xFF1DE9B6)), // Vibrant Teal
                  title: Text('List Item ${index + 1}',
                      style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Text('Details of item ${index + 1}',
                      style: Theme.of(context).textTheme.bodySmall),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // **Progress Bar**
          Column(
            children: [
              Text('Loading...', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              const LinearProgressIndicator(
                value: 0.5,
                color: Color(0xFF1DE9B6), // Vibrant Teal
                backgroundColor: Color(0xFFF1F1F1), // Soft Light Gray
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1DE9B6), // Vibrant Teal
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
