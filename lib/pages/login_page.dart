import 'package:contapp/config/providers/user_provider.dart';
import 'package:contapp/design/errors.dart';
import 'package:contapp/pages/helper/validate_input.dart';
import 'package:flutter/material.dart';
import 'package:contapp/config/app_routes.dart';
import 'package:contapp/design/colors.dart';
import 'package:contapp/design/copys.dart';
import 'package:contapp/design/radius.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  var userInputController = TextEditingController();
  late String userName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultContainerInputDecoration = const BoxDecoration(
      color: SysifosColors.brandSecondaryColor,
      borderRadius: BorderRadius.all(SysifosRadius.small));
  final activeContainerInputDecoration = BoxDecoration(
      color: SysifosColors.brandSecondaryColor,
      border: Border.all(color: SysifosColors.brandPrimaryColor, width: 2),
      borderRadius: const BorderRadius.all(SysifosRadius.small));
  final defaultInputLabelTheme = const TextStyle(
      fontSize: 13,
      color: SysifosColors.brandLigthDarkColor,
      fontWeight: FontWeight.normal);
  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 100, 16, 0),
            child: Column(children: [
              Text(
                SysifosCopys.hello,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 20),
                child: Text(
                  SysifosCopys.lorem,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                  key: _formLoginKey,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(left: 24, bottom: 4),
                        decoration: userContainerDecoration,
                        child: TextFormField(
                            key: const Key('input-name'),
                            controller: userInputController,
                            style: Theme.of(context).textTheme.labelSmall,
                            validator: (value) => validateInput(value),
                            onTap: () {
                              setState(() {
                                userContainerDecoration =
                                    activeContainerInputDecoration;
                                pswContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                userContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onSaved: (userNameValue) {
                              userName = userNameValue!;
                            },
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label: Text(SysifosCopys.userInputLabel,
                                    style: defaultInputLabelTheme))),
                      ),
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(left: 24, bottom: 4),
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        decoration: pswContainerDecoration,
                        child: TextFormField(
                            key: const Key('input-psw'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return SysifosErrors.userPsw;
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
                                pswContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label:
                                    const Text(SysifosCopys.userPswInputLabel),
                                labelStyle: defaultInputLabelTheme)),
                      ),
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
                          const Expanded(child: Text(SysifosCopys.rememberMe)),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              SysifosCopys.recoveryPassword,
                              style: defaultInputLabelTheme,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 25),
                        width: 394,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formLoginKey.currentState!.validate()) {
                              // _formLoginKey.currentState!.save();
                              userName = userInputController.text;
                              UserProvider.of(context).userData.name = userName;
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.home);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SysifosColors.brandPrimaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(SysifosRadius.small)),
                          ),
                          child: const Text(SysifosCopys.logIn,
                              style: TextStyle(
                                  color: SysifosColors.brandLightColor,
                                  fontSize: 20,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: SysifosColors.brandLightColorBorder,
                            thickness: 1.0,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(SysifosCopys.orContinue),
                          ),
                          Expanded(
                              child: Divider(
                            color: SysifosColors.brandLightColorBorder,
                            thickness: 1.0,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 42,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 189,
                            height: 69,
                            decoration: const BoxDecoration(
                                color: SysifosColors.brandSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(SysifosRadius.small)),
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
                                borderRadius:
                                    BorderRadius.all(SysifosRadius.small)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
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
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(SysifosCopys.notAMember),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('sigin-page');
                              },
                              child: const Text(
                                SysifosCopys.registerNow,
                                style: TextStyle(
                                    color: SysifosColors.brandPrimaryColor,
                                    fontSize: 13),
                              ))
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
