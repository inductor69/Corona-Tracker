part of 'preventionScreens.dart';


class PreventionScreen extends StatefulWidget {
  @override
  _PreventionScreenState createState() => _PreventionScreenState();
}

class _PreventionScreenState extends State<PreventionScreen> {
  List < ExpandableItems > items = < ExpandableItems > [
    new ExpandableItems(
      false,
      'Wash your hands frequently',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\n\nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/wash.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Maintain social distancing',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.\n\nWhy? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/group.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Avoid touching eyes, nose and mouth',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/illness.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Practice respiratory hygiene',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.\n\nWhy? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/hygine.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Seek medical care early',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.\n\nWhy? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/health.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
  ];
  ListView preventionList;
  @override
  Widget build(BuildContext context) {
    preventionList = new ListView(
      children: [
        new ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              items[index].isExpanded = !items[index].isExpanded;
            });
          },
          children: items.map((ExpandableItems item) {
            return new ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return new ListTile(
                  // leading: item.iconpic,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      item.iconpic,
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 220,
                        child: new Text(
                          item.header,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              isExpanded: item.isExpanded,
              body: item.body,
            );
          }).toList(),
        )
      ],
    );

    Scaffold scaffold = new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () => Navigator.pop(context),),
        title: Text('Prevention'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
        color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue[900],
                padding: EdgeInsets.all(30),
                height: 400,
                child: preventionList
              ),
              Image.asset('img/wash_hands.png', fit: BoxFit.cover, height: 300,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Html(
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(30)),
                  customTextStyle: (dom.Node node, TextStyle baseStyle) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "p":
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "li" :
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "h2" :
                        return baseStyle.merge(TextStyle(fontSize: ScreenUtil().setSp(50),));
                      }
                    }
                    return baseStyle;
                  },
                  data: '''
                  <h2>Preventing the Spread of Coronavirus Disease 2019 in Homes and Residential Communities</h2>             
                  <ul>
                  <li>Wash your hands frequently for at least 20 seconds at a time with warm water and soap. How long is 20 seconds? About as long as it takes to sing your “ABCs.”</li>
                  <li>Don’t touch your face, eyes, nose, or mouth when your hands are dirty.</li>                  
                  <li>Don’t go out if you’re feeling sick or have any cold or flu symptoms.</li>
                  <li>Stay at least 3 feet away from anyone who is coughing or sneezing.</li>
                  <li>Cover your mouth with the inside of your elbow whenever you sneeze or cough. Throw away any tissues you use right away.</li>
                  <li>Clean any objects you touch a lot. Use disinfectants on objects like phones, computers, utensils, dishware, and doorknobs. </li>
                  </ul>''',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Html(
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(30)),
                  customTextStyle: (dom.Node node, TextStyle baseStyle) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "p":
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "li" :
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "h2" :
                          return baseStyle.merge(TextStyle(fontSize: ScreenUtil().setSp(50),));
                      }
                    }
                    return baseStyle;
                  },
                  data:'''<div class="col-md-12"><h2><strong><a id="precautions"></a>Recommended precautions for household members, intimate partners, and caregivers in a nonhealthcare setting<a href="#f1"><sup>1</sup></a><a id="precautions"></a>&nbsp;of</strong></h2>
<div class="card mb-3"><div class="card-body bg-amber-t"><p><strong>A patient with symptomatic laboratory-confirmed COVID-19</strong></p>
<p><strong>OR</strong></p>
<p><strong>A patient under investigation</strong></p>
</div></div><p>Household members, intimate partners, and caregivers in a nonhealthcare setting may have close contact<sup><a href="#f2">2</a></sup> with a person with symptomatic, laboratory-confirmed COVID-19 or a person under investigation. Close contacts should monitor their health; they should call their healthcare provider right away if they develop symptoms suggestive of COVID-19 (e.g., fever, cough, shortness of breath)</p>
<p>Close contacts should also follow these recommendations:</p>
<ul>
<li>Make sure that you understand and can help the patient follow their healthcare provider’s instructions for medication(s) and care. You should help the patient with basic needs in the home and provide support for getting groceries, prescriptions, and other personal needs.</li>
<li>Monitor the patient’s symptoms. If the patient is getting sicker, call his or her healthcare provider and tell them that the patient has laboratory-confirmed COVID-19. This will help the healthcare provider’s office take steps to keep other people in the office or waiting room from getting infected. Ask the healthcare provider to call the local or state health department for additional guidance. If the patient has a medical emergency and you need to call 911, notify the dispatch personnel that the patient has, or is being evaluated for COVID-19.</li>
<li>Household members should stay in another room or be separated from the patient as much as possible. Household members should use a separate bedroom and bathroom, if available.</li>
<li>Prohibit visitors who do not have an essential need to be in the home.</li>
<li>Household members should care for any pets in the home. Do not handle pets or other animals while sick.&nbsp; For more information, see COVID-19 and Animals.</li>
<li>Make sure that shared spaces in the home have good air flow, such as by an air conditioner or an opened window, weather permitting.</li>
<li>Perform hand hygiene frequently. Wash your hands often with soap and water for at least 20 seconds or use an alcohol-based hand sanitizer that contains 60 to 95% alcohol, covering all surfaces of your hands and rubbing them together until they feel dry. Soap and water should be used preferentially if hands are visibly dirty.</li>
<li>Avoid touching your eyes, nose, and mouth with unwashed hands.</li>
<li>The patient should wear a facemask when you are around other people. If the patient is not able to wear a facemask (for example, because it causes trouble breathing), you, as the caregiver, should wear a mask when you are in the same room as the patient.</li>
<li>Wear a disposable facemask and gloves when you touch or have contact with the patient’s blood, stool, or body fluids, such as saliva, sputum, nasal mucus, vomit, urine.
<ul>
<li>Throw out disposable facemasks and gloves after using them. Do not reuse.</li>
<li>When removing personal protective equipment, first remove and dispose of gloves. Then, immediately clean your hands with soap and water or alcohol-based hand sanitizer. Next, remove and dispose of facemask, and immediately clean your hands again with soap and water or alcohol-based hand sanitizer.</li>
</ul>
</li>
<li>Avoid sharing household items with the patient. You should not share dishes, drinking glasses, cups, eating utensils, towels, bedding, or other items. After the patient uses these items, you should wash them thoroughly (see below “Wash laundry thoroughly”).</li>
<li>Clean all “high-touch” surfaces, such as counters, tabletops, doorknobs, bathroom fixtures, toilets, phones, keyboards, tablets, and bedside tables, every day. Also, clean any surfaces that may have blood, stool, or body fluids on them.
<ul>
<li>Use a household cleaning spray or wipe, according to the label instructions. Labels contain instructions for safe and effective use of the cleaning product including precautions you should take when applying the product, such as wearing gloves and making sure you have good ventilation during use of the product.</li>
</ul>
</li>
<li>Wash laundry thoroughly.
<ul>
<li>Immediately remove and wash clothes or bedding that have blood, stool, or body fluids on them.</li>
<li>Wear disposable gloves while handling soiled items and keep soiled items away from your body. Clean your hands (with soap and water or an alcohol-based hand sanitizer) immediately after removing your gloves.</li>
<li>Read and follow directions on labels of laundry or clothing items and detergent. In general, using a normal laundry detergent according to washing machine instructions and dry thoroughly using the warmest temperatures recommended on the clothing label.</li>
</ul>
</li>
<li>Place all used disposable gloves, facemasks, and other contaminated items in a lined container before disposing of them with other household waste. Clean your hands (with soap and water or an alcohol-based hand sanitizer) immediately after handling these items. Soap and water should be used preferentially if hands are visibly dirty.</li>
<li>Discuss any additional questions with your state or local health department or healthcare provider. Check available hours when contacting your local health department.</li>
</ul>
<p> </p>
<h2>Close contact is defined as</h2>
<p>a) being within approximately 6 feet (2 meters) of a COVID-19 case for a prolonged period of time; close contact can occur while caring for, living with, visiting, or sharing a health care waiting area or room with a COVID-19 case</p>
<p><em>– or –</em></p>
<p>b) having direct contact with infectious secretions of a COVID-19 case (e.g., being coughed on).</p>
</div>'''
                ),
              )
            ]
          )
        )
      ),
    );
        
    return scaffold;
  }
}
