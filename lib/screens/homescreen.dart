import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkshop/constants/appcolors.dart';
import 'package:flutterworkshop/constants/appfonts.dart';
import 'package:flutterworkshop/constants/apptheme.dart';
import 'package:flutterworkshop/constants/data.dart';
import 'package:flutterworkshop/functions/sharedprefs.dart';
import 'package:flutterworkshop/screens/splashscreen.dart';
import 'package:flutterworkshop/widgets/mybutton.dart';
import 'package:flutterworkshop/widgets/mytextformfield.dart';
import 'package:flutterworkshop/widgets/popupcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

enum ConfettiShape { circle, star }

class HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? username;
  DateTime currentDate = DateTime.now();
  bool showconfetti = false;
  ConfettiController? confettiController;

  @override
  void initState() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    getdetails();
    super.initState();
  }

  getdetails() async {
    username = await ShareData().username(val: '', type: 'get');
    setState(() {});
    if (username == null || username == '') {
      getname();
    }
  }

  getname() {
    popupCard(
      dismiss: false,
      context: context,
      title: Form(
        key: formKey,
        child: Column(
          children: [
            MyTextField(
              hint: 'Please enter your name',
              controller: controller,
              lable: 'Your Good Name Please',
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter the value';
                }
                return null;
              },
              onSaved: (val) async {
                await ShareData().username(type: 'put', val: val!);
                getdetails();
              },
            ),
          ],
        ),
      ),
      actions: [
        MyButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.pop(context);

              showconfetti = true;
              confettiController!.play();

              // Delayed navigation after playing confetti for 3 seconds
              Future.delayed(
                const Duration(seconds: 4),
                () {
                  setState(() {
                    showconfetti = false;
                  });
                },
              );
            }
          },
          bgColor: blue,
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    return hour < 12
        ? 'Good Morning!'
        : (hour < 17 ? 'Good Afternoon!' : 'Good Evening!');
  }

  bool isDateAfterNow(DateTime date) {
    return date.isAfter(currentDate);
  }

  bool isContentUnlocked(int index) {
    DateTime unlockDate = DateTime(2023, 12, 21).add(Duration(days: index));
    DateTime tomorrowDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day + 1);
    return currentDate.isAfter(unlockDate) ||
        (currentDate.isAtSameMomentAs(unlockDate) &&
            tomorrowDate.isAfter(unlockDate));
  }

  Path drawRandomConfettiShape(Size? size) {
    final path = Path();
    const double radius = 5.0; // Adjust the radius for the size of the shapes
    final random = Random();
    final shape =
        ConfettiShape.values[random.nextInt(ConfettiShape.values.length)];

    switch (shape) {
      case ConfettiShape.circle:
        // Create a circular path
        path.addArc(
          Rect.fromCircle(center: const Offset(0, 0), radius: radius),
          0, // Starting angle
          2 * pi, // Sweep angle (360 degrees for a full circle)
        );
        break;
      case ConfettiShape.star:
        // Create a star shape path
        path.moveTo(radius * cos(pi / 10), -radius * sin(pi / 10));
        for (int i = 1; i <= 5; i++) {
          double angle = (i * 4 * pi / 5) + pi / 10;
          double x = radius * cos(angle);
          double y = -radius * sin(angle);
          path.lineTo(x, y);
        }
        break;
    }

    return path;
  }

  void showLockedContentPopup(BuildContext context) {
    popupCard(
      context: context,
      title: const Text('Content Locked'),
      content: const Text(
        'This content is locked!. Please, wait to Unlock it view details.',
      ),
      actions: [
        MyButton(
          onPressed: () {
            Navigator.pop(context);
          },
          bgColor: blue,
          child: Text(
            'OK',
            style: Fonts().h3m(context).copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    if (username == null || username!.isEmpty) {
      // If the username is empty, return false to prevent exiting
      return false;
    }

    // If the username is not empty, show the exit confirmation dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to exit?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to not exit
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                ); // Return true to exit
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
      return  showExitConfirmationDialog(context);
      },
      child: Scaffold(
        backgroundColor: ash,
        body: showconfetti
            ? Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ConfettiWidget(
                        confettiController: confettiController!,
                        createParticlePath: drawRandomConfettiShape,
                        blastDirectionality: BlastDirectionality.explosive,
                        gravity: 0,
                        numberOfParticles: 10,
                        emissionFrequency: .05,
                        particleDrag: .1,
                        shouldLoop: false,
                        colors: const [
                          Colors.blue,
                          Colors.teal,
                          Colors.orange,
                          Colors.pink,
                          Colors.purple,
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/h.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Congratulations on Flutter Workshop\nwith TeamUp!',
                            textAlign: TextAlign.center,
                            style: Fonts().h3l(context).copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: size.width,
                      constraints: BoxConstraints(
                        maxHeight: size.height,
                        maxWidth: size.width,
                      ),
                      color: themecolor,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * .08,
                                ),
                                Text(
                                  "🙏 ${getGreeting()}",
                                  style: Fonts().h3l(context).copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "$username",
                                  style: Fonts().h3l(context).copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileScreen(username),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.person,
                                size: 60,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.22,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Day-wise Content',
                            style: Fonts().h3l(context).copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: 4,
                              itemBuilder: (context, index) => Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: isContentUnlocked(index)
                                    ? const Color(0xFFDDF8FF)
                                    : grey,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            images[index],
                                            height: 100,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            isContentUnlocked(index)
                                                ? content[index]
                                                : 'Locked Content',
                                            style: Fonts()
                                                .h3m(context)
                                                .copyWith(
                                                  color:
                                                      isContentUnlocked(index)
                                                          ? Colors.black
                                                          : Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned.fill(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!isContentUnlocked(index)) {
                                            showLockedContentPopup(context);
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    routes[index],
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //     color: Colors.grey, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: isContentUnlocked(index)
                                                ? Colors.transparent
                                                : Colors.black.withOpacity(0.6),
                                          ),
                                          child: isContentUnlocked(index)
                                              ? const SizedBox.shrink()
                                              : const Center(
                                                  child: Icon(
                                                    Icons.lock,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: size.width * .4,
                    child: Column(
                      children: [
                        Text(
                          'poweredby',
                          style:
                              Fonts().h4l(context).copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Team-',
                              style: Fonts().h3l(context).copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Up!',
                              style: Fonts().h3l(context).copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * .05),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String? username;

  const ProfileScreen(this.username, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $username!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ShareData().logOut(context);
                Navigator.pop(context);
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
