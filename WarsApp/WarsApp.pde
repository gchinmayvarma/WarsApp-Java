boolean displayimages = true ; 
void setup() {
  //orientation(PORTRAIT) ; fullScreen() ; displayimages = false ; 
  size(450, 800) ; // frameRate(1000) ; 
  particles = new ArrayList<Particle>() ;
  HeadLogo = loadImage(dataPath("HeadLogo.png")) ;
  HeadBanner = loadImage(dataPath("HeadBanner.png")) ;
  EditLogo = loadImage(dataPath("EditLogo.png")) ; 
  EditLogo.resize(width/11, width/11) ; 


  messages = new ArrayList<Message>() ; 
  messages.add( new Message( "FIRST MESSAGE", "TOP", "20:12" ) ) ; 
  messages.add( new Message( "Hello says thy God", "God", "20:12" ) ) ; 
  for ( int i = 0; i < 5; i++ ) { 
    messages.add( new Message( "Flame is the template in which the world lies. Burn shall all one day, Burn shall this world with no ash remain.", "Dragon", "20:23" ) ) ; 
    messages.add( new Message( "the felling of cold due on a Summer morning.", "Chinmay", "21:05" ) ) ;
  }
  messages.add( new Message( "LAST MESSAGE", "BOTTOM", "20:12" ) ) ; 

  self = new User( "Chinmay", "8283828790", loadImage("plane1.png"), true ) ; 
  users = new ArrayList<User>() ; 
  users.add(self) ;
  users.add( new User( "Jonathan", "9274928391", loadImage("plane8.png"), false ) ) ;
  users.add( new User( "India", "7125239211", loadImage("flag2.png"), false ) ) ;

  users.add( new User( "Jolyne", "9713136724", loadImage("plane5.png"), true ) ) ;
  users.add( new User( "Jingle Bell", "7235311223", loadImage("plane6.png"), false ) ) ;
  users.add( new User( "Johnny", "8122235265", loadImage("plane7.png"), true ) ) ;
  users.add( new User( "Palpable", "9235239212", loadImage("plane4.png"), false ) ) ;
  users.add( new User( "Gingerbread", "9756212574", loadImage("plane2.png"), false ) ) ;
  users.add( new User( "Jostar", "7756212574", loadImage("plane9.png"), true ) ) ;

  for ( int i = 0; i < pages.length; i++ ) holtpage[i] = holtpagesure[i] = false ;
}


void draw() {
  if ( inmain ) mainapp() ;  
  else if ( blurring <= 1 ) { 
    blur() ; 
    blurring += dblurring ;
  }
}

void mainapp() { 
  background(0) ; 

  if( panhold ) translate( - panholdx + mouseX , - panholdy + mouseY ) ; else translate( -panholdx , -panholdy ) ;  
  touch() ; 
  pushMatrix() ; 
  translate( - currentpage*width, 0 ) ;
  Chat() ; 
  Admin_News() ; 
  Contacts() ; 
  Profile() ;
  addParticle() ; 
  popMatrix() ; 
  header() ;
}
