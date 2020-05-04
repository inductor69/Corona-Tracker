part of 'preventionScreens.dart';

class Continent {
  String name;
  List<String> countries;
  int _deaths = 0;
  int _recovered = 0;
  int _confirmed = 0;
  addValues(int d, int r, int c) {
    this._deaths = this._deaths + d;
    this._confirmed = this._confirmed + c;
    this._recovered = this._recovered + r;
  }
  Continent({@required this.name, this.countries});
}

class ReportsScreen extends StatefulWidget {
  final List<Result> resList;

  ReportsScreen({@required this.resList}) : assert(resList != null);
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}
class _ReportsScreenState extends State<ReportsScreen> {     
  List<Continent> continents = [
    Continent(name: 'Asia', countries: asia),
    Continent(name: 'Africa', countries: africa),
    Continent(name: 'Europe', countries: europe),
    Continent(name: 'North America', countries: northAmerica),
    Continent(name: 'South America', countries: southAmerica),
    Continent(name: 'Australia', countries: australia),
  ];

  @override
  void initState() {
    widget.resList.forEach((res){
      for (var i = 0; i < continents.length; i++) {
        if(continents[i].countries.contains(res.country)){
          continents[i].addValues(res.deaths, res.recovered, res.confirmed);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Continents', style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.keyboard_backspace, color: Colors.black,), onPressed: () => Navigator.pop(context),),
      ),      
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: continents.map((c) => Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(c.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(32),),),
                  Column(
                    children: <Widget>[
                      Image.asset('img/${c.name.toLowerCase().replaceAll(" ", "")}.jpg', height: ScreenUtil().setHeight(600), fit: BoxFit.contain,),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(c._confirmed.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(52), fontWeight: FontWeight.w600)),
                              Text('CONFIRMED', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(c._recovered.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(52), fontWeight: FontWeight.w600)),
                              Text('RECOVERED', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(c._deaths.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(52), fontWeight: FontWeight.w600)),
                              Text('DEATHS', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w600))
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  )                
                ],
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}

List<String> africa =[
    "Algeria",
    "Angola",
    "Botswana",
    "Burkina Faso",
    "Burundi",
    "Cameroon",
    "Cape Verde",
    "Central African Republic",
    "Chad",
    "Comoros",
    "Republic of the Congo",
    "Democratic Republic of the Congo",
    "Côte d'Ivoire",
    "Djibouti",
    "Egypt",
    "Equatorial Guinea",
    "Eritrea",
    "Ethiopia",
    "Gabon",
    "The Gambia",
    "Ghana",
    "Guinea",
    "Guinea-Bissau",
    "Kenya",
    "Lesotho",
    "Liberia",
    "Libya",
    "Madagascar",
    "Malawi",
    "Mali",
    "Mauritania",
    "Mauritius",
    "Morocco",
    "Mozambique",
    "Namibia",
    "Niger",
    "Nigeria",
    "Rwanda",
    "São Tomé and Príncipe",
    "Senegal",
    "Seychelles",
    "Sierra Leone",
    "Somalia",
    "South Africa",
    "South Sudan",
    "Sudan",
    "Swaziland",
    "Tanzania",
    "Togo",
    "Tunisia",
    "Uganda",
    "Western Sahara",
    "Zambia",
    "Zimbabwe",
  ];

  List<String> asia = [
    "Afghanistan",
    "Armenia",
    "Azerbaijan",
    "Bahrain",
    "Bangladesh",
    "Bhutan",
    "Brunei",
    "Cambodia",
    "China",
    "Cyprus",
    "East Timor",
    "Georgia",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Israel",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Lebanon",
    "Malaysia",
    "Maldives",
    "Mongolia",
    "Myanmar",
    "Nepal",
    "North Korea",
    "Oman",
    "Pakistan",
    "Palestine",
    "Philippines",
    "Qatar",
    "Russia",
    "Saudi Arabia",
    "Singapore",
    "South Korea",
    "Sri Lanka",
    "Syria",
    "Tajikistan",
    "Thailand",
    "Turkey",
    "Turkmenistan",
    "Taiwan",
    "UAE",
    "Uzbekistan",
    "Vietnam",
    "Yemen",
  ];

  List<String> europe = [
    "Albania",
    "Andorra",
    "Austria",
    "Belarus",
    "Belgium",
    "Bosnia",
    "Bulgaria",
    "Croatia",
    "Czech Republic",
    "Denmark",
    "Estonia",
    "Finland",
    "France",
    "Germany",
    "Greece",
    "Hungary",
    "Iceland",
    "Republic of Ireland",
    "Italy",
    "Kosovo",
    "Latvia",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "North Macedonia",
    "Malta",
    "Moldova",
    "Monaco",
    "Montenegro",
    "Norway",
    "Poland",
    "Portugal",
    "Romania",
    "San Marino",
    "Serbia",
    "Slovakia",
    "Slovenia",
    "Spain",
    "Sweden",
    "Switzerland",
    "Ukraine",
    "UK",
    "Vatican City",
  ];

  List<String> northAmerica = [
    "Antigua and Barbuda",
    "Anguilla",
    "Aruba",
    "The Bahamas",
    "Barbados",
    "Belize",
    "Bermuda",
    "Bonaire",
    "British Virgin Islands",
    "Canada",
    "Cayman Islands",
    "Clipperton Island",
    "Costa Rica",
    "Cuba",
    "Curaçao",
    "Dominica",
    "Dominican Republic",
    "El Salvador",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guatemala",
    "Haiti",
    "Honduras",
    "Jamaica",
    "Martinique",
    "Mexico",
    "Montserrat",
    "Navassa Island",
    "Nicaragua",
    "Panama",
    "Puerto Rico",
    "Saba",
    "Saint Barthelemy",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Martin",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Sint Eustatius",
    "Sint Maarten",
    "Trinidad and Tobago",
    "Turks and Caicos",
    "USA",
    "US Virgin Islands",
  ];

  List<String> southAmerica = [
    "Argentina",
    "Bolivia",
    "Brazil",
    "Chile",
    "Colombia",
    "Ecuador",
    "Falkland Islands",
    "French Guiana",
    "Guyana",
    "Paraguay",
    "Peru",
    "South Georgia"
    "Suriname",
    "Uruguay",
    "Venezuela",
  ];

  List<String> australia = [
    "Australia",
    "Federated States of Micronesia",
    "Fiji",
    "Kiribati",
    "Marshall Islands",
    "Nauru",
    "New Zealand ",
    "Palau",
    "Papua New Guinea",
    "Samoa",
    "Solomon Islands",
    "Tonga",
    "Tuvalu",
    "Vanuatu ",
  ];
