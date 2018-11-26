ArrayList<ParticleSystem> ps;

int WIDTH = 620;
int HEIGHT = 900;

int ChicoX = WIDTH/2;    int ReddingX = 270;       int YubaCityX = 350;        int SantaRosaX = 140;         int SanJoseX = WIDTH/3;      int SantaCruzX = 195;
int ChicoY = 200;        int ReddingY = 100;       int YubaCityY = 320;        int SantaRosaY = 330;         int SanJoseY = 510;          int SantaCruzY = 585;

int SFX = 150;           int ModestoX = 375;       int OaklandX = 200;         int EurekaX = 100;            int FresnoX = 450;
int SFY = 425;           int ModestoY = 500;       int OaklandY = 415;         int EurekaY = 90;            int FresnoY = 670;

String ChicoZip = "95926";      String ReddingZip = "96001";      String YubaCityZip = "95991";      String FresnoZip = "93650";
String SFZip = "94016";         String SantaRosaZip = "95401";    String ModestoZip = "95350";       String SantaCruzZip = "95060";
String OaklandZip = "94577";    String EurekaZip = "95501";       String SanJoseZip = "94088";       


// Must add zipcode for these strings
String xmlToLoadCurpart1 = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/xml&zipCode=";
String xmlToLoadCurpart2 = "&distance=25&API_KEY=E01CF7CC-C84B-47E6-8C8F-4A302C117E8B";

// Must add zipcode and time in format (YYYY-MM-DD)
String xmlToLoadHistpart1 = "http://www.airnowapi.org/aq/observation/zipCode/historical/?format=application/xml&zipCode=";
String xmlToLoadHistpart2 = "&date=";
String xmlToLoadHistpart3 = "T00-0000&distance=25&API_KEY=E01CF7CC-C84B-47E6-8C8F-4A302C117E8B";

// This is the input date so the user can see whichever date they please
String userInput = "";
String histDate = "";


void setup() {
  size(620, 900);
  ps = new ArrayList<ParticleSystem>();
  setUpCurrentConditions(ps);
}

// will set up the map with the current AQI
void setUpCurrentConditions(ArrayList<ParticleSystem> ps) {
  ps.clear();
  
  // Adding Chico to the map
  XML xmlChico = loadXML(xmlToLoadCurpart1 + ChicoZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(ChicoX, ChicoY), getPMAQI(xmlChico))); 
  
  // Redding
  XML xmlRedding = loadXML(xmlToLoadCurpart1 + ReddingZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(ReddingX, ReddingY), getPMAQI(xmlRedding)));
  
  // Yuba City
  XML xmlYubaCity = loadXML(xmlToLoadCurpart1 + YubaCityZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(YubaCityX, YubaCityY), getPMAQI(xmlYubaCity)));
  
  // San Francisco
  XML xmlSF = loadXML(xmlToLoadCurpart1 + SFZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(SFX, SFY), getPMAQI(xmlSF)));  
  
  // Modesto
  XML xmlModesto = loadXML(xmlToLoadCurpart1 + ModestoZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(ModestoX, ModestoY), getPMAQI(xmlModesto))); 
  
  // Oakland
  XML xmlOakland = loadXML(xmlToLoadCurpart1 + OaklandZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(OaklandX, OaklandY), getPMAQI(xmlOakland))); 

  // Santa Rosa
  XML xmlSantaRosa = loadXML(xmlToLoadCurpart1 + SantaRosaZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(SantaRosaX, SantaRosaY), getPMAQI(xmlSantaRosa))); 
  
  // Eureka
  XML xmlEureka = loadXML(xmlToLoadCurpart1 + EurekaZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(EurekaX, EurekaY), getPMAQI(xmlEureka))); 
  
  // San Jose
  XML xmlSanJose = loadXML(xmlToLoadCurpart1 + SanJoseZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(SanJoseX, SanJoseY), getPMAQI(xmlSanJose)));
  
  // Fresno
  XML xmlFresno = loadXML(xmlToLoadCurpart1 + FresnoZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(FresnoX, FresnoY), getPMAQI(xmlFresno)));
  
  // Santa Cruz
  XML xmlSantaCruz = loadXML(xmlToLoadCurpart1 + SantaCruzZip + xmlToLoadCurpart2);
  ps.add(new ParticleSystem(new PVector(SantaCruzX, SantaCruzY), getPMAQI(xmlSantaCruz)));
}


