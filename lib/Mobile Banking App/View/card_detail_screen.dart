import 'package:flutter/material.dart';
import 'package:mobile_banking/Mobile%20Banking%20App/Model/card_model.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class CardDetailScreen extends StatefulWidget {
  final CardModel card;
  const CardDetailScreen({super.key, required this.card});

  @override
  State<CardDetailScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<CardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black45,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.orange[900]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.white,
            ],
            radius: 1.5,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerParts(),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text(
                    "Your Current Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\$1847,56",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.upgrade_sharp,
                        color: Colors.green,
                      ),
                      Text(
                        "${widget.card.percentIncrease}% More then Last Month",
                        style: TextStyle(
                          color: Colors.green[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: SizedBox(
                      height: 200,
                      width: 300,
                      child: SfSparkLineChart(
                        color: Colors.amber,
                        data: widget.card.graphItems,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        symbols("D", false),
                        symbols("M", false),
                        symbols("6M", true),
                        symbols("Y", false),
                        symbols("ALL", false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            "You have recived a \n amound of money from...",
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$${widget.card.receiveAmount}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "\$${widget.card.cardType}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SwipeableButtonView(
                      onFinish: () {},
                      onWaitingProcess: () {},
                      activeColor: Colors.white,
                      buttonWidget: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.navigate_next_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      buttonText: "Confirm Payment Now",
                      buttontextstyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container symbols(String name, bool isActive) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isActive == true ? Colors.white : Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: isActive == true ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Row headerParts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        const Text(
          "Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Icon(
                Icons.credit_card,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
