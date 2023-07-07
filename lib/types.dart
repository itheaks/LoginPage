import 'package:flutter/material.dart';
import 'package:buyme/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      //backgroundColor: Colors.orange,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TypeScreen()),
            );
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}

class TypeScreen extends StatelessWidget {
  final List<String> buttonTexts = [
    "Log In With Phone Number",
    "Button 2",
    "Button 3",
    "Button 4",
    "Button 5",
    "Button 6",
    "Button 7",
    "Button 8",
    "Button 9",
    "Button 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Login Option'),
      backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.orangeAccent.shade100,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Expanded(
        child: ListView.builder(
          itemCount: buttonTexts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 18.0),
              child: TypeButton(
                text: buttonTexts[index],
                onPressed: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  } else if (index == 1) {
                    // Handle button 2 navigation
                  } else {
                    // Handle other buttons
                  }
                },
              ),
            );
          },
        ),
      ),],)
    );
  }
}

class TypeButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const TypeButton({required this.text, this.onPressed});

  @override
  _TypeButtonState createState() => _TypeButtonState();
}

class _TypeButtonState extends State<TypeButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _animation.value,
            child: child,
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.orange,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
