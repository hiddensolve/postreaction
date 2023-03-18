import 'package:flutter/material.dart';

class SocialMediaPost extends StatefulWidget {
  final int likes;
  final int comments;
  final int shares;
  final String imgUrl;

  const SocialMediaPost({
    super.key,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.imgUrl,
  });

  @override
  _SocialMediaPostState createState() => _SocialMediaPostState();
}

class _SocialMediaPostState extends State<SocialMediaPost>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool _liked = false;
  bool _locked = false;
  int likes = 0;
  int comments = 0;
  int shares = 0;
  double height = 300;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    likes = widget.likes;
    comments = widget.comments;
    shares = widget.shares;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.black,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: 270,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: animationController.value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.security_rounded,
                        size: 60 * (animationController.value + 1),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget? child) {
                            return GestureDetector(
                              onTap: () {
                                animationController.forward().then((value) {
                                  animationController.reverse();
                                });

                                setState(
                                  () {
                                    _liked = !_liked;
                                    if (_liked) {
                                      likes += 1;
                                    } else {
                                      likes -= 1;
                                    }
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    _liked
                                        ? Icons.security_outlined
                                        : Icons.shield_outlined,
                                    color: _liked ? Colors.red : Colors.red,
                                    size: 25 *
                                        (animationController.value / 2 + 1),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    likes.toString(),
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              height = _locked ? 300 : 100;
                              _locked = !_locked;
                            });
                          },
                          child: Icon(
                            !_locked
                                ? Icons.lock_open_rounded
                                : Icons.lock_outline,
                            color: _liked ? Colors.red : Colors.red,
                            size: 25 * (animationController.value / 2 + 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1590316519564-ebeeca222a95?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aG9vZGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "HiddenSolve",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
