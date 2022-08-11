import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/screens/options_screen.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: _drawer(),
      backdropColor: const Color(0xFFFCFCFF),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
      animateChildDecoration: true,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFCFF),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _advancedDrawerController.showDrawer(),
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                    color: const Color(0xFFFCFCFF),
                  ),
                );
              },
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildList(index),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 4,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
        ),
      ),
    );
  }

  Widget _buildList(int index) {
    Category category = categories[index];
    return GestureDetector(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => OptionsScreen(
                    photo: category.categoryImage,
                    text: category.name,
                    category: category,
                  )))),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Color(0xFF251F47)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categories[index].categoryImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10),
                child: Text(
                  categories[index].name,
                  softWrap: false,
                  style: GoogleFonts.roboto(
                      color: const Color(0xFFFCFCFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _drawer() {
  return ListTileTheme(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
        ]),
  );
}
