import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter functions'), actions: [
        IconButton(
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
          icon: const Icon(Icons.refresh_outlined),
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(clickCounter.toString(),
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w200)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks')
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
          icon: Icons.refresh_outlined,
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          icon: Icons.exposure_minus_1,
          onPressed: () {
            if (clickCounter > 0) {
              setState(() {
                clickCounter--;
              });
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          icon: Icons.plus_one_outlined,
          onPressed: () {
            setState(() {
              clickCounter++;
            });
          },
        ),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
