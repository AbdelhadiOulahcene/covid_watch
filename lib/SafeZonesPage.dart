import 'dart:collection';

import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

class SafeZones extends StatefulWidget with NavigationStates {
  @override
  _SafeZonesState createState() => _SafeZonesState();
}

class _SafeZonesState extends State<SafeZones> {
  GoogleMapController _controller;
  GoogleMapController mapController;
  String searchAdr;
  bool isMapCreated = false;
  String cases = '1500';
  String cured = '1000';
  String deaths = '2000';
  bool affich = false;
  double small = 2000.0;
  double big = 4000;
  double rad;

  @override
  void initState() {
    super.initState();
    _setCircles();
  }

  changeMapMode() {
    getJsonFile('assets/json/map.json').then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  Set<Circle> _circles = Set<Circle>();
  Set<Circle> _circles2 = Set<Circle>();
  void _setCircles() {
    _circles.add(Circle(
        circleId: CircleId("0"),
        center: LatLng(36.789805, 3.052454),
        radius: 6000,
        strokeWidth: 2,
        strokeColor: Color(0xffd34d7d),
        fillColor: Color(0x59d34d7d),
        consumeTapEvents: true,
        onTap: () {
          setState(() {
            this.affich = true;
            cases = '1000';
            cured = '300';
            deaths = '250';
            this._circles.forEach((c) {
              Circle c2 = c.copyWith(
                fillColorParam: Color(0x59d34d7d),
              );
              this._circles2.add(c2);
            });
            this._circles.clear();
            this._circles2.forEach((c) {
              Circle c3 = c;
              this._circles.add(c3);
            });
            Circle crc = this
                ._circles
                .firstWhere((c) => c.circleId.value == '0',
                    orElse: () => this._circles.first)
                .copyWith(
                  fillColorParam: Color(0xffd34d7d),
                );
            this._circles.remove(crc);
            this._circles.add(crc);
          });
        }));
    _circles.add(Circle(
        circleId: CircleId("1"),
        center: LatLng(36.801265, 2.904072),
        radius: 4000,
        strokeWidth: 2,
        strokeColor: Color(0xffd34d7d),
        fillColor: Color(0x59d34d7d),
        consumeTapEvents: true,
        onTap: () {
          setState(() {
            this.affich = true;
            cases = '950';
            cured = '200';
            deaths = '100';
            this._circles.forEach((c) {
              Circle c2 = c.copyWith(
                fillColorParam: Color(0x59d34d7d),
              );
              this._circles2.add(c2);
            });
            this._circles.clear();
            this._circles2.forEach((c) {
              Circle c3 = c;
              this._circles.add(c3);
            });
            Circle crc = this
                ._circles
                .firstWhere((c) => c.circleId.value == "1",
                    orElse: () => this._circles.first)
                .copyWith(
                  fillColorParam: Color(0xffd34d7d),
                );
            this._circles.remove(crc);
            this._circles.add(crc);
          });
        }));
    _circles.add(Circle(
        circleId: CircleId("2"),
        center: LatLng(36.565463, 2.927622),
        radius: 8000,
        strokeWidth: 2,
        strokeColor: Color(0xffd34d7d),
        fillColor: Color(0x59d34d7d),
        consumeTapEvents: true,
        onTap: () {
          setState(() {
            this.affich = true;
            cases = '1500';
            cured = '560';
            deaths = '420';
            this._circles.forEach((c) {
              Circle c2 = c.copyWith(
                fillColorParam: Color(0x59d34d7d),
              );
              this._circles2.add(c2);
            });
            this._circles.clear();
            this._circles2.forEach((c) {
              Circle c3 = c;
              this._circles.add(c3);
            });
            Circle crc = this
                ._circles
                .firstWhere((c) => c.circleId.value == "2",
                    orElse: () => this._circles.first)
                .copyWith(
                  fillColorParam: Color(0xffd34d7d),
                );
            this._circles.remove(crc);
            this._circles.add(crc);
          });
        }));

  }

  void searchAndNavigate(searchAdr) {
    Geolocator().placemarkFromAddress(searchAdr).then((result) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(result[0].position.latitude, result[0].position.longitude),
        zoom: 10.0,
      )));
      print(result[0].position.latitude);
      print(result[0].position.longitude);
    });
  }

  void onMapCreated(GoogleMapController controller) {
    isMapCreated = true;
    changeMapMode();
    setState(() {
      _controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double h = media.height;
    double w = media.width;
    if (isMapCreated) {
      changeMapMode();
    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(36.7525, 3.04197),
            zoom: 10,
          ),
          onMapCreated: onMapCreated,
          circles: _circles,
        ),
        Positioned(
          left: w / 4,
          top: h / 30,
          child: Container(
            width: w / 1.9,
            height: 41.0,
            child: TextField(
              onChanged: (val) {
                setState(() {
                  searchAdr = val;
                });
              },

              onSubmitted:searchAndNavigate,
              decoration: InputDecoration(
                hintText: 'Search city...',
                fillColor: Color(0x00ffffffff),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15, top: 10),
                prefixIcon: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Icon(
                    (Icons.location_on),
                    color: Color(0xffD7659C),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0),
              color: const Color(0xffffffff),
            ),
          ),
        ),


        Visibility(
          visible: affich == true,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: h / 28,
                left: w / 22,
                right: w / 22,
                child: Container(
                  width: w,
                  height: h / 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: const Color(0xffffffff),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  SvgPicture.string(
                                    _svg_bc8iyr,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ],
                              ),
                              SizedBox(width: 3),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    cases,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 25,
                                      color: const Color(0xfffa7223),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Cases',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: const Color(0xfffa7223),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  SvgPicture.string(
                                    _svg_ocdi9,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    cured,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 25,
                                      color: const Color(0xff1abc9c),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Cured',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: const Color(0xff1abc9c),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Stack(children: <Widget>[
                                SvgPicture.string(
                                  _svg_qbicke,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ]),
                              SizedBox(width: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    deaths,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 25,
                                      color: const Color(0xffff545e),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Deaths',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: const Color(0xffff545e),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

const String _svg_ocdi9 =
    '<svg viewBox="5.0 5.5 37.6 37.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff1abc9c"  /><stop offset="1.0" stop-color="#ff4dbd6a"  /></linearGradient></defs><path transform="translate(0.0, 0.0)" d="M 38.31539535522461 7.358877182006836 C 36.43658447265625 5.897576332092285 31.3846607208252 3.39249062538147 23.82765007019043 9.822211265563965 C 16.1871395111084 3.267236471176147 11.13521671295166 5.81407356262207 9.256402015686035 7.233622550964355 C 4.287981510162354 11.0747537612915 3.578207492828369 19.92605590820313 7.586344718933105 27.39956474304199 C 12.55476474761963 36.62662506103516 22.65860939025879 42.2630729675293 23.07612419128418 42.51358413696289 C 23.28487968444824 42.63883590698242 23.49363899230957 42.68058776855469 23.7441463470459 42.68058776855469 L 23.78589820861816 42.68058776855469 L 23.8276481628418 42.68058776855469 C 24.03640747070313 42.68058776855469 24.28691291809082 42.63883590698242 24.49567031860352 42.51358413696289 C 24.91318511962891 42.2630729675293 35.01703262329102 36.62662506103516 39.98545074462891 27.44131469726563 C 43.99359130859375 20.00955963134766 43.2420654296875 11.20000839233398 38.31539535522461 7.358877182006836 Z M 37.60562133789063 26.10526847839355 C 33.68098831176758 33.37001419067383 25.99872207641602 38.42193984985352 23.78589820861816 39.75798416137695 C 21.57307243347168 38.42193984985352 13.89081001281738 33.41176986694336 10.00792789459229 26.14702033996582 C 6.250298500061035 19.17453193664551 7.586344718933105 12.03503894805908 10.96821022033691 9.44644832611084 C 13.89081001281738 7.191871643066406 18.14945602416992 8.36091136932373 22.74211120605469 12.61955833435059 C 22.74211120605469 12.61955833435059 22.78386306762695 12.61955833435059 22.78386306762695 12.66130924224854 C 22.78386306762695 12.66130924224854 22.78386306762695 12.7030611038208 22.82561302185059 12.7030611038208 C 23.32663154602051 13.24582862854004 24.20341110229492 13.2875804901123 24.74617958068848 12.78656387329102 C 29.38058662414551 8.486166954040527 33.68098831176758 7.358878135681152 36.64533615112305 9.613454818725586 C 39.98545455932617 12.11853981018066 41.32149887084961 19.21628189086914 37.60562133789063 26.10526847839355 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff1abc9c"  /><stop offset="1.0" stop-color="#ff4dbd6a"  /></linearGradient></defs><path transform="translate(-12.18, -11.74)" d="M 44.64639663696289 31.54520034790039 L 40.17899322509766 31.54520034790039 L 40.17899322509766 27.07779884338379 C 40.17899322509766 26.32627487182617 39.55271911621094 25.70000076293945 38.80119323730469 25.70000076293945 L 33.16475296020508 25.70000076293945 C 32.41322326660156 25.70000076293945 31.78695297241211 26.32627487182617 31.78695297241211 27.07779884338379 L 31.78695297241211 31.58695411682129 L 27.27779769897461 31.58695411682129 C 26.52627563476563 31.58695411682129 25.90000152587891 32.21322631835938 25.90000152587891 32.96475219726563 L 25.90000152587891 38.60119247436523 C 25.90000152587891 39.35271835327148 26.52627563476563 39.97898864746094 27.27779769897461 39.97898864746094 L 31.78695297241211 39.97898864746094 L 31.78695297241211 44.48814392089844 C 31.78695297241211 45.23966979980469 32.41322326660156 45.86594390869141 33.16475296020508 45.86594390869141 L 38.80119323730469 45.86594390869141 C 39.55271911621094 45.86594390869141 40.17899322509766 45.23966979980469 40.17899322509766 44.48814392089844 L 40.17899322509766 39.93724060058594 L 44.68814468383789 39.93724060058594 C 45.43967056274414 39.93724060058594 46.06594467163086 39.31096649169922 46.06594467163086 38.55944061279297 L 46.06594467163086 32.92299652099609 C 46.02418899536133 32.17147445678711 45.43967056274414 31.54520034790039 44.64639663696289 31.54520034790039 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qbicke =
    '<svg viewBox="6.5 2.7 37.3 40.5" ><path transform="translate(0.0, 0.0)" d="M 42.10974502563477 20.33261108398438 C 41.68225860595703 19.9478702545166 40.95553207397461 19.52038192749023 39.92955780029297 19.43488693237305 C 39.97230529785156 17.85317993164063 39.92955780029297 15.9722318649292 39.80130767822266 13.66379737854004 C 39.71581649780273 12.46683025360107 39.54481887817383 11.4408597946167 39.24557495117188 10.54313564300537 C 39.58756637573242 8.790434837341309 39.80130767822266 6.823990821838379 39.45932006835938 5.2850341796875 C 39.33106994628906 4.729299545288086 38.73258972167969 4.387309074401855 38.17685699462891 4.601053237915039 C 37.87761688232422 4.729299545288086 37.53562545776367 4.814797401428223 37.19363021850586 4.94304370880127 C 37.27912902832031 4.430058479309082 37.27912902832031 3.959820985794067 37.23638153076172 3.48958420753479 C 37.15088272094727 2.891101598739624 36.50965118408203 2.506361961364746 35.91116714477539 2.72010612487793 C 33.51723861694336 3.617830038070679 29.84084129333496 4.472805976867676 25.09572792053223 4.472805976867676 C 17.31544494628906 4.472805976867676 10.98862361907959 4.857545852661133 10.39013957977295 13.6210470199585 C 10.21914291381836 15.92948436737061 10.17639541625977 17.8104305267334 10.2618932723999 19.39213752746582 C 9.235920906066895 19.47763442993164 8.509191513061523 19.90512275695801 8.081704139709473 20.28985977172852 C 7.012984275817871 21.23033332824707 6.499999046325684 22.7692928314209 6.499999046325684 24.99223136901855 C 6.499999046325684 27.89914512634277 7.611468315124512 29.56634902954102 9.962651252746582 30.03658676147461 C 10.64663124084473 34.01222229003906 13.25430774688721 37.73136520385742 17.57193756103516 40.76652908325195 C 19.79487609863281 42.34823608398438 22.40255165100098 43.16046524047852 25.13847351074219 43.16046524047852 C 27.87439918518066 43.16046524047852 30.4820728302002 42.34823608398438 32.70500946044922 40.76652908325195 C 37.02264022827148 37.73136520385742 39.63031768798828 34.05497360229492 40.31430053710938 30.03658676147461 C 42.62273788452148 29.52360153198242 43.77695083618164 27.85639762878418 43.77695083618164 24.94947814941406 C 43.69145202636719 22.81204032897949 43.17846298217773 21.2730827331543 42.10974502563477 20.33261108398438 Z M 39.20282745361328 27.47166061401367 C 38.34785461425781 27.55715751647949 37.70661926269531 28.19839286804199 37.62112426757813 29.05336952209473 C 37.23638153076172 32.55876541137695 35.05619430541992 35.76492691040039 31.08055686950684 38.58634185791016 C 27.57515716552734 41.06577682495117 22.65904426574707 41.06577682495117 19.15364456176758 38.58634185791016 C 15.17800426483154 35.80767059326172 12.95506763458252 32.60151290893555 12.61307621002197 29.09611511230469 C 12.52757835388184 28.24114036560059 11.88634777069092 27.59990501403809 11.03137111663818 27.51440811157227 C 10.00539875030518 27.42891120910645 9.278670310974121 27.34341239929199 9.278670310974121 25.03497886657715 C 9.278670310974121 23.23952865600586 9.706158638000488 22.59829711914063 9.962651252746582 22.38455390930176 C 10.04814910888672 22.29905319213867 10.2618932723999 22.17080879211426 10.77487754821777 22.17080879211426 C 10.86037540435791 23.02578544616699 10.94587326049805 23.79526329040527 11.07411956787109 24.2655029296875 C 11.28786373138428 25.20597457885742 13.72454357147217 25.16322326660156 13.85278987884521 24.30825042724609 C 13.98103809356689 23.62427139282227 13.42530345916748 18.96464920043945 15.60549068450928 14.86076259613037 C 17.87117958068848 15.80123424530029 21.33383178710938 16.39972114562988 25.18122482299805 16.39972114562988 C 29.02861595153809 16.39972114562988 32.49126434326172 15.80123424530029 34.75695037841797 14.86076259613037 C 36.93714141845703 18.96464920043945 36.38140487670898 23.58151817321777 36.50965118408203 24.30825042724609 C 36.63790130615234 25.12047958374023 39.07458114624023 25.16322326660156 39.28832244873047 24.2655029296875 C 39.41657257080078 23.83801460266113 39.50206756591797 23.02578544616699 39.58756637573242 22.17080879211426 C 40.10054779052734 22.17080879211426 40.31429290771484 22.34180641174316 40.39978790283203 22.38455390930176 C 40.65628433227539 22.59829711914063 41.08377456665039 23.23952865600586 41.08377456665039 25.03497886657715 C 40.95552825927734 27.3006649017334 40.22879791259766 27.38616371154785 39.20282745361328 27.47166061401367 Z" fill="#ff545e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-17.4, -38.21)" d="M 46.90322113037109 69.40000152587891 L 38.09696960449219 69.40000152587891 C 37.41298675537109 69.40000152587891 36.90000152587891 69.95573425292969 36.90000152587891 70.59697723388672 C 36.90000152587891 71.28094482421875 37.45573425292969 71.79393768310547 38.09696960449219 71.79393768310547 L 46.8604736328125 71.79393768310547 C 47.54444885253906 71.79393768310547 48.05743408203125 71.23820495605469 48.05743408203125 70.59697723388672 C 48.10018157958984 69.95573425292969 47.54444885253906 69.40000152587891 46.90322113037109 69.40000152587891 Z" fill="#ff545e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-14.64, -24.45)" d="M 36.10408020019531 51.11402130126953 C 36.31782150268555 51.3277587890625 36.65980911254883 51.45600891113281 36.95904922485352 51.45600891113281 C 37.25829315185547 51.45600891113281 37.55753326416016 51.3277587890625 37.81402587890625 51.11402130126953 C 38.28426742553711 50.64379119873047 38.28426742553711 49.87430572509766 37.81402587890625 49.40406799316406 L 36.83080291748047 48.42084503173828 L 37.81402587890625 47.43762969970703 C 38.28426742553711 46.96739196777344 38.28426742553711 46.19791412353516 37.81402587890625 45.72767639160156 C 37.34378814697266 45.25743865966797 36.57431411743164 45.25743865966797 36.10408020019531 45.72767639160156 L 35.120849609375 46.71090698242188 L 34.13763046264648 45.72767639160156 C 33.66739654541016 45.25743865966797 32.89791488647461 45.25743865966797 32.42767715454102 45.72767639160156 C 31.95744323730469 46.19791412353516 31.95744323730469 46.96739196777344 32.42767715454102 47.43762969970703 L 33.41090393066406 48.42084503173828 L 32.42767715454102 49.40406799316406 C 31.95744323730469 49.87430572509766 31.95744323730469 50.64379119873047 32.42767715454102 51.11402130126953 C 32.64142227172852 51.3277587890625 32.9834098815918 51.45600891113281 33.28265380859375 51.45600891113281 C 33.5818977355957 51.45600891113281 33.88114166259766 51.3277587890625 34.13763046264648 51.11402130126953 L 35.120849609375 50.13079833984375 L 36.10408020019531 51.11402130126953 Z" fill="#ff545e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-27.01, -24.45)" d="M 59.41402816772461 45.72767639160156 C 58.94379043579102 45.25743865966797 58.17431259155273 45.25743865966797 57.70407485961914 45.72767639160156 L 56.72085189819336 46.71090698242188 L 55.73763656616211 45.72767639160156 C 55.26739883422852 45.25743865966797 54.49792098999023 45.25743865966797 54.02768325805664 45.72767639160156 C 53.55744552612305 46.19791412353516 53.55744552612305 46.96739196777344 54.02768325805664 47.43762969970703 L 55.01089859008789 48.42084503173828 L 54.02768325805664 49.40406799316406 C 53.55744552612305 49.87430572509766 53.55744552612305 50.64379119873047 54.02768325805664 51.11402130126953 C 54.24142074584961 51.3277587890625 54.58341598510742 51.45600891113281 54.88265609741211 51.45600891113281 C 55.18188858032227 51.45600891113281 55.48113632202148 51.3277587890625 55.73763656616211 51.11402130126953 L 56.72085189819336 50.13079833984375 L 57.70407485961914 51.11402130126953 C 57.91781234741211 51.3277587890625 58.25981521606445 51.45600891113281 58.55905532836914 51.45600891113281 C 58.85829544067383 51.45600891113281 59.15754318237305 51.3277587890625 59.41402816772461 51.11402130126953 C 59.8842658996582 50.64379119873047 59.8842658996582 49.87430572509766 59.41402816772461 49.40406799316406 L 58.43080520629883 48.42084503173828 L 59.41402816772461 47.43762969970703 C 59.8842658996582 46.96739196777344 59.8842658996582 46.19791412353516 59.41402816772461 45.72767639160156 Z" fill="#ff545e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bc8iyr =
    '<svg viewBox="2.4 21.7 46.6 27.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#fffa7223"  /><stop offset="1.0" stop-color="#fff7b031"  /></linearGradient></defs><path transform="translate(0.0, -11.17)" d="M 47.57897186279297 46.66929626464844 L 24.4014720916748 46.66929626464844 C 23.07844352722168 46.66929626464844 21.80441665649414 46.32628631591797 20.67739295959473 45.68927764892578 L 6.712092399597168 37.55509948730469 L 6.712092399597168 35.05604553222656 C 6.712092399597168 33.88002014160156 5.732071399688721 32.90000152587891 4.556046009063721 32.90000152587891 L 4.556046009063721 32.90000152587891 C 3.380020618438721 32.90000152587891 2.399999618530273 33.88002014160156 2.399999618530273 35.05604553222656 L 2.399999618530273 58.23355102539063 C 2.399999618530273 59.40957641601563 3.380020618438721 60.38959503173828 4.556046009063721 60.38959503173828 C 5.732071399688721 60.38959503173828 6.712092399597168 59.40957641601563 6.712092399597168 58.23355102539063 L 6.712092399597168 53.08843231201172 L 44.68790817260742 53.08843231201172 L 44.68790817260742 58.28254699707031 C 44.68790817260742 59.45857238769531 45.66793060302734 60.43859100341797 46.84395599365234 60.43859100341797 C 48.01998138427734 60.43859100341797 49.00000381469727 59.45857238769531 49.00000381469727 58.28254699707031 L 49.00000381469727 48.09032821655273 C 49.00000381469727 47.30631256103516 48.36298751831055 46.66929626464844 47.57897186279297 46.66929626464844 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#fffa7223"  /><stop offset="1.0" stop-color="#fff7b031"  /></linearGradient></defs><path transform="translate(-14.51, -14.01)" d="M 32.39198684692383 44.31497573852539 L 36.41007232666016 46.71602630615234 C 37.24309158325195 47.20603942871094 38.22311019897461 47.50004577636719 39.20313262939453 47.50004577636719 L 60.37158966064453 47.50004577636719 C 61.3026123046875 47.50004577636719 62.08662796020508 46.76502990722656 62.08662796020508 45.78500747680664 C 62.08662796020508 44.95198822021484 61.44961166381836 44.21697235107422 60.61659622192383 44.11897277832031 L 43.76023101806641 41.76692199707031 C 43.07421493530273 41.66891860961914 42.43720245361328 41.52191543579102 41.80018997192383 41.27690887451172 L 35.08704376220703 38.67985534667969 C 34.05802536010742 38.28784942626953 32.88199615478516 38.43484878540039 31.99998092651367 39.16986465454102 C 30.33394050598145 40.54189300537109 30.4809455871582 43.18795013427734 32.39198684692383 44.31497573852539 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sq5n4w =
    '<svg viewBox="356.2 498.3 18.7 12.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffd7659c"  /><stop offset="1.0" stop-color="#ff9f95e8"  /></linearGradient></defs><path transform="translate(190.23, 559.35)" d="M 166 -48.53925704956055 L 184.6911163330078 -48.53925704956055 L 184.6911163330078 -50.61605072021484 L 166 -50.61605072021484 L 166 -48.53925704956055 L 166 -48.53925704956055 Z M 166 -53.73123550415039 L 184.6911163330078 -53.73123550415039 L 184.6911163330078 -55.80802154541016 L 166 -55.80802154541016 L 166 -53.73123550415039 L 166 -53.73123550415039 Z M 166 -61 L 166 -58.9232063293457 L 184.6911163330078 -58.9232063293457 L 184.6911163330078 -61 L 166 -61 L 166 -61 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
