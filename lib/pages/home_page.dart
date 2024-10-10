import 'dart:developer';

import 'package:contapp/config/app_routes.dart';
import 'package:contapp/config/providers/user_provider.dart';
import 'package:contapp/design/colors.dart';
import 'package:contapp/design/radius.dart';
import 'package:contapp/widgets/custom_money_display.dart';
import 'package:contapp/widgets/home_app_bar_title.dart';
import 'package:contapp/widgets/summary_card.dart';
import 'package:contapp/widgets/transactions.dart';
import 'package:flutter/material.dart';
import 'package:contapp/widgets/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentDetailWidget = const CategoriesWidget();
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: SysifosColors.brandLightColor,
      shadowColor: SysifosColors.brandLightColor);
  var buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: SysifosColors.brandSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ));
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionsBtnStyle;
  late Color midCategoriesStateColor;
  late Color midRecentsStateColor;
  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionsBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 97,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: SysifosRadius.small,
                  bottomRight: SysifosRadius.small)),
          backgroundColor: SysifosColors.brandLightColor,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(16, 45, 16, 12),
            child: HomeAppBarTitle(
              storeName: UserProvider.of(context).userData.name,
            ),
          ),
        ),
        body: Column(
          children: [
            const TopHomePageBody(),
            MidHomePageBody(
              categorieBtnStyle: categorieBtnStyle,
              recentTransactionsBtnStyle: recentTransactionsBtnStyle,
              midCategoriesStateColor: SysifosColors.brandDarkColor,
              midRecentsStateColor: SysifosColors.brandLigthDarkColor,
              categorieBtnAction: () => {
                setState(() {
                  currentDetailWidget = const CategoriesWidget();
                  categorieBtnStyle = buttonStyleActive;
                  recentTransactionsBtnStyle = buttonStyleInactive;
                  midCategoriesStateColor = SysifosColors.brandDarkColor;
                  midRecentsStateColor = SysifosColors.brandLigthDarkColor;
                  log('categories  $midCategoriesStateColor');
                })
              },
              recentBtnAction: () => {
                setState(() {
                  currentDetailWidget = const RecentTransactions();
                  categorieBtnStyle = buttonStyleInactive;
                  recentTransactionsBtnStyle = buttonStyleActive;
                  midCategoriesStateColor = SysifosColors.brandLigthDarkColor;
                  midRecentsStateColor = SysifosColors.brandDarkColor;
                  log('categories  $midCategoriesStateColor');
                })
              },
            ),
            Expanded(child: currentDetailWidget)
          ],
        ));
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
          color: SysifosColors.brandPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: SysifosRadius.small,
              bottomRight: SysifosRadius.small)),
      height: 389,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 56),
              child: Text(
                'You Budget',
                style: Theme.of(context).textTheme.displaySmall,
              )),
          CustomMoneyDisplay(
            amount: 2868000.12,
            padding: const EdgeInsets.only(top: 8, right: 4),
            amountStyle: Theme.of(context).textTheme.displayLarge!,
            amountStyleSmall: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SysifosColors.brandLightColor),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.incomes,
            amount: 700000,
            period: 'From January 1 to January 31',
            action: () => print('income'),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.spending,
            amount: 90000,
            period: 'From January 1 to January 31',
            action: () => print('spending'),
          ),
        ],
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  final Color midCategoriesStateColor;
  final Color midRecentsStateColor;
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionsBtnStyle;
  final void Function()? categorieBtnAction;
  final void Function()? recentBtnAction;
  const MidHomePageBody(
      {super.key,
      required this.categorieBtnStyle,
      required this.recentTransactionsBtnStyle,
      required this.categorieBtnAction,
      required this.recentBtnAction,
      required this.midCategoriesStateColor,
      required this.midRecentsStateColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      height: 104,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: SysifosColors.brandLightColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: categorieBtnStyle,
            onPressed: categorieBtnAction,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: midCategoriesStateColor,
                    fontSize: 14,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          ElevatedButton(
            style: recentTransactionsBtnStyle,
            onPressed: recentBtnAction,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              child: Text(
                'Recent transaction',
                style: TextStyle(
                    color: midRecentsStateColor,
                    fontSize: 14,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.bottomRight),
          child: const Text(
            'View All',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Color.fromRGBO(53, 97, 254, 1)),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('new-page');
          },
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 391254.01,
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          pathToProductImage: 'assets/images/tv.png',
          amount: 3176254.01,
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          pathToProductImage: 'assets/images/health.png',
          amount: 38.01,
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
      ],
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          TextButton(
            style: const ButtonStyle(alignment: Alignment.centerRight),
            child: const Text(
              'View All',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromRGBO(53, 97, 254, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.allTransactions);
            },
          ),
          TransactionDetailByDay(
            day: 'TUE',
            isToday: true,
            dayNumber: 4,
            listofTransactions: [
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.negative,
                  amount: 420.16),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 433.35)
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TransactionDetailByDay(
            day: 'MON',
            isToday: false,
            dayNumber: 3,
            listofTransactions: [
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 720.92),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.negative,
                  amount: 84.45),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 137.26)
            ],
          )
        ],
      ),
    );
  }
}
