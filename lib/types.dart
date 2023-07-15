import 'package:buyme/screens/user_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyme/screens/register_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final List<Map<String, dynamic>> buttonTexts = [
    {
      "text": "Phone Number",
      "icon": Icons.phone,
    },
    {
      "text": "Google Sign",
      "icon": FontAwesomeIcons.google,
    },
    {
      "text": "Email/Password",
      "icon": Icons.email,
    },
    {
      "text": "Facebook",
      "icon": FontAwesomeIcons.facebook,
    },
    {
      "text": "Play Games",
      "icon": Icons.gamepad,
    },
    {
      "text": "Games Center",
      "icon": Icons.gamepad,
    },
    {
      "text": "Apple",
      "icon": FontAwesomeIcons.apple,
    },
    {
      "text": "GitHub",
      "icon": FontAwesomeIcons.github,
    },
    {
      "text": "Microsoft",
      "icon": FontAwesomeIcons.microsoft,
    },
    {
      "text": "Twitter",
      "icon": FontAwesomeIcons.twitter,
    },
    {
      "text": "Yahoo",
      "icon": Icons.email,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Login Option'),
      backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.orangeAccent.shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Expanded(
        child: ListView.builder(
          itemCount: buttonTexts.length,
          itemBuilder: (context, index) {
            final buttonText = buttonTexts[index]["text"];
            final buttonIcon = buttonTexts[index]["icon"];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 18.0),
              child: TypeButton(
                text: buttonText!,
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
    )
    );
  }
}

// Future<void> _handleGoogleSignIn(BuildContext context) async {
//   // Implement Google Sign-In functionality here
//   // Use the Google Sign-In package and Firebase authentication
//   // Once the user successfully signs in with Google, navigate to the appropriate screen
//   // Replace the condition and logic with your own implementation
//   bool isGoogleSignInSuccessful = true;
//
//   if (isGoogleSignInSuccessful) {
//     // Check if the user is already registered or not
//     // Replace the condition and logic with your own implementation
//     bool isUserRegistered = true;
//
//     if (isUserRegistered) {
//       // User is registered, navigate to WebScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => UserInfromationScreen()),
//       );
//     } else {
//       // User is not registered, navigate to LogScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => RegisterScreen()),
//       );
//     }
//   } else {
//     // Handle Google Sign-In failure
//     // Show an error message or perform appropriate actions
//   }
// }

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
