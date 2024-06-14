import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:movilapp_main/paginaPrincipal.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: Container(
        color: const Color(0xFF0D1B2A), // Fondo del dashboard
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 1.0), // Espacio entre la parte superior y la dona
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: CardRow(),
              ),
            ),
            SizedBox(height: 10.0), //
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: DonutChart(),
              ),
            ),
            SizedBox(height: 10.0), //
            Expanded(
              flex: 5,
              child: LineChartSample1(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Adrian',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app), // Icono de salir
            title: Text('Salir'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PaginaPrincipal()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: DashboardCard(title: 'Comida', value: '100'),
            ),
            Expanded(
              child: DashboardCard(title: 'Pasajes', value: '200'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: DashboardCard(title: 'Viajes', value: '300'),
            ),
            Expanded(
              child: DashboardCard(title: 'Gastos diarios', value: '400'),
            ),
          ],
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;

  const DashboardCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              value,
            ),
          ],
        ),
      ),
    );
  }
}

class DonutChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.blue,
              value: 25,
              title: '25%',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 35,
              title: '35%',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              color: Colors.orange,
              value: 20,
              title: '20%',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              color: Colors.red,
              value: 20,
              title: '20%',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 4),
              FlSpot(2, 3.5),
              FlSpot(3, 5),
              FlSpot(4, 4),
              FlSpot(5, 6),
            ],
            isCurved: true,
            colors: [Colors.blue],
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(showTitles: true),
          leftTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}
