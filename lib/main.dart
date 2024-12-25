import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//  Terminal commands
//  'flutter config --enable-windows-desktop'
//  'flutter pub add url_launcher'
void main() {
  runApp(const MyApp()); // Runs the app by calling the MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Windows Browser App', // The title of the app
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Primary color theme for the app
        useMaterial3: true, // Enable Material 3 for the app's design
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black), // Set text color to black for body text
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: const BrowserLauncher(), // Set the home screen to BrowserLauncher
    );
  }
}

class BrowserLauncher extends StatelessWidget {
  final String url =
      'https://www.google.com'; // Define the URL that will be opened in the browser

  const BrowserLauncher(
      {super.key}); // Constructor for the BrowserLauncher widget

  // Function to launch the browser with the given URL
  Future<void> _launchBrowser() async {
    // Check if the URL can be launched in the default browser
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url)); // Launch the browser with the URL
    } else {
      throw 'Could not launch $url'; // Error message if the URL cannot be launched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Browser App'), // Title of the app bar
        centerTitle: true, // Center the title in the app bar
        backgroundColor: Colors.deepPurple, // App bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the body content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the content horizontally
          children: [
            const Text(
              'Click the button to open your default browser', // Instruction text
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500), // Styling for the text
            ),
            const SizedBox(height: 30), // Spacer between text and button
            ElevatedButton(
              onPressed:
                  _launchBrowser, // Call the _launchBrowser function when the button is pressed
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Button background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Rounded corners for the button
                ),
              ),
              child: const Text(
                'Open Browser', // Text on the button
                style: TextStyle(
                  fontSize: 16, // Font size for button text
                  fontWeight: FontWeight.bold, // Make the text bold
                  color: Colors.white, // Set button text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
