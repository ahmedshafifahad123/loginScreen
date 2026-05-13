import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHidden = true;

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Correct credentials
  final String correctEmail = "---";
  final String correctPassword = "---";

  void loginCheck() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print("Email entered: $email");
    print("Password entered: $password");

    if (email.isEmpty || password.isEmpty) {
      print("Empty fields detected");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
    }
    else if (email != correctEmail) {
      print("Email mismatch: $email vs $correctEmail");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Email")),
      );
    }
    else if (password != correctPassword) {
      print("Password mismatch");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Password")),
      );
    }
    else {
      print("Login successful! Navigating to HomeScreen...");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Container(
                child: Image.asset('images/assets/icon.jpg'),
                height: 150,
                width: 150,
              ),
            ),

            // Email
            Container(
              height: 50,
              width: 300,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Password
            Container(
              height: 50,
              width: 300,
              child: TextField(
                controller: passwordController,
                obscureText: isHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: () {},
              child: Text("Forgot Password?"),
            ),

            SizedBox(height: 20),

            // LOGIN BUTTON
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: loginCheck,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: Image.asset(
                    'images/assets/loginSuccessful.jpg'),
                height: 150,
                width: 150,
              ),
            ),

            // Login Successful Text
            Text(
              'Welcome! Login Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
        ]
      ),
    ),
    );
  }
}