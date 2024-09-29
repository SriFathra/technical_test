import 'package:technical_test/common_libs.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorName.black,
            size: 18.r,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Semua Categories',
          style: TextStyle(
              fontSize: 14.sp,
              color: ColorName.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildProductCard(
            category['title'],
            category['icon'],
            category['color'],
            category['onTap'],
          );
        },
      ),
    );
  }
}

Widget _buildProductCard(
    String title, IconData icon, Color colorIcon, Function()? onTap) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32.r,
            color: colorIcon,
          ),
          const SizedBox(height: 5),
          Text(title,
              style: TextStyle(fontSize: 12.sp), textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
