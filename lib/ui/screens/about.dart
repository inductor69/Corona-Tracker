part of 'preventionScreens.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('About', style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.keyboard_backspace, color: Colors.black,), onPressed: () => Navigator.pop(context),),
      ),  
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Html(
            defaultTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(30),),
                  customTextStyle: (dom.Node node, TextStyle baseStyle) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "p":
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "li" :
                          return baseStyle.merge(TextStyle(height: 1.5));
                        case "h2" :
                          return baseStyle.merge(TextStyle(fontSize: 60));
                      }
                    }
                    return baseStyle;
                  },
            data: '''<div><p>Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.<o:p></o:p><br></p><p>Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.&nbsp; Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.<o:p></o:p><br></p><p>The best way to prevent and slow down transmission is be well informed about the COVID-19 virus, the disease it causes and how it spreads. Protect yourself and others from infection by washing your hands or using an alcohol based rub frequently and not touching your face.&nbsp; </p><p>The COVID-19 virus spreads primarily through droplets of saliva or discharge from the nose when an infected person coughs or sneezes, so it’s important that you also practice respiratory etiquette (for example, by coughing into a flexed elbow).</p><p><o:p>At this time, there are no specific vaccines or treatments for COVID-19. However, there are many ongoing clinical trials evaluating potential treatments. WHO will continue to provide updated information as soon as clinical findings become available.</o:p></div>''',
          ),
        ),
      ),
      
    );
  }
}