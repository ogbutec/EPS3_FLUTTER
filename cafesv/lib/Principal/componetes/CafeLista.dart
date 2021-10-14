import 'package:cafesv/Principal/util/constantes.dart';
import 'package:flutter/material.dart';
import 'package:cafesv/Principal/componetes/cafe.dart';

class Cafeelista extends StatefulWidget {
  // Cafeelista({Key? key}) : super(key: key);

  @override
  _cafelistaState createState() => _cafelistaState();
}

class _cafelistaState extends State<Cafeelista> {
  final _pageCafeController = PageController(
    viewportFraction: 0.3,
  );
  final _pagenomCafeController = PageController();
  final _pagepreCafeController = PageController();

  double _paginaActual = 0.0;
  double _paginaPrecioActual = 0.0;
  double _paginaNombreActual = 0.0;

  void _cafenScrollLitener() {
    _paginaNombreActual = _paginaActual;
  }

  void _cafepScrollLitener() {
    _paginaPrecioActual = _paginaActual;
  }

  void _cafeScrollLitener() {
    setState(() {
      _paginaActual = _pageCafeController.page!;
    });
  }

  @override
  void initState() {
    _pageCafeController.addListener(_cafeScrollLitener);
    _pagenomCafeController.addListener(_cafepScrollLitener);
    _pagenomCafeController.addListener(_cafenScrollLitener);
    super.initState();
  }

  @override
  void dispose() {
    _pageCafeController.removeListener(_cafeScrollLitener);
    _pagepreCafeController.removeListener(_cafepScrollLitener);
    _pagenomCafeController.removeListener(_cafenScrollLitener);
    _pageCafeController.dispose();
    _pagepreCafeController.dispose();
    _pagenomCafeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tam = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 20,
            right: 20,
            bottom: -tam.height * 0.22,
            height: tam.height * 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown,
                      blurRadius: 90,
                      offset: Offset.zero,
                      spreadRadius: 45)
                ]

                //
                ,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.8,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                controller: _pageCafeController,
                scrollDirection: Axis.vertical,
                itemCount: cafess.length + 1,
                onPageChanged: (valor) {
                  if (valor < cafess.length) {
                    _pagepreCafeController.animateToPage(valor,
                        duration: duracion, curve: Curves.easeOut);
                  }
                  if (valor < cafess.length) {
                    _pagenomCafeController.animateToPage(valor,
                        duration: duracion, curve: Curves.easeOut);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox.shrink();
                  }

                  final caffe = cafess[index - 1];
                  final result = _paginaActual - index + 1;
                  final valor = -0.4 * result + 1;
                  final opacidad = valor.clamp(0.0, 1.0);
                  //print(result);
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(0.0, tam.height / 2.6 * (1 - valor).abs())
                          ..scale(valor),
                        child: Opacity(
                            opacity: opacidad,
                            child: Image.asset(
                              caffe.imagen,
                              fit: BoxFit.fitHeight,
                            )),
                        // return Image(image: AssetImage(caffe.imagen)
                      ));
                }),
          ),

          //va de ultimo
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                      itemCount: cafess.length,
                      controller: _pagenomCafeController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final opacidad = _paginaNombreActual.clamp(-13.0, 13.0);
                        final opa = (1 - (index - opacidad));
                        print(opa);
                        return Opacity(
                          opacity: opa,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              cafess[index].nombre,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: PageView.builder(
                      itemCount: cafess.length,
                      controller: _pagepreCafeController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final opa = (1 -
                            (index - _paginaPrecioActual.clamp(-13.0, 13.0)));
                        return Opacity(
                          opacity: opa,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '\$' + cafess[index].precio,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
              // children: [Text(cafess[_paginaActual.toInt()].precio.toString())],
              //color: Colors.red,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
