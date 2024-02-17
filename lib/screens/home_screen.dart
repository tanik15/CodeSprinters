// import 'package:fl_chart/fl_chart.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/data/chart.dart';
import 'package:portfolio/data/line_chart.dart';
import 'package:portfolio/widget/carousal.dart';
import 'package:portfolio/widget/small_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  final candle =  Candle(date: DateTime.now(), open: 1780.36, high: 1873.93, low: 1755.34, close: 1848.56, volume: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: const Text("Wealth Wise"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Carousal(),
            const SizedBox(
                height: 40, width: double.infinity, child: SmallCaruosal()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            GridViewWidget(size: size, title: "Top Gainers"),
            GridViewWidget(
              size: size,
              title: "Top Losers",
            ),
            GridViewWidget(
              size: size,
              title: "Highest Price",
            ),
            GridViewWidget(
              size: size,
              title: "Lowest Price",
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    // final candle =  Candle(date: DateTime.now(), open: 1780.36, high: 1873.93, low: 1755.34, close: 1848.56, volume: 0);
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 340,
            child: GridView.count(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(25),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    elevation: 6,
                    child: Container(
                      // height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reliance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "abc",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: 60,
                                // child: LineChartSample2(),
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
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: SizedBox(
              child: LineChartSample2(),
            ),
          ),
          const SizedBox(height: 300,child: LineChartt(isShowingMainData: true,),),
          // SizedBox(
          //   height: 250,
          //   child: Candlesticks(
          //     candles: [candle],
          //   ),
          // ),
          // LineChartSample7()
        ],
      ),
    );
  }
}
