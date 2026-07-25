import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const WithEgyptApp());
}

class WithEgyptApp extends StatelessWidget {
  const WithEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'With Egypt - راحتك تهمنا',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF0F172A),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
          primary: const Color(0xFF0F172A),
          secondary: const Color(0xFF10B981),
        ),
      ),
      home: const CustomerHomeScreen(),
    );
  }
}

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        title: const Text('راحتك تهمنا - With Egypt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: ColorAxisAlignment.center,
                children: [
                  Text('مستقبل الخدمات الذكية في مصر',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('خصم 20% كود: WITHEGYPT',
                      style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('خدماتنا', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildCard('توصيل طعام', Icons.restaurant, Colors.orange),
                _buildCard('طلب طرود', Icons.local_shipping, Colors.blue),
                _buildCard('متاجر', Icons.shopping_bag, Colors.purple),
                _buildCard('مستندات', Icons.description, Colors.teal),
                _buildCard('حجز سيارة', Icons.directions_car, const Color(0xFF10B981)),
                _buildCard('شاحنات', Icons.fire_truck, Colors.indigo),
                _buildCard('محافظات', Icons.alt_route, Colors.red),
                _buildCard('منزلية', Icons.build, Colors.brown),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard(String title, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 6),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

