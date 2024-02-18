// import 'package:fl_chart/fl_chart.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/api/api.dart';
import 'package:portfolio/colors/colors.dart';
import 'package:portfolio/core/bloc/home_screen_bloc.dart';
import 'package:portfolio/data/line_chart.dart';
import 'package:portfolio/screens/mutual_fund.dart';
import 'package:portfolio/screens/personal_screen.dart';
import 'package:portfolio/screens/quick_buy.dart';
import 'package:portfolio/widget/carousal.dart';
import 'package:portfolio/widget/small_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  final candle = Candle(
      date: DateTime.now(),
      open: 1780.36,
      high: 1873.93,
      low: 1755.34,
      close: 1848.56,
      volume: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: dartColor,
      // appBar: AppBar(
      //   forceMaterialTransparency: true,
      //   automaticallyImplyLeading: false,
      //   title: const Text("Wealth Wise"),
      // ),
      body: (currentPageIndex == 0)
          ? HomeScreenWidget(size: size)
          : (currentPageIndex == 2)
              ? const QuickBuy() :(currentPageIndex == 3)? const PersonalPortfolio()
              : const MutualFundScreen(),
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: lightColor,
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.group),
            icon: Icon(
              Icons.portable_wifi_off_rounded,
              color: Colors.white,
            ),
            label: 'Mutual Fund',
          ),
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.home)),
            icon: Icon(
              Icons.electric_bike,
              color: Colors.white,
            ),
            label: 'Quick Buy',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  bool isnewNews = false;
  List nifty = ['37387.17', '37403.20', '37285.72'];
  List sensex = ['11000.45', '10980.20', '10975.72'];
  String nifty50 = "";
  String bseSensex = "";
  Color dartColor = const Color(0xff232F34);
  Color lightColor = const Color(0xff4A6572);
  List topGainer = ['Wipro','M&M','L&T','Tata Motar'];
  List toplooser = ['Bajaj','h&m','ONGC','Britania'];

  void niftyLoop(int n) async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      nifty50 = nifty[n];
      bseSensex = sensex[n];
    });
  }

  void timeer() async {
    setState(() {
      isnewNews = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isnewNews = false;
    });
  }

  @override
  void initState() {
    timeer();
    getCarousalDetails();
    niftyLoop(0);
    BlocProvider.of<HomeScreenBloc>(context).add(GetTopGainers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (nifty50 == nifty[0]) {
      niftyLoop(1);
    } else if (nifty50 == nifty[1]) {
      niftyLoop(2);
    } else {
      niftyLoop(0);
    }
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!isnewNews)
              AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title: const Text("Wealth Wise",style: TextStyle(color: Colors.white),),
              ),
            if (isnewNews)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  elevation: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(29, 32, 34, 0.733),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Center(
                          child: Text("Zomato stocks went up due to high demand during festival",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white))),
                    ),
                  ),
                ),
              ),
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
                    width: widget.size.width * 0.42,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: lightColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "NIFTY 50",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          const Text("NSEI",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              Text("Current: \u{20B9}$nifty50",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,color: Colors.white)),
                              (nifty50 == nifty[2])
                                  ? const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.red,
                                      size: 18,
                                    )
                                  : const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
                                      size: 18,
                                    )
                            ],
                          ),
                          const Text("Open: \u{20B9}37018.32",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400,color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: widget.size.width * 0.42,
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
                      color: lightColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "BSE SENSEX",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          const Text("BSESN",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              Text("Current:\u{20B9}$bseSensex",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,color: Colors.white)),
                              (nifty50 == nifty[0])
                                  ? const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
                                      size: 18,
                                    )
                                  : (nifty50 == nifty[1])
                                      ? const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.red,
                                          size: 18,
                                        )
                                      : const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.red,
                                          size: 18,
                                        )
                            ],
                          ),
                          const Text("Close: \u{20B9}10980.0",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400,color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GridViewWidget(size: widget.size, title: "Top Gainers",list: topGainer),
            GridViewWidget(
              size: widget.size,
              title: "Top Losers",list: toplooser,
            ),
            GridViewWidget(
              size: widget.size,
              title: "Highest Price",list: topGainer,
            ),
            GridViewWidget(
              size: widget.size,
              title: "Lowest Price",list: topGainer,
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
    required this.title, required this.list, 
  });

  final Size size;
  final String title;
  final List list;

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
                      color: Colors.white,
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
                      decoration:  BoxDecoration(
                          color: lightColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
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

          // const SizedBox(
          //   height: 300,
          //   child: LineChartt(
          //     isShowingMainData: true,
          //   ),
          // ),
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
