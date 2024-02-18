import 'package:flutter/material.dart';
import 'package:portfolio/screens/buy_screen.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title, required this.currentPrice, required this.changePercentage, required this.description,
  });
  final String title;
  final String currentPrice;
  final String changePercentage;
  final String description;

  @override
  Widget build(BuildContext context) {
    
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Card(
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.white,
          child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: (title.length > 25) ? 11 : 15,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          // const Text(
                          //   '\u{20B9}1581 | 0.96%',
                          //   style: TextStyle(color: Colors.black, fontSize: 11),
                          // )
                          RichText(
                            text:  TextSpan(
                              text: '\u{20B9}$currentPrice',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              children: [
                                 WidgetSpan(
                                  child:(double.parse(changePercentage)>0)? const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                    size: 12,
                                  ):const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.red,
                                    size: 12,
                                  )
                                ),
                                TextSpan(
                                  text: '$changePercentage%',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        BuyScreen(stockName: title,description: description,))));
                          },
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ))
                    ]),
              )),
        ),
      );
  }
}
