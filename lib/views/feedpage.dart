import 'package:flutter/material.dart';
import 'package:postreaction/widgets/postcard.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> topics = [
    "Cybersecurity",
    "IoT",
    "AI/ML",
    "Computer Vision",
    "Robotics"
  ];

  List<String> imgUrls = [
    "https://images.unsplash.com/photo-1544890225-2f3faec4cd60?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aGFja2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1519575706483-221027bfbb31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGhhY2tlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1562813733-b31f71025d54?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aGFja2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
  ];
  List<String> statusUrls = [
    "https://images.unsplash.com/photo-1529465230221-a0d10e46fcbb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhhY2tlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1585079542156-2755d9c8a094?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGhhY2tlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1505238680356-667803448bb6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fGhhY2tlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
  ];

  Color primaryColor = const Color.fromARGB(255, 43, 43, 43);
  Color iconColor = const Color.fromARGB(255, 163, 161, 161);
  int currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 26, 26, 26),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 152, 10, 0),
                        shadowColor: const Color.fromARGB(255, 62, 5, 5),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            "HiddenSolve",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.settings_input_antenna,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(statusUrls[index % 3]),
                              radius: 40,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SocialMediaPost(
                        likes: 47 * (index + 1),
                        comments: 8 * (index + 1),
                        shares: 4 * (index + 1),
                        imgUrl: imgUrls[index % 3],
                      );
                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {},
              child: const Icon(
                Icons.lock_person,
                size: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