// Will set up the map with a historical AQI
void setUpHistoricalConditions(ArrayList<ParticleSystem> ps, String date) {
  ps.clear(); 
  
  // Adding Chico to the map
  XML xmlChico = loadXML(xmlToLoadHistpart1 + ChicoZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  int chicoAQI = getPMAQI(xmlChico);
  ps.add(new ParticleSystem(new PVector(ChicoX, ChicoY), chicoAQI));
  
  // Redding  
  XML xmlRedding = loadXML(xmlToLoadHistpart1 + ReddingZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(ReddingX, ReddingY), getPMAQI(xmlRedding)));
  
  // Yuba City
  XML xmlYubaCity = loadXML(xmlToLoadHistpart1 + YubaCityZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(YubaCityX, YubaCityY), getPMAQI(xmlYubaCity)));
  
  // San Francisco
  XML xmlSanFrancisco = loadXML(xmlToLoadHistpart1 + SFZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(SFX, SFY), getPMAQI(xmlSanFrancisco)));
  
  // Modesto
  XML xmlModesto = loadXML(xmlToLoadHistpart1 + ModestoZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(ModestoX, ModestoY), getPMAQI(xmlModesto)));
  
  // Oakland
  XML xmlOakland = loadXML(xmlToLoadHistpart1 + OaklandZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(OaklandX, OaklandY), getPMAQI(xmlOakland)));
  
  // Santa Rosa
  XML xmlSantaRosa = loadXML(xmlToLoadHistpart1 + SantaRosaZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(SantaRosaX, SantaRosaY), getPMAQI(xmlSantaRosa)));
  
  // Eureka
  XML xmlEureka = loadXML(xmlToLoadHistpart1 + EurekaZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(EurekaX, EurekaY), getPMAQI(xmlEureka)));  
  
  // San Jose
  XML xmlSanJose = loadXML(xmlToLoadHistpart1 + SanJoseZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(SanJoseX, SanJoseY), getPMAQI(xmlSanJose)));    
  
  // Fresno 
  XML xmlFresno = loadXML(xmlToLoadHistpart1 + FresnoZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(FresnoX, FresnoY), getPMAQI(xmlFresno)));
  
  // Santa Cruz
  XML xmlSantaCruz = loadXML(xmlToLoadHistpart1 + SantaCruzZip + xmlToLoadHistpart2 + date + xmlToLoadHistpart3);
  ps.add(new ParticleSystem(new PVector(SantaCruzX, SantaCruzY), getPMAQI(xmlSantaCruz)));
}


// This function is given an XML data sheet with the PM 2.5, PM 10, and ozone AQIs along with a lot of other information and returns the PM 2.5 AQI
int getPMAQI(XML data) {  
  int aqi;
  try {
    XML[] aqiData = data.getChildren("ObsByZip/AQI");
    if (aqiData.length > 2) aqi = aqiData[1].getIntContent();
    else aqi = aqiData[0].getIntContent();
    return aqi;
  } catch (Exception e) {
    return 0;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < ps.size(); i++) {
    ParticleSystem cur = ps.get(i);
    cur.addParticle();
    cur.run();
  }
  
  fill(255);
  String city = overCity();
  if (city != null) text(city, mouseX, mouseY);
  
  noFill();
  stroke(255);
  rect(20, 855, 120, 20);
  text("Current Conditions", 25, 870);
  
  text("Enter date in format YYYY-MM-DD:", 150, 870);
  rect(360, 855, 100, 20);
  text(userInput, 365, 870);
  
  if (histDate != "" && validDate(histDate)) {
    userInput = "";
    setUpHistoricalConditions(ps, histDate);
    histDate = "";
  }
}

