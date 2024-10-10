import 'package:contapp/design/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBarTitle extends StatelessWidget {
  final String storeName;
  const HomeAppBarTitle({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 12),
        decoration: const BoxDecoration(
            color: Colors.black12,
            image: DecorationImage(image: AssetImage('assets/images/user.png')),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      Expanded(
        child: Text(
          storeName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      ContainerHeaderIcon(
          configMargin: const EdgeInsets.only(right: 12),
          iconButton: IconButton(
              onPressed: () => print('presionaron icono notificaciones'),
              icon: const Icon(
                Icons.notifications,
                color: SysifosColors.brandPrimaryColor,
              ))),
      ContainerHeaderIcon(
          iconButton: IconButton(
              onPressed: () => print('presionaron icono notificaciones'),
              icon: const Icon(
                Icons.more_vert,
                color: SysifosColors.brandPrimaryColor,
              ))),
    ]);
  }
}

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon(
      {super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
          border: Border.all(
            color: SysifosColors.brandSecondaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: iconButton,
    );
  }
}
