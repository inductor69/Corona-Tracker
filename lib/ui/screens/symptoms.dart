part of 'preventionScreens.dart';


class SymptomsScreen extends StatefulWidget {
  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  List < ExpandableItems > items = < ExpandableItems > [
    new ExpandableItems(
      false,
      'Fever',      
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Fever is a key symptom, experts say. Don't fixate on a number, but know it's really not a fever until your temperature reaches at least 100 degrees Fahrenheit (37.7 degrees Celsius) for children and adults.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),)
          ]
        )
      ), 
      Image.asset('img/fever.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Cough',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),        
        child: new Column(
          children: < Widget > [
            Text('''Coughing is another key symptom, but it's not just any cough, said Schaffner. It should be a dry cough that you feel in your chest.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),),
          ]
        )
      ), 
      Image.asset('img/symptoms.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Difficulty Breathing',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),
        child: new Column(
          children: < Widget > [
            Text('''Shortness of breath can be a third and very serious manifestation of Covid-19, and it can occur on its own, without a cough. If your chest becomes tight or you begin to feel as if you cannot breathe deeply enough to get a good breath, that's a sign to act, experts say. In addition to difficulty breathing or shortness of breath, the CDC lists emergency warning signs for Covid-19 as a "persistent pain or pressure in the chest," "bluish lips or face" which indicates a lack of oxygen and any sudden mental confusion or lethargy and inability to rouse.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),),
          ]
        )
      ), 
      Image.asset('img/lungs.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Muscle Pain',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),        
        child: new Column(
          children: < Widget > [
            Text('''Muscle aches are extremely common. Almost everyone has experienced discomfort in their muscles at some point. Because there’s muscle tissue in nearly all parts of the body, this type of pain can be felt practically anywhere. However, there’s no single cause for muscle aches and pains. While overuse or injury is common, there are other possible explanations for ongoing discomfort.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),),
          ]
        )
      ), 
      Image.asset('img/pain.png', height: 20, width: 20, color: Colors.blue[900],),
    ),
    new ExpandableItems(
      false,
      'Tiredness',
      new Padding(
        padding: new EdgeInsets.only(left:15.0, right: 15, bottom: 20),      
        child: new Column(
          children: < Widget > [
            Text('''If you can’t muster the energy to show up for your go-to workout, let alone get out of bed, intense fatigue could be another sign that your body’s working hard to battle an infection like COVID-19 (or, again, the flu), says Dr. Younus.''', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400, color: Colors.grey[600]),),
          ]
        )
      ), 
      Image.asset('img/tired.png', height: 20, width: 20, color: Colors.blue[900],),
    )
  ];

  ListView symptomsList;
  @override
  Widget build(BuildContext context) {
    symptomsList = new ListView(
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
                    children: <Widget>[
                      item.iconpic,
                      SizedBox(width: 10,),
                      new Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          fontWeight: FontWeight.w600,
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
        title: Text('Symptoms'),
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
                child: symptomsList
              ),
              Image.asset('img/social_distancing.png', fit: BoxFit.cover, height: 300,),
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
            data: """<h2><strong>What is Covid-19?</strong></h2>
<p>It is caused by a member of the coronavirus family that has never been encountered before. Like other coronaviruses, it has come from animals. The World Health Organisation (WHO) has declared it a pandemic.</p>
<h2><strong>What are the symptoms this coronavirus causes?</strong></h2>
<p>According to the WHO, the most common symptoms of Covid-19 are fever, tiredness and a dry cough. Some patients may also have a runny nose, sore throat, nasal congestion and aches and pains or diarrhoea. About 80% of people who get Covid-19 experience a mild case – about as serious as a regular cold – and recover without needing any special treatment.</p>
<p>As this is viral pneumonia, antibiotics are of no use. The antiviral drugs we have against flu will not work, and there is currently no vaccine. Recovery depends on the strength of the immune system.</p>
<p>People may be sick with the virus for 1 to 14 days before developing symptoms. The most common symptoms of coronavirus disease (COVID-19) are fever, tiredness, and dry cough. Most people (about 80%) recover from the disease without needing special treatment.</p>
<p>More rarely, the disease can be serious and even fatal. Older people, and people with other medical conditions (such as asthma, diabetes, or heart disease), may be more vulnerable to becoming severely ill.</p>
<p>In the UK, the National health Service (NHS) has identified the symptoms to look for as experiencing either:</p>
<ul>
<li><b>High Temperature : You feel hot to touch on your chest or back</b></li>
<li><b>New Continuous Cough : This means you’ve started coughing repeatedly</b></li>
</ul>
<p>About one in six people, the WHO says, become seriously ill. The elderly and people with underlying medical problems like high blood pressure, heart problems or diabetes, or chronic respiratory conditions, are at a greater risk of serious illness from Covid-19.</p>
<h2><strong>Should I go to the doctor if I have a temperature or a cough?</strong></h2>
<p>No. In the UK, the NHS advice is now that anyone with symptoms should <strong>stay at home for at least 7 days</strong>. If you live with other people, <strong>they should stay at home for at least 14 days</strong>, to avoid spreading the infection outside the home. This applies to everyone, regardless of whether they have travelled abroad.</p>
<p>In the UK, you should look on the dedicated coronavirus NHS 111 website</a> for information. If you get worse or your symptoms last longer than seven days, you should call NHS 111. People will no longer be tested for the virus unless they are in hospital.</p>
<p>Many countries have imposed travel bans and lockdown conditions in order to try and halt the spread of the virus. You should check with your local authorities for the latest advice on seeking medical assistance.</p>

<h2><strong>How many people have been affected?</strong></h2>
<p>China’s national health commission confirmed human-to-human transmission in January. As of 20 March, <strong>more than 275,000 people have been infected</strong> in more than 150 countries, according to the Johns Hopkins University Center for Systems Science and Engineering.</p>
<p>There have been <strong>over 11,000 deaths globally</strong>. Just over 3,200 of those deaths have occurred in mainland China. Italy has seen over 4,000 deaths. More than <strong>86,000 people are recorded as having recovered</strong> from the coronavirus.</p>
<h2><strong>Why is this worse than normal influenza, and how worried are the experts?</strong></h2>
<p>We don’t yet know how dangerous the new coronavirus is, and we won’t know until more data comes in, but estimates of the mortality rate have ranged from well below 1% in the young to over 3% among those who are elderly or have underlying health conditions. Seasonal flu typically has a mortality rate below 1% and is thought to cause about 400,000 deaths each year globally. Sars had a death rate of more than 10%.</p>
<p>Another key unknown is how contagious the coronavirus is. A crucial difference is that unlike flu, there is no vaccine for the new coronavirus, which means it is more difficult for vulnerable members of the population – elderly people or those with existing respiratory or immune problems – to protect themselves. Hand-washing and avoiding other people if you feel unwell are important.</p>
<h2><strong>Have there been other coronaviruses?</strong></h2>
<p>Severe acute respiratory syndrome (Sars) and Middle Eastern respiratory syndrome (Mers) are both caused by coronaviruses that came from animals. In 2002, Sars spread virtually unchecked to 37 countries, causing global panic, infecting more than 8,000 people and killing more than 750. Mers appears to be less easily passed from human to human, but has greater lethality, killing 35% of about 2,500 people who have been infected.</p>
""",           
          ),
              )
            ],
          ),
        ),
      ),
    );

    return scaffold;
  }
}
