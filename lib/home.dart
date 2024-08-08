import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'ProductS.dart';
import 'categroy.dart';
import 'favourite/favorites.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [

    Product(
      imageAsset: 'assets/dress3.jpeg',
      title: 'Asymmetrical Dress ',
      price: 709.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/dress2.jpeg',
      title: 'striaght Dress',
      price: 49.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/skirt1.jpeg',
      title: 'circle Skirt ',
      price: 290.99,
      category: 'skirts',
    ),
    Product(
      imageAsset: 'assets/skirt2.jpeg',
      title: 'A-line Skirt',
      price: 490.99,
      category: 'skirts',
    ),
    Product(
      imageAsset: 'assets/pants3.jpeg',
      title: 'Pants jeans',
      price: 39.99,
      category: 'pants',
    ),
    Product(
      imageAsset: 'assets/blouse2.jpeg',
      title: ' modern Blouse ',
      price: 190.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/dress4.jpeg',
      title: 'Mermaid Dress ',
      price: 5490.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/blouse3.jpeg',
      title: 'hawaiian Blouse ',
      price: 390.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/pants1.jpeg',
      title: 'Pants ',
      price: 390.99,
      category: 'pants',
    ),
    Product(
      imageAsset: 'assets/blouse1.jpeg',
      title: 'vest Blouse ',
      price: 290.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/skirt3.jpeg',
      title: 'tulip Skirt ',
      price: 280.99,
      category: 'skirts',
    ),


    Product(
      imageAsset: 'assets/blouse4.jpeg',
      title: 'tank top ',
      price: 600.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/dress1.webp',
      title: 'Bouffant Dress ',
      price: 9000.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/pants2.jpeg',
      title: 'Wide leg ',
      price: 500.99,
      category: 'pants',
    ),
    Product(
      imageAsset: 'assets/blouse5.jpeg',
      title: 'polo Blouse ',
      price: 510.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/dresss5.jpeg',
      title: ' peasant Dress',
      price: 4000.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/skirt4.jpeg',
      title: 'Godet Skirt ',
      price: 600.99,
      category: 'skirts',
    ),
    Product(
      imageAsset: 'assets/blouse6.jpeg',
      title: 'trench Blouse ',
      price: 990.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/pants4.jpeg',
      title: 'Pants cutting',
      price: 890.99,
      category: 'pants',
    ),
    Product(
      imageAsset: 'assets/dress5.jpeg',
      title: 'Dress ',
      price: 49.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/blouse7.jpeg',
      title: 'fur Blouse ',
      price: 200.99,
      category: 'blouses',
    ),
    Product(
      imageAsset: 'assets/skirt5.jpeg',
      title: 'Ruffiled Skirt ',
      price: 800.99,
      category: 'skirts',
    ),

    Product(
      imageAsset: 'assets/blouse8.jpeg',
      title: 'kerbelt Blouse ',
      price: 790.99,
      category: 'blouses',
    ),

    Product(
      imageAsset: 'assets/pants5.jpeg',
      title: 'shape Pants',
      price: 659.99,
      category: 'pants',
    ),
    Product(
      imageAsset: 'assets/dress6.jpeg',
      title: 'halter Dress ',
      price: 870.99,
      category: 'dresses',
    ),



    Product(
      imageAsset: 'assets/dress8.jpeg',
      title: 'maxi Dress ',
      price: 536.99,
      category: 'dresses',
    ),
    Product(
      imageAsset: 'assets/pants6.jpeg',
      title: 'cargo Pants ',
      price: 39.99,
      category: 'pants',
    ),

  ];

  List<Product> favoriteProducts = [];

  List<String> categories = ['dresses', 'skirts', 'pants', 'blouses'];

  final Map<String, String> categoryImages = {
    'dresses': 'https://lh4.googleusercontent.com/proxy/IvyL1UgQgmAqfpVi9TAdG5iFWE_m56CEOgW9EzweqTkTSKWBfapUtpDnn_2ctFvcvvkPotuQK1f3px7-QJmtkKYeRzg838B8yXHpjC6q_CmlaxaL9T7EkQMpwu48XCHE8nt4avOqX9vyr40Psw1u6q59yfw',
    'skirts': 'https://img-colinsegypt.mncdn.com/Assets/Egypt/Thumbs/__15383.jpeg?v=1680718980',
    'pants': 'https://img.ltwebstatic.com/images3_pi/2023/09/08/03/1694153582cc06d4495fb63d589560cc33e0cc8007_thumbnail_720x.jpg',
    'blouses': 'https://ae01.alicdn.com/kf/S268625e1a250423b806e0aaa4ca86fddD.jpg_640x640Q90.jpg_.webp',
  };

  void _toggleFavorite(Product product) {
    setState(() {
      if (favoriteProducts.contains(product)) {
        favoriteProducts.remove(product);
      } else {
        favoriteProducts.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.45;
    final cardHeight = cardWidth * 1.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chanzel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
            
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 10,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                'https://mir-s3-cdn-cf.behance.net/projects/404/98dbb6165808571.Y3JvcCwxMDgwLDg0NCwwLDExNw.jpg',
                'https://mir-s3-cdn-cf.behance.net/projects/404/a820a1152271799.Y3JvcCwyNDgxLDE5NDAsMCw3ODY.png',
                'https://sunrisegraphics.org/wp-content/uploads/2024/05/BANNER-5-copy.webp',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(.2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          i,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                            category: categories[index],
                            products: products,
                            favoriteProducts: favoriteProducts,
                            onFavoriteToggle: _toggleFavorite,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(categoryImages[categories[index]] ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 10,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: (cardWidth / cardHeight),
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                            category: products[index].category,
                            products: products,
                            favoriteProducts: favoriteProducts,
                            onFavoriteToggle: _toggleFavorite,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              products[index].imageAsset,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            products[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.home),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite),
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_cart),
              ),
            ),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesScreen(favoriteProducts: favoriteProducts),
              ),
            );
          }
        },
      ),
    );
  }
}


