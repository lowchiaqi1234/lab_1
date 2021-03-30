import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  String title;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _validateSample(String value) {
    if (value.trim().isEmpty) {
      return 'This field should not be empty';
    }
    return null;
  }

  TextEditingController ageTextEditingControllers = new TextEditingController();
  TextEditingController heightTextEditingControllers =
      new TextEditingController();
  TextEditingController weightTextEditingControllers =
      new TextEditingController();
  TextEditingController waistTextEditingControllers =
      new TextEditingController();
  double absizscore = 0.0;
  double absi = 0.0;
  List<String> _genders = ['Male', 'Female'];
  String _selectedGender;
  String zscore = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[400],
            title: Text(
              'ABSI Calculator',
              style: TextStyle(
                color: Colors.green[50],
                fontSize: 25,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Container(
              width: 500,
              child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " \t\t\t\t\t\t\t\t\t     Sex",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]),
                Container(
                  width: 200,
                  height: 40,
                  child: DropdownButton(
                    hint: Text('Please choose your sex'),
                    value: _selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    items: _genders.map((genders) {
                      return DropdownMenuItem(
                        child: new Text(genders),
                        value: genders,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    autovalidate: true,
                    controller: ageTextEditingControllers,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Age (Year)',
                    ),
                    validator: _validateSample,
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    autovalidate: true,
                    controller: heightTextEditingControllers,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Height (m)',
                    ),
                    validator: _validateSample,
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    autovalidate: true,
                    controller: weightTextEditingControllers,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Weight (kg)',
                    ),
                    validator: _validateSample,
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    autovalidate: true,
                    controller: waistTextEditingControllers,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Waist Circumference (m)',
                    ),
                    validator: _validateSample,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 40,
                    ),
                    RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () => calculate(1),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 60,
                    ),
                    Text("ABSI              : " + absi.toStringAsFixed(5),
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                    ),
                    Text("ABSI z score :" + absizscore.toStringAsFixed(3),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                    ),
                    Text("Your premature mortality risk is",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                    ),
                    Text(zscore.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.indigo[700],
                          fontSize: 20,
                        )),
                  ],
                ),
              ]),
            )),
          )),
    );
  }

  calculate(int i) {
    setState(() {
      int age = int.parse(ageTextEditingControllers.text);
      double height = double.parse(heightTextEditingControllers.text);
      double weight = double.parse(weightTextEditingControllers.text);
      double waist = double.parse(waistTextEditingControllers.text);

      absi = waist /
          ((pow(weight / (height * height), 2/3)) * pow(height, 1/2));
      print(absi);

      if (_selectedGender == "Male") {
        if (age == 2) {
          absizscore = (absi - 0.07890) / 0.00384;
        } else if (age == 3) {
          absizscore = (absi - 0.07915) / 0.00384;
        } else if (age == 4) {
          absizscore = (absi - 0.07937) / 0.00383;
        } else if (age == 5) {
          absizscore = (absi - 0.07955) / 0.00383;
        } else if (age == 6) {
          absizscore = (absi - 0.07964) / 0.00382;
        } else if (age == 7) {
          absizscore = (absi - 0.07966) / 0.00382;
        } else if (age == 8) {
          absizscore = (absi - 0.07958) / 0.0382;
        } else if (age == 9) {
          absizscore = (absi - 0.07942) / 0.00381;
        } else if (age == 10) {
          absizscore = (absi - 0.07917) / 0.00381;
        } else if (age == 11) {
          absizscore = (absi - 0.07886) / 0.00381;
        } else if (age == 12) {
          absizscore = (absi - 0.07849) / 0.00380;
        } else if (age == 13) {
          absizscore = (absi - 0.07810) / 0.00380;
        } else if (age == 14) {
          absizscore = (absi - 0.07772) / 0.00380;
        } else if (age == 15) {
          absizscore = (absi - 0.07739) / 0.00379;
        } else if (age == 16) {
          absizscore = (absi - 0.07716) / 0.00379;
        } else if (age == 17) {
          absizscore = (absi - 0.07703) / 0.00378;
        } else if (age == 18) {
          absizscore = (absi - 0.07702) / 0.00378;
        } else if (age == 19) {
          absizscore = (absi - 0.07711) / 0.00378;
        } else if (age == 20) {
          absizscore = (absi - 0.07728) / 0.00377;
        } else if (age == 21) {
          absizscore = (absi - 0.07750) / 0.00377;
        } else if (age == 22) {
          absizscore = (absi - 0.07777) / 0.00377;
        } else if (age == 23) {
          absizscore = (absi - 0.07804) / 0.00376;
        } else if (age == 24) {
          absizscore = (absi - 0.07831) / 0.00376;
        } else if (age == 25) {
          absizscore = (absi - 0.07858) / 0.00376;
        } else if (age == 26) {
          absizscore = (absi - 0.07882) / 0.00375;
        } else if (age == 27) {
          absizscore = (absi - 0.07904) / 0.00375;
        } else if (age == 28) {
          absizscore = (absi - 0.07922) / 0.00374;
        } else if (age == 29) {
          absizscore = (absi - 0.07938) / 0.00374;
        } else if (age == 30) {
          absizscore = (absi - 0.07951) / 0.00374;
        } else if (age == 31) {
          absizscore = (absi - 0.07963) / 0.00373;
        } else if (age == 32) {
          absizscore = (absi - 0.07975) / 0.00373;
        } else if (age == 33) {
          absizscore = (absi - 0.07988) / 0.00373;
        } else if (age == 34) {
          absizscore = (absi - 0.08000) / 0.00372;
        } else if (age == 35) {
          absizscore = (absi - 0.08013) / 0.00372;
        } else if (age == 36) {
          absizscore = (absi - 0.08027) / 0.00371;
        } else if (age == 37) {
          absizscore = (absi - 0.08042) / 0.00371;
        } else if (age == 38) {
          absizscore = (absi - 0.08057) / 0.00371;
        } else if (age == 39) {
          absizscore = (absi - 0.08072) / 0.00370;
        } else if (age == 40) {
          absizscore = (absi - 0.08087) / 0.00370;
        } else if (age == 41) {
          absizscore = (absi - 0.08102) / 0.00370;
        } else if (age == 42) {
          absizscore = (absi - 0.08117) / 0.00369;
        } else if (age == 43) {
          absizscore = (absi - 0.08132) / 0.00369;
        } else if (age == 44) {
          absizscore = (absi - 0.08148) / 0.00368;
        } else if (age == 45) {
          absizscore = (absi - 0.08165) / 0.00368;
        } else if (age == 46) {
          absizscore = (absi - 0.08183) / 0.00368;
        } else if (age == 47) {
          absizscore = (absi - 0.08201) / 0.00367;
        } else if (age == 48) {
          absizscore = (absi - 0.08221) / 0.00367;
        } else if (age == 49) {
          absizscore = (absi - 0.08240) / 0.00367;
        } else if (age == 50) {
          absizscore = (absi - 0.08260) / 0.00366;
        } else if (age == 51) {
          absizscore = (absi - 0.08279) / 0.00366;
        } else if (age == 52) {
          absizscore = (absi - 0.08297) / 0.00365;
        } else if (age == 53) {
          absizscore = (absi - 0.08315) / 0.00365;
        } else if (age == 54) {
          absizscore = (absi - 0.08334) / 0.00365;
        } else if (age == 55) {
          absizscore = (absi - 0.08352) / 0.00364;
        } else if (age == 56) {
          absizscore = (absi - 0.08369) / 0.00364;
        } else if (age == 57) {
          absizscore = (absi - 0.08386) / 0.00364;
        } else if (age == 58) {
          absizscore = (absi - 0.08403) / 0.00363;
        } else if (age == 59) {
          absizscore = (absi - 0.08419) / 0.00363;
        } else if (age == 60) {
          absizscore = (absi - 0.08436) / 0.00362;
        } else if (age == 61) {
          absizscore = (absi - 0.08454) / 0.00362;
        } else if (age == 62) {
          absizscore = (absi - 0.08471) / 0.00362;
        } else if (age == 63) {
          absizscore = (absi - 0.08489) / 0.00361;
        } else if (age == 64) {
          absizscore = (absi - 0.08506) / 0.00361;
        } else if (age == 65) {
          absizscore = (absi - 0.08522) / 0.00360;
        } else if (age == 66) {
          absizscore = (absi - 0.08537) / 0.00360;
        } else if (age == 67) {
          absizscore = (absi - 0.08551) / 0.00360;
        } else if (age == 68) {
          absizscore = (absi - 0.08565) / 0.00359;
        } else if (age == 69) {
          absizscore = (absi - 0.08578) / 0.00359;
        } else if (age == 70) {
          absizscore = (absi - 0.08591) / 0.00359;
        } else if (age == 71) {
          absizscore = (absi - 0.08604) / 0.00358;
        } else if (age == 72) {
          absizscore = (absi - 0.08616) / 0.00358;
        } else if (age == 73) {
          absizscore = (absi - 0.08629) / 0.00357;
        } else if (age == 74) {
          absizscore = (absi - 0.08641) / 0.00357;
        } else if (age == 75) {
          absizscore = (absi - 0.08653) / 0.00357;
        } else if (age == 76) {
          absizscore = (absi - 0.08665) / 0.00356;
        } else if (age == 77) {
          absizscore = (absi - 0.08675) / 0.00356;
        } else if (age == 78) {
          absizscore = (absi - 0.08685) / 0.00355;
        } else if (age == 79) {
          absizscore = (absi - 0.08695) / 0.00355;
        } else if (age == 80) {
          absizscore = (absi - 0.08705) / 0.00355;
        } else if (age == 81) {
          absizscore = (absi - 0.08714) / 0.00354;
        } else if (age == 82) {
          absizscore = (absi - 0.08723) / 0.00354;
        } else if (age == 83) {
          absizscore = (absi - 0.08732) / 0.00354;
        } else if (age == 84) {
          absizscore = (absi - 0.08742) / 0.00353;
        } else if (age == 85) {
          absizscore = (absi - 0.08811) / 0.00356;
        }
        if (absizscore < -0.868) {
          zscore = " Very low ";
        } else if (absizscore >= -0.868 && absizscore < -0.272) {
          zscore = " Low ";
        } else if (absizscore >= -0.272 && absizscore < 0.229) {
          zscore = " Average ";
        } else if (absizscore >= 0.229 && absizscore < 0.798) {
          zscore = " High !! ";
        } else if (absizscore >= 0.798) {
          zscore = " Very High !!! ";
        }
        print(zscore);
        print(absizscore);
      } else if (_selectedGender == "Female") {
        if (age == 2) {
          absizscore = (absi - 0.08031) / 0.00363;
        } else if (age == 3) {
          absizscore = (absi - 0.08016) / 0.00366;
        } else if (age == 4) {
          absizscore = (absi - 0.08001) / 0.00369;
        } else if (age == 5) {
          absizscore = (absi - 0.07985) / 0.00372;
        } else if (age == 6) {
          absizscore = (absi - 0.07969) / 0.00375;
        } else if (age == 7) {
          absizscore = (absi - 0.07952) / 0.00378;
        } else if (age == 8) {
          absizscore = (absi - 0.07935) / 0.00380;
        } else if (age == 9) {
          absizscore = (absi - 0.07917) / 0.00383;
        } else if (age == 10) {
          absizscore = (absi - 0.07899) / 0.00386;
        } else if (age == 11) {
          absizscore = (absi - 0.07881) / 0.00389;
        } else if (age == 12) {
          absizscore = (absi - 0.07863) / 0.00392;
        } else if (age == 13) {
          absizscore = (absi - 0.07846) / 0.00395;
        } else if (age == 14) {
          absizscore = (absi - 0.07829) / 0.00397;
        } else if (age == 15) {
          absizscore = (absi - 0.07814) / 0.00400;
        } else if (age == 16) {
          absizscore = (absi - 0.07799) / 0.00403;
        } else if (age == 17) {
          absizscore = (absi - 0.07787) / 0.00406;
        } else if (age == 18) {
          absizscore = (absi - 0.07775) / 0.00408;
        } else if (age == 19) {
          absizscore = (absi - 0.07765) / 0.00411;
        } else if (age == 20) {
          absizscore = (absi - 0.07757) / 0.00414;
        } else if (age == 21) {
          absizscore = (absi - 0.07750) / 0.00416;
        } else if (age == 22) {
          absizscore = (absi - 0.07744) / 0.00419;
        } else if (age == 23) {
          absizscore = (absi - 0.07740) / 0.00422;
        } else if (age == 24) {
          absizscore = (absi - 0.07737) / 0.00424;
        } else if (age == 25) {
          absizscore = (absi - 0.07735) / 0.00427;
        } else if (age == 26) {
          absizscore = (absi - 0.07734) / 0.00429;
        } else if (age == 27) {
          absizscore = (absi - 0.07735) / 0.00432;
        } else if (age == 28) {
          absizscore = (absi - 0.07736) / 0.00435;
        } else if (age == 29) {
          absizscore = (absi - 0.07739) / 0.00437;
        } else if (age == 30) {
          absizscore = (absi - 0.07743) / 0.00440;
        } else if (age == 31) {
          absizscore = (absi - 0.07747) / 0.00442;
        } else if (age == 32) {
          absizscore = (absi - 0.07752) / 0.00445;
        } else if (age == 33) {
          absizscore = (absi - 0.07759) / 0.00447;
        } else if (age == 34) {
          absizscore = (absi - 0.07766) / 0.00450;
        } else if (age == 35) {
          absizscore = (absi - 0.07773) / 0.00452;
        } else if (age == 36) {
          absizscore = (absi - 0.07782) / 0.00454;
        } else if (age == 37) {
          absizscore = (absi - 0.07790) / 0.00457;
        } else if (age == 38) {
          absizscore = (absi - 0.07800) / 0.00459;
        } else if (age == 39) {
          absizscore = (absi - 0.07810) / 0.00462;
        } else if (age == 40) {
          absizscore = (absi - 0.07820) / 0.00464;
        } else if (age == 41) {
          absizscore = (absi - 0.07831) / 0.00466;
        } else if (age == 42) {
          absizscore = (absi - 0.07842) / 0.00469;
        } else if (age == 43) {
          absizscore = (absi - 0.07854) / 0.00471;
        } else if (age == 44) {
          absizscore = (absi - 0.07866) / 0.00473;
        } else if (age == 45) {
          absizscore = (absi - 0.07879) / 0.00476;
        } else if (age == 46) {
          absizscore = (absi - 0.07892) / 0.00478;
        } else if (age == 47) {
          absizscore = (absi - 0.07905) / 0.00480;
        } else if (age == 48) {
          absizscore = (absi - 0.07919) / 0.00483;
        } else if (age == 49) {
          absizscore = (absi - 0.07933) / 0.00485;
        } else if (age == 50) {
          absizscore = (absi - 0.07947) / 0.00487;
        } else if (age == 51) {
          absizscore = (absi - 0.07962) / 0.00489;
        } else if (age == 52) {
          absizscore = (absi - 0.07977) / 0.00492;
        } else if (age == 53) {
          absizscore = (absi - 0.07992) / 0.00494;
        } else if (age == 54) {
          absizscore = (absi - 0.08007) / 0.00496;
        } else if (age == 55) {
          absizscore = (absi - 0.08023) / 0.00498;
        } else if (age == 56) {
          absizscore = (absi - 0.08039) / 0.00501;
        } else if (age == 57) {
          absizscore = (absi - 0.08055) / 0.00503;
        } else if (age == 58) {
          absizscore = (absi - 0.08072) / 0.00505;
        } else if (age == 59) {
          absizscore = (absi - 0.08088) / 0.00507;
        } else if (age == 60) {
          absizscore = (absi - 0.08105) / 0.00509;
        } else if (age == 61) {
          absizscore = (absi - 0.08122) / 0.00511;
        } else if (age == 62) {
          absizscore = (absi - 0.08139) / 0.00514;
        } else if (age == 63) {
          absizscore = (absi - 0.08156) / 0.00516;
        } else if (age == 64) {
          absizscore = (absi - 0.08174) / 0.00518;
        } else if (age == 65) {
          absizscore = (absi - 0.08191) / 0.00520;
        } else if (age == 66) {
          absizscore = (absi - 0.08208) / 0.00522;
        } else if (age == 67) {
          absizscore = (absi - 0.08226) / 0.00524;
        } else if (age == 68) {
          absizscore = (absi - 0.08243) / 0.005263;
        } else if (age == 69) {
          absizscore = (absi - 0.08261) / 0.00528;
        } else if (age == 70) {
          absizscore = (absi - 0.08278) / 0.00530;
        } else if (age == 71) {
          absizscore = (absi - 0.08296) / 0.00533;
        } else if (age == 72) {
          absizscore = (absi - 0.08313) / 0.00535;
        } else if (age == 73) {
          absizscore = (absi - 0.08330) / 0.00537;
        } else if (age == 74) {
          absizscore = (absi - 0.08346) / 0.00539;
        } else if (age == 75) {
          absizscore = (absi - 0.08363) / 0.00541;
        } else if (age == 76) {
          absizscore = (absi - 0.08380) / 0.00543;
        } else if (age == 77) {
          absizscore = (absi - 0.08396) / 0.00545;
        } else if (age == 78) {
          absizscore = (absi - 0.08412) / 0.00547;
        } else if (age == 79) {
          absizscore = (absi - 0.08428) / 0.00549;
        } else if (age == 80) {
          absizscore = (absi - 0.08444) / 0.00551;
        } else if (age == 81) {
          absizscore = (absi - 0.08460) / 0.00553;
        } else if (age == 82) {
          absizscore = (absi - 0.08476) / 0.00555;
        } else if (age == 83) {
          absizscore = (absi - 0.08492) / 0.00557;
        } else if (age == 84) {
          absizscore = (absi - 0.08508) / 0.00559;
        } else if (age == 85) {
          absizscore = (absi - 0.08533) / 0.00528;
        }
        if (absizscore < -0.868) {
          zscore = " Very low ";
        } else if (absizscore >= -0.868 && absizscore < -0.272) {
          zscore = " Low ";
        } else if (absizscore >= -0.272 && absizscore < 0.229) {
          zscore = " Average ";
        } else if (absizscore >= 0.229 && absizscore < 0.798) {
          zscore = " High !! ";
        } else if (absizscore >= 0.798) {
          zscore = " Very High !!! ";
        }
        print(zscore);
        print(absizscore);
      }
    });
  }
}
