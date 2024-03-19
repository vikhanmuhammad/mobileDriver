import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            InfoDetail(),
          ],
        ),
      ),
    );
  }
}

class InfoDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  "https://via.placeholder.com/360x800",
                  fit: BoxFit.fill,
                ),
              ),
              _buildDetailContainer(context),
              _buildText('Pandawa 87', screenWidth - 300, 420, 16, FontWeight.w600,
                  Color(0xFF5B5B5B)),
              _buildText('07 Oktober 2023', screenWidth - 124, 410, 12, FontWeight.w600,
                  Color(0xFF737373)),
              _buildText(
                  '07.00 AM', screenWidth - 84, 430, 12, FontWeight.w600, Color(0xFF737373)),
              _buildText('Detail Perjalanan', 25, 500, 14, FontWeight.w600,
                  Colors.black.withOpacity(0.5)),
              _buildDivider(480, context),
              _buildRotatedContainer(35, 652, 55, 1, 1),
              _buildDotWithIcon(25, 545, Icons.location_on, Color(0xFF47A992)),
              _buildVerticalLine(35, 565, 650),
              _buildDotWithIcon(25, 630, Icons.location_on, Color(0xFF47A992)),
              //_buildImage("assets/img/pandawa.jpg", 10, 410, 55, 43),
              _buildText('Lokasi Keberangkatan', 55, 540, 12, FontWeight.w600,
                  Colors.black.withOpacity(0.5)),
              _buildText('Bandung', 55, 560, 12, FontWeight.w500, Colors.black),
              _buildText('Lokasi Tujuan - 152 km', 55, 625, 12, FontWeight.w600,
                  Colors.black.withOpacity(0.5)),
              _buildText('Jakarta', 55, 645, 12, FontWeight.w500, Colors.black),
              _buildInputContainer(screenWidth - 365, 86, 323, 39, 10, Color(0xFFDBDBDB)),
              _buildHeaderContainer(0, 0, screenWidth, 70, Color(0xFF47A992)),
              _buildText('Peta', 25, 25, 22, FontWeight.w600, Colors.white),
              _buildButton(
                screenWidth - 345,
                91,
                93,
                29,
                'Selanjutnya',
                38,
                97,
                11,
                FontWeight.w600,
                Colors.grey,
                0xFFEFEFEF,
              ),
              _buildButton(
                screenWidth - 250,
                91,
                93,
                29,
                'Proses',
                161,
                97,
                11,
                FontWeight.w600,
                Colors.black,
                0xFFEFEFEF,
              ),
              _buildButton(
                screenWidth - 155,
                91,
                93,
                29,
                'Selesai',
                269,
                97,
                11,
                FontWeight.w600,
                Colors.grey,
                0xFFEFEFEF,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildText(
    String text,
    double left,
    double top,
    double fontSize,
    FontWeight fontWeight,
    Color color, // Mengganti tipe data menjadi Color
  ) {
    return Positioned(
      left: left,
      top: top,
      child: Text(
        text,
        style: TextStyle(
          color: color, // Menggunakan warna yang diberikan
          fontSize: fontSize,
          fontFamily: 'Poppins',
          fontWeight: fontWeight,
          height: 0,
        ),
      ),
    );
  }

  Widget _buildDivider(double top, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      left: 0,
      top: top,
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.25),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRotatedContainer(
    double left,
    double top,
    double width,
    double height,
    double angle,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDotWithIcon(
      double left, double top, IconData iconData, Color dotColor) {
    return Positioned(
      left: left,
      top: top,
      child: Stack(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: ShapeDecoration(
              color: dotColor,
              shape: CircleBorder(),
            ),
          ),
          Center(
            child: Icon(
              iconData,
              color: Colors.white,
              size: 20, // Sesuaikan dengan ukuran yang diinginkan
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(
    String
        imagePath, // Menggunakan string untuk mewakili path relatif dari gambar
    double left,
    double top,
    double width,
    double height,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        // child: Image.asset(
        //   "assets/img/pandawa.jpg", // Menggunakan Image.asset dengan path relatif dari gambar
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }

  Widget _buildHeaderContainer(
      double left, double top, double width, double height, Color color) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color),
      ),
    );
  }

  Widget _buildInputContainer(double left, double top, double width,
      double height, double borderRadius, Color color) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      left: 0,
      top: 370,
      child: Container(
        width: screenWidth,
        height: screenHeight - 100,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    double left,
    double top,
    double width,
    double height,
    String text,
    double textLeft,
    double textTop,
    double fontSize,
    FontWeight fontWeight,
    Color textColor, // Menambahkan parameter untuk warna teks
    int color, // Mengganti tipe data menjadi int
  ) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Color(color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor, // Menggunakan warna teks yang ditentukan
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: fontWeight,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalLine(double startX, double startY, double endY) {
    return Positioned(
      left: startX,
      top: startY,
      child: CustomPaint(
        size: Size(1, endY - startY), // Lebar garis adalah 1 pixel
        painter: VerticalLinePainter(),
      ),
    );
  }
}

class VerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Warna garis
      ..strokeWidth = 1; // Lebar garis

    // Gambar garis vertikal
    canvas.drawLine(
      Offset(0, 0),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
