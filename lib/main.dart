import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Animated Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: isSelected
                ? BorderRadius.circular(0)
                : BorderRadius.circular(10),
            border: BoxBorder.all(),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: isSelected ? 300 : 150,
            height: 150,
            color: isSelected
                ? colors.primary.withValues(alpha: 0.5)
                : colors.surface,
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Icon(Icons.person)),
                ),
                Text('Yod G', style: Theme.of(context).textTheme.titleMedium),
                Text(
                  "Mobile Developer",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        isSelected = !isSelected;
                      }),
                    },
                    child: Text(isSelected ? 'Selected' : 'Select'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
