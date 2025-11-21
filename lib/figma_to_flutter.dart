import 'package:flutter/material.dart';

class FigmaToFlutter extends StatefulWidget {
  const FigmaToFlutter({super.key});

  @override
  State<FigmaToFlutter> createState() => _FigmaToFlutterState();
}

class _FigmaToFlutterState extends State<FigmaToFlutter> {

  final TextEditingController figmaWidthController = TextEditingController();
  final TextEditingController figmaHeightController = TextEditingController();

  final TextEditingController mobileWidthController = TextEditingController();
  final TextEditingController mobileHeightController = TextEditingController();

  final TextEditingController figmaValueWidthController = TextEditingController();
  final TextEditingController figmaValueHeightController = TextEditingController();
  final TextEditingController figmaFontSizeController = TextEditingController();


  double? responsiveWidth;
  double? responsiveHeight;
  double? responsiveFont;

  void calculate() {
    if (figmaWidthController.text.isEmpty ||
        figmaHeightController.text.isEmpty ||
        mobileWidthController.text.isEmpty ||
        mobileHeightController.text.isEmpty ||
        figmaValueWidthController.text.isEmpty ||
        figmaValueHeightController.text.isEmpty ||
        figmaFontSizeController.text.isEmpty) {
      return;
    }

    double figmaWidth = double.parse(figmaWidthController.text);
    double figmaHeight = double.parse(figmaHeightController.text);
    double mobileWidth = double.parse(mobileWidthController.text);
    double mobileHeight = double.parse(mobileHeightController.text);

    double figmaValueWidth = double.parse(figmaValueWidthController.text);
    double figmaValueHeight = double.parse(figmaValueHeightController.text);
    double figmaFontSize = double.parse(figmaFontSizeController.text);

    setState(() {
      responsiveWidth = (mobileWidth / figmaWidth) * figmaValueWidth;
      responsiveHeight = (mobileHeight / figmaHeight) * figmaValueHeight;
      responsiveFont =
          ((mobileWidth / figmaWidth) + (mobileHeight / figmaHeight)) / 2 * figmaFontSize;
    });
  }


  Widget inputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFFFFFF), Color(0xffF6D901)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Flutter Calculator',
                style: TextStyle(fontSize: 45, color: Color(0xff000000)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 60,),
                Column(
                  children: [
                    SizedBox(height: 60,),
                    SizedBox(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          input(270, figmaHeightController, () {}, () {
                            FocusScope.of(context).nextFocus();
                          }, 'Figma height (px)'),
                          input(
                            270,
                            figmaWidthController,
                                () {

                            },
                                () {FocusScope.of(context).nextFocus();},
                            'Figma Width (px)',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          input(270, mobileHeightController, () {}, () {
                            FocusScope.of(context).nextFocus();
                          }, 'Mobile Height (px)'),
                          input(
                            270,
                            mobileWidthController,
                                () {

                            },
                                () { FocusScope.of(context).nextFocus();},
                            'Mobile width (px)',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          input(170, figmaValueHeightController, () {}, () {
                            FocusScope.of(context).nextFocus();
                          }, 'Height (px)'),
                          input(
                            170,
                            figmaValueWidthController,
                                () {

                            },
                                () {FocusScope.of(context).nextFocus();},
                            'width (px)',
                          ),
                          input(
                            170,
                            figmaFontSizeController,
                                () {

                            },
                                () {FocusScope.of(context).nextFocus();},
                            'Font size (px)',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff000000),
                          ),
                          onPressed: (){
                            calculate();
                          }, child: Text('Calculate',style: TextStyle(color: Color(0xffFFFFFF)),)),
                  ],
                ),
                SizedBox(width: 40,),
                SizedBox(
                  height: 500,
                  child: VerticalDivider(color: Color(0xff000000)),
                ),
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Results',
                      style: TextStyle(fontSize: 35, color: Color(0xff000000)),
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Text(
                          'Height   = ',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                        SizedBox(width: 50,),
                        Text(
                          '${responsiveHeight?.toInt() ?? ""}',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Text(
                          'Width   = ',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                        SizedBox(width: 50,),
                        Text(
                          '${responsiveWidth?.toInt() ?? ""}',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Text(
                          'Font size   = ',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                        SizedBox(width: 50,),
                        Text(
                          '${responsiveFont?.toInt() ?? ""}',
                          style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget input(
      double width,
      TextEditingController controller,
      VoidCallback onTap,
      VoidCallback onEditingComplete,
      String text,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 20, color: Color(0xff000000))),
        SizedBox(height: 10),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffFFFFFF),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
