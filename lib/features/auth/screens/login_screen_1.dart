import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginscreen1 extends StatefulWidget {
  static const String routeName = '/loginscreen1';
  const loginscreen1({super.key});

  @override
  State<loginscreen1> createState() => _loginscreen1State();
}

class _loginscreen1State extends State<loginscreen1> {
  @override
  Widget build(BuildContext context) {
    return LoginSignupScreen();
  }
}

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/shop.svg';
    final Widget svgIcon = SvgPicture.asset(assetName);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          GlobalVariables.textColor,
                          GlobalVariables.secondaryColor
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: svgIcon),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLoginSelected = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          child: CustomPaint(
                            painter: ModernButton(
                                isLoginSelected,
                                true,
                                isLoginSelected
                                    ? GlobalVariables.secondaryColor
                                    : GlobalVariables.backgroundColor),
                            size: const Size(100, 50),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: isLoginSelected
                                          ? GlobalVariables.backgroundColor
                                          : GlobalVariables.secondaryColor),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLoginSelected = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          child: CustomPaint(
                            painter: ModernButton(
                                isLoginSelected,
                                false,
                                !isLoginSelected
                                    ? GlobalVariables.secondaryColor
                                    : GlobalVariables.backgroundColor),
                            size: const Size(100, 50),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: !isLoginSelected
                                          ? GlobalVariables.backgroundColor
                                          : GlobalVariables.secondaryColor),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              isLoginSelected ? LoginSection() : SignupSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButtons(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              child: const Divider(
                color: GlobalVariables.greyBackgroundCOlor,
                thickness: 1,
              ),
            ),
            const SizedBox(
              width: 5,
            ), // Adjust spacing as needed
            const Text(
              "or",
              style: TextStyle(
                color: GlobalVariables.greyBackgroundCOlor,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ), // Adjust spacing as needed
            Container(
              width: 20,
              child: const Divider(
                color: GlobalVariables.greyBackgroundCOlor,
                thickness: 1,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                label: Center(
                  child: Text('Username/Email'),
                ),
              ),
            ),
            //SizedBox(height: 5),
            TextFormField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Center(
                child: Text('Password'),
              )),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                    //margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 0.5,
                            color: GlobalVariables.greyBackgroundCOlor),
                        left: BorderSide(
                            width: 0.5,
                            color: GlobalVariables.greyBackgroundCOlor),
                        right: BorderSide(
                            width: 0.5,
                            color: GlobalVariables.greyBackgroundCOlor),
                        bottom: BorderSide(
                            width: 0.5,
                            color: GlobalVariables.greyBackgroundCOlor),
                      ),
                    ),
                    width: 20,
                    height: 20,
                    child: const Checkbox(
                      value: true,
                      checkColor: GlobalVariables.greyBackgroundCOlor,
                      onChanged: null,
                      fillColor: MaterialStatePropertyAll(Colors.transparent),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Remember me',
                      style:
                          TextStyle(color: GlobalVariables.greyBackgroundCOlor),
                    )),
              ],
            ),
            const SizedBox(height: 10), // Adjust spacing as needed
            ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(10),
                shadowColor: const MaterialStatePropertyAll(
                    GlobalVariables.secondaryColor),
                shape: const MaterialStatePropertyAll(
                    BeveledRectangleBorder(borderRadius: BorderRadius.zero)),
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 36)),
              ),
              onPressed: () {
                // Handle button press
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Forgot password?',
                style: TextStyle(
                    color: GlobalVariables.greyBackgroundCOlor,
                    decoration: TextDecoration.underline))
          ]),
        ),
      ],
    );
  }
}

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30, // Adjust the radius as needed
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage('assets/avatar.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle the upload picture action
                      },
                      child: const CircleAvatar(
                        radius: 10, // Adjust the radius as needed
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: GlobalVariables.secondaryColor,
                        ),
                      ),
                    ),
                    // child: IconButton(
                    //   icon: Icon(
                    //     Icons.camera_alt,
                    //     color: Colors.white,
                    //   ),
                    //   onPressed: () {
                    //     // Handle the upload picture action
                    //   },
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            label: Center(
              child: Text('Username/Email'),
            ),
          ),
        ),
        //SizedBox(height: 5),
        TextFormField(
          textAlign: TextAlign.center,
          obscureText: true,
          decoration: const InputDecoration(
              label: Center(
            child: Text('Password'),
          )),
        ),
        const SizedBox(
          height: 8,
        ),
        CountryDropdown(),
        ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(10),
            shadowColor:
                const MaterialStatePropertyAll(GlobalVariables.secondaryColor),
            shape: const MaterialStatePropertyAll(
                BeveledRectangleBorder(borderRadius: BorderRadius.zero)),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 36)),
          ),
          onPressed: () {
            // Handle button press
          },
          child: const Text(
            'Signup',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}

//canva buttons
class ModernButton extends CustomPainter {
  final bool isSelected;
  final bool isLeftButton;
  final Color buttonColor;

  ModernButton(
    this.isSelected,
    this.isLeftButton,
    this.buttonColor,
  );
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = buttonColor;

    Path path = Path();
    path.moveTo(0, -size.height * 0.6);
    path.quadraticBezierTo(
        (size.width * 0.5), size.height * 0.1, size.width, 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    if (!isLeftButton) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//social icons
class SocialLoginButtons extends StatelessWidget {
  final List<String> imageUrls = [
    'https://img.icons8.com/external-tal-revivo-color-tal-revivo/96/external-linkedin-a-business-and-employment-oriented-service-mobile-app-logo-color-tal-revivo.png',
    'https://img.icons8.com/fluency/96/google-logo.png',
    'https://img.icons8.com/ios-filled/100/228BE6/facebook-f.png',
    'https://img.icons8.com/material-outlined/96/000000/twitterx--v2.png',
    'https://img.icons8.com/external-tal-revivo-color-tal-revivo/96/external-pinterest-a-social-media-web-and-mobile-application-company-logo-color-tal-revivo.png'
  ];

  SocialLoginButtons({super.key});

  Widget build(BuildContext context) {
    return Container(
      height: 70, // Adjust the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var url in imageUrls)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              width: 35,
              height: 35,
              child: Container(
                // width: 30,
                // height: 30,
                decoration: BoxDecoration(
                  //color: Colors.white,

                  image: DecorationImage(
                    image: NetworkImage(url),

                    //fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

//list of countries
class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  TextEditingController phoneNumberController = TextEditingController();
  String selectedCountry = 'USA (+1)';

  List<String> countries = [
    'USA (+1)',
    'PK (+92)',
    'CAN (+1)',
    'UK (+44)',
    'AUS (+61)',
    // Add more countries as needed
  ];

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Icon(Icons.flag),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
              items: countries.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            ),
            const Icon(Icons.phone),
            //SizedBox(width: 1),
            Expanded(
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    isDense: true, contentPadding: EdgeInsets.all(5)
                    //hintText: 'Enter phone number',
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
