import 'package:flutter/material.dart';
import '../views/rotated_text_btn.dart';
import '../views/play_list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController(viewportFraction: 0.8);
  static const List<Color> _colorsList = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.black38
  ];

  static const List<String> _imageAssets = [
    "albumOne",
    "albumTwo",
    "albumThree",
    "albumFour",
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final querySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        shadowColor: Colors.transparent,
        title: Row(children: [
          const Text(
            "Discover",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.sort,
            color: Colors.black,
          )
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Row(
          children: [
            // first column
            SizedBox(
              width: querySize.width * .2,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.purpleAccent),
                    child: const RotatedTextBtn(
                      myLable: "Your Playlists",
                      myIcon: Icons.collections,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.deepPurple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      RotatedTextBtn(
                        myLable: "Recent",
                        //myIcon: Icons.collections,
                      ),
                      RotatedTextBtn(
                        myLable: "Like",
                        //myIcon: Icons.collections,
                      ),
                    ]),
                  )
                ],
              ),
            ),
            // second column
            SizedBox(
              width: querySize.width * .8,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.purple),
                    child: PageView.builder(
                      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                      /// Use [Axis.vertical] to scroll vertically.
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          selectedItem = index;
                        });
                        print("$selectedItem");
                      },
                      controller: controller,
                      padEnds: false,
                      itemBuilder: ((context, index) => PlayListItem(
                            index: index,
                            selectedIndex: selectedItem,
                          )),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    decoration:
                        const BoxDecoration(color: Colors.deepPurpleAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _imageAssets.map((e) {
                        return Expanded(
                          child: ListTile(
                            minLeadingWidth: 100,
                            leading: SizedBox(
                              height: 100,
                              child: Image.asset(
                                  "assets/images/${e.toString()}.jpeg"),
                            ),
                            title: Text(e.toString()),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