String overCity() {
  String city = null;
  
  if (mouseX < ChicoX + 30 && mouseX > ChicoX - 30 && mouseY < ChicoY + 30 && mouseY > ChicoY - 30) {
    city = "Chico";
  }
  if (mouseX < ReddingX + 30 && mouseX > ReddingX - 30 && mouseY < ReddingY + 30 && mouseY > ReddingY - 30) {
    city = "Redding";
  }
  if (mouseX < YubaCityX + 30 && mouseX > YubaCityX - 30 && mouseY < YubaCityY + 30 && mouseY > YubaCityY - 30) {
    city = "Yuba City";
  }
  if (mouseX < SFX + 30 && mouseX > SFX - 30 && mouseY < SFY + 30 && mouseY > SFY - 30) {
    city = "San Francisco";
  }
  if (mouseX < ModestoX + 30 && mouseX > ModestoX - 30 && mouseY < ModestoY + 30 && mouseY > ModestoY - 30) {
    city = "Modesto";
  }
  if (mouseX < OaklandX + 30 && mouseX > OaklandX - 30 && mouseY < OaklandY + 30 && mouseY > OaklandY - 30) {
    city = "Oakland";
  }
  if (mouseX < SantaRosaX + 30 && mouseX > SantaRosaX - 30 && mouseY < SantaRosaY + 30 && mouseY > SantaRosaY - 30) {
    city = "Santa Rosa";
  }
  if (mouseX < EurekaX + 30 && mouseX > EurekaX - 30 && mouseY < EurekaY + 30 && mouseY > EurekaY - 30) {
    city = "Eureka";
  }
  if (mouseX < SanJoseX + 30 && mouseX > SanJoseX - 30 && mouseY < SanJoseY + 30 && mouseY > SanJoseY - 30) {
    city = "San Jose";
  }
  if (mouseX < FresnoX + 30 && mouseX > FresnoX - 30 && mouseY < FresnoY + 30 && mouseY > FresnoY - 30) {
    city = "Fresno";
  }
  if (mouseX < SantaCruzX + 30 && mouseX > SantaCruzX - 30 && mouseY < SantaCruzY + 30 && mouseY > SantaCruzY - 30) {
    city = "Santa Cruz";
  }
  
  return city;
}

// Updates the user input text box for inputting a day
void keyPressed() {
  if (key == ENTER || key == RETURN) {
      histDate = userInput;
      userInput = "";
  } else {
      userInput = userInput + key;  
  }
}

// Determines if the button 'Current Conditions' is clicked, then the current conditions will be displayed
void mouseClicked() {
  if (mouseX > 20 && mouseX < 150 && mouseY > 855 && mouseY < 875) {
    setUpCurrentConditions(ps);
  }
}

// A valid date is in format YYYY-MM-DD, a valid year from 2010 to present,
// a valid month from 01 to 12, and a valid day 
boolean validDate(String date) {
  if (date.indexOf('-') != 4 || date.indexOf('-', 4) != 7) return false;
  try {
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8);
    try { 
      int y = Integer.parseInt(year); 
      if (y < 2010 || y > year()) return false;
    } catch (Exception e) { return false; }
    try { 
      int m = Integer.parseInt(month); 
      println(m);
      if (m > 12 || m < 0) return false;
    } catch (Exception e) { return false; }
    try { 
      int d = Integer.parseInt(day); 
      int m = Integer.parseInt(month);
      int y = Integer.parseInt(year);
      if (!validDay(y, m, d)) return false;
    } catch (Exception e) {return false; }
  } catch (Exception e) { return false; } 
  return true;
}

boolean validDay(int y, int m, int d) {
  if (d <= 0) return false;
  // Any of these months have 31 days
  if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
    if (d > 31) return false;
  }
  // February has 28 days, except for leap year
  else if (m == 2) {
    // leap year
    if (y%4  == 0 && d > 29) return false;  
    // non leap years in february
    else if (d > 28) return false;
  }
  // These months can only have 30 days
  else if (m == 4 || m == 6 || m == 9 || m == 11) {
    if (d > 30) return false;  
  }
  return true;
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  int AQI;

  ParticleSystem(PVector position, int aqi) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
    AQI = aqi;
  }

  void addParticle() {
    particles.add(new Particle(origin, AQI));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  float lifespan;

  Particle(PVector l, int AQI) {    
    velocity = new PVector(random(-.5, .5), random(-.5, .5));
    position = l.copy();
    lifespan = AQI*2; // *2 to make it more dramatic
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, 0, 0, lifespan);
    fill(255, 0, 0, lifespan); 
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
