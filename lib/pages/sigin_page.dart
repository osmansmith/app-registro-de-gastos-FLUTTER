import 'package:contapp/design/colors.dart';
import 'package:contapp/design/radius.dart';
import 'package:flutter/material.dart';
import 'package:contapp/design/copys.dart';

class SigInPage extends StatefulWidget {
  const SigInPage({super.key});

  @override
  State<SigInPage> createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> {
  var checkBoxState = false;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultContainerInputDecoration = const BoxDecoration(
      color: SysifosColors.brandSecondaryColor,
      borderRadius: BorderRadius.all(SysifosRadius.small));
  final defaultInputBorder = InputBorder.none;
  final defaultInputLabelTheme = const TextStyle(
      fontSize: 13,
      color: SysifosColors.brandLigthDarkColor,
      fontWeight: FontWeight.w400);
  final activeContainerInputDecoration = BoxDecoration(
      color: SysifosColors.brandSecondaryColor,
      border: Border.all(color: SysifosColors.brandPrimaryColor, width: 2),
      borderRadius: const BorderRadius.all(SysifosRadius.small));
  var userInputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 16),
              child: Text(
                SysifosCopys.sigIn,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 16, top: 18, right: 16),
              child: Text(
                SysifosCopys.lorem,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 189,
                    height: 69,
                    decoration: const BoxDecoration(
                        color: SysifosColors.brandSecondaryColor,
                        borderRadius: BorderRadius.all(SysifosRadius.small)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/google.png'),
                          width: 30,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          SysifosCopys.google,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: SysifosColors.brandLigthDarkColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 189,
                    height: 69,
                    decoration: const BoxDecoration(
                        color: SysifosColors.brandSecondaryColor,
                        borderRadius: BorderRadius.all(SysifosRadius.small)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 30,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          SysifosCopys.facebook,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: SysifosColors.brandLigthDarkColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: SysifosColors.brandLightColorBorder,
                    thickness: 1.0,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(SysifosCopys.or),
                  ),
                  Expanded(
                      child: Divider(
                    color: SysifosColors.brandLightColorBorder,
                    thickness: 1.0,
                  )),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      padding: const EdgeInsets.only(left: 24),
                      decoration: userContainerDecoration,
                      child: TextFormField(
                          controller: userInputController,
                          style: Theme.of(context).textTheme.labelSmall,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return WeinFluErrors.userError;
                            }
                            if (value!.length >= 10) {
                              // return WeinFluErrors.userErrorLen;
                              return 'supera el maximo';
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              pswContainerDecoration =
                                  activeContainerInputDecoration;
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onTapOutside: (event) {
                            setState(() {
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onSaved: (userNameValue) {},
                          decoration: InputDecoration(
                              border: defaultInputBorder,
                              label: Text(SysifosCopys.userInputLabel,
                                  style: defaultInputLabelTheme))),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 64,
                      padding: const EdgeInsets.only(left: 24, bottom: 4),
                      decoration: userContainerDecoration,
                      child: TextFormField(
                          controller: userInputController,
                          style: Theme.of(context).textTheme.labelSmall,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return WeinFluErrors.userError;
                            }
                            if (value!.length >= 10) {
                              // return WeinFluErrors.userErrorLen;
                              return 'supera el maximo';
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              pswContainerDecoration =
                                  activeContainerInputDecoration;
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onTapOutside: (event) {
                            setState(() {
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onSaved: (userNameValue) {},
                          decoration: InputDecoration(
                              border: defaultInputBorder,
                              label: Text(SysifosCopys.nameInputLabel,
                                  style: defaultInputLabelTheme))),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 64,
                      padding: const EdgeInsets.only(left: 24, bottom: 4),
                      decoration: userContainerDecoration,
                      child: TextFormField(
                          controller: userInputController,
                          style: Theme.of(context).textTheme.labelSmall,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return WeinFluErrors.userError;
                            }
                            if (value!.length >= 10) {
                              // return WeinFluErrors.userErrorLen;
                              return 'supera el maximo';
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              pswContainerDecoration =
                                  activeContainerInputDecoration;
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onTapOutside: (event) {
                            setState(() {
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            });
                          },
                          onSaved: (userNameValue) {},
                          decoration: InputDecoration(
                              border: defaultInputBorder,
                              label: Text(SysifosCopys.userPswInputLabel,
                                  style: defaultInputLabelTheme))),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          value: checkBoxState,
                          onChanged: (value) {
                            setState(() {
                              checkBoxState = !checkBoxState;
                            });
                          },
                          checkColor: SysifosColors.brandSecondaryColor,
                          activeColor: SysifosColors.brandPrimaryColor,
                        ),
                        const Text(SysifosCopys.terms),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      width: 398,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SysifosColors.brandPrimaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(SysifosRadius.small)),
                        ),
                        child: const Text(SysifosCopys.getStarted,
                            style: TextStyle(
                                color: SysifosColors.brandLightColor,
                                fontSize: 20,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: SysifosColors.brandLightColorBorder,
                  thickness: 1.5,
                )),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(SysifosCopys.alreadyHave),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login-page');
                    },
                    child: const Text(
                      SysifosCopys.logIn,
                      style: TextStyle(
                          color: SysifosColors.brandPrimaryColor, fontSize: 13),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
