import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({super.key});

  @override
  State<NativeScreen> createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {
  final scrollController = ScrollController();
  var isPlay = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => kDebugMode ? {} : play());
    super.initState();
  }

  Future<void> play() async {
    setState(() => isPlay = !isPlay);

    scrollController.animateTo(
      0,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );

    var count = 1;
    var atEdge = false;

    while (!atEdge) {
      scrollController.animateTo(
        // ignore: use_build_context_synchronously
        MediaQuery.of(context).size.height * 0.1 * count * count,
        duration: kTabScrollDuration,
        curve: Curves.easeInOut,
      );
      await Future.delayed(kTabScrollDuration);

      count++;
      atEdge =
          scrollController.position.pixels >=
          scrollController.position.maxScrollExtent;
    }

    scrollController.animateTo(
      0,
      duration: kTabScrollDuration,
      curve: Curves.easeInOut,
    );

    setState(() => isPlay = false);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Native Screen'),
        actions: [
          IconButton(
            onPressed: isPlay ? null : () => play(),
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: ListView.separated(
        controller: scrollController,
        padding: EdgeInsets.all(16),
        itemBuilder: (_, i) => TextButton(child: Text('$i'), onPressed: () {}),
        separatorBuilder: (_, _) => Divider(height: 32),
        itemCount: 1000,
      ),
    );
  }
}
