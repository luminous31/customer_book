import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer_book/utils/color/color_pallets.dart';
import 'package:customer_book/view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) {
        model.reload();
      },
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/logo/roundlogo.jpg',
                  height: 40,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(0.0),
                    child: const Text(
                      'STEMCON',
                      style: const TextStyle(color: Colors.black),
                    ))
              ],
            ),
            backgroundColor: whiteColor,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("First"),
                          value: 1,
                        ),
                        const PopupMenuItem(
                          child: Text("Second"),
                          value: 2,
                        )
                      ]),
            ],
          ),
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ExpansionPanelList(
                  expansionCallback: (i, isOpen) {
                    model.openContainer(i);
                  },
                  animationDuration: const Duration(seconds: 1),
                  dividerColor: Colors.teal,
                  elevation: 2,
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return
                            //   ListTile(
                            //   title: Text("Index 0 (Header Tap Enabled)"),
                            // );
                            GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: const DecorationImage(
                                          image: const AssetImage(
                                              'assets/logo/roundlogo.jpg'),
                                          fit: BoxFit.cover,
                                        ))),
                              ),

                              // Padding(padding: EdgeInsets.all(5.0),child: Image.asset('assets/images/dubai1.jpg', height: 40,),),
                              // Image.asset('assets/logo/roundlogo.jpg', height: 40,),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'GOKUL MATHURA',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Text(
                                    'PMC 4456',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Text(
                                    'morbi',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      // canTapOnHeader: true,
                      body: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Dadline",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "12/02/2022",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Time Zone ",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "GMT",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Unit",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Feet",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Man Hour   ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "450 Hr",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      // Respond to button press
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      "Edit",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.black,
                                      // backgroundColor: Colors.amber,
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 12, 45, 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      // side: BorderSide(width: 2, color: Colors.green),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      // Respond to button press
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.redAccent,
                                    ),
                                    label: const Text(
                                      "Delete",
                                      style: const TextStyle(
                                          color: Colors.redAccent),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.black,
                                      // backgroundColor: Colors.amber,
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 12, 45, 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      // side: BorderSide(width: 2, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      isExpanded: model.index == 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
