package processing.test.messaging_app;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Messaging_App extends PApplet {

ArrayList<Particle> particles ;
PImage HeadLogo, HeadBanner, EditLogo, ProfilePicture ;
String[] Months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" } ; 
String[] Days = { "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY" } ;
int[] Days_Buffer = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 } ;

public void setup() {
   // size(450 , 800) ; 
  particles = new ArrayList<Particle>() ;
/*  HeadLogo = loadImage(dataPath("") + "HeadLogo.png") ;
  HeadBanner = loadImage(dataPath("") + "HeadBanner.png") ;
  EditLogo = loadImage(dataPath("") + "EditLogo.png") ; 
  ProfilePicture = loadImage(dataPath("") + "ProfilePicture.png") ; 
  EditLogo.resize(50, 50) ; 
  ProfilePicture.resize( 130, 130 ) ;
*/
}
float t = 0 , z = 0 ; 
boolean hold = false ; 
String[] pages = { "Admin News", "Group Chat", "My Profile" } ; 
float currentpage = 0, holdpage, targetpage = currentpage ; 

float currentx ; 
public void draw() {
  background(0) ;
  if (hold) { 
    currentpage = holdpage - (mouseX - currentx)/width ;
  } 
  if ( currentpage != targetpage ) { 
    float d = map( abs(currentpage - targetpage), 1, 0, 0.1f, 0 ) ; 
    if ( currentpage < targetpage ) currentpage += d ; 
    else currentpage -= d ;
  }

  pushMatrix() ; 
  translate( - currentpage*width, 0 ) ;

  imageMode(CENTER) ; 
  //image( ProfilePicture, width*2 + width/2, height/2.5 ) ; 
  noFill() ; 
  strokeWeight(30) ; 
  stroke(0) ; 
  circle( width*2 + width/2, height/2.5f, 155 ) ; 
  stroke( 0, 128, 128 ) ; 
  //strokeWeight(3) ; 
  //circle(  width*2 + width/2 , height/2.5 , 125 ) ; 
  for ( int i = particles.size() - 1; i >= 0; i-- ) { 
    Particle p = particles.get(i) ; 
    p.update() ; 
    p.display() ;
    if ( p.x > width*5 || p.y < 0 ) { 
      particles.remove(p) ;
    }
  }

  fill( 200 ) ;
  Admin_News() ; 
  Messages() ; 
  Profile() ;
  addParticle() ; 
  popMatrix() ; 
  header() ;
}

public void addParticle() { 
  if ( dist( currentpage, 0, 2, 0 ) < 0.5f && random(1) > 0.69f ) particles.add( new Particle( random(width*2, width*3), height ) ) ;
}

public void mousePressed() { 
  hold = true ; 
  holdpage = currentpage ; 
  currentx = mouseX ; 
  if ( mouseY > height/8 && mouseY < height/5.5f ) {
    z ++ ; 
  }
  //println( 0.1*mouseX/float(width) ) ;
  //currentpage ++ ; 
  //currentpage %= pages.length ;
}
public void mouseReleased() { 
  hold = false ; 
  targetpage = constrain( round(currentpage), 0, pages.length - 1) ;
} 
public void Admin_News() {
  float x = width*0 ; 
  stroke(255) ; 
  textSize(50) ; 
  text( "No news" , x + width/2 , height/2 ) ;
  
    String s ; 
  fill(255, 230)  ; 
  textSize(40) ; 
  textAlign(CENTER, CENTER ) ; 
  s = str(hour()) + " : " + str(minute()) + " : " + str(second()) ; 
  //text(s, width/2, height/3) ;

  fill( 255, 25, 25, 175 ) ; 
  textSize(80) ; 
  textAlign( RIGHT, BOTTOM ) ; 
  s = str( day() ) ; 
  text( s, width/2 - 10, height/1.1f ) ;

  fill( 250, 50, 250, 150 ) ; 
  textSize(60) ;
  textAlign( LEFT, BOTTOM ) ; 
  s = Months[ month() - 1 ] ;
  text( s, width/2, height/1.1f - 4) ;

  fill( 250, 250, 50, 150 ) ; 
  textSize(30) ; 
  textAlign( CENTER, TOP ) ; 
  s = Days[ (year() + year()/4 - year()/100 + year()/400 + Days_Buffer[month() - 1] + day())%7 - 1] ;
  text( s, width/2, height/1.1f) ;

}
public void header() { 
  float headerlen = height/8 ; 
  /*
  for ( int i = 0; i < headerlen ; i++ ) { 
   stroke(155*noise(2*t), 20, noise(t)*255 , map( i , 0 , headerlen , 255 , 50 )  ) ; 
   line( 0, i , width , i ) ;
   }
   */
  noStroke() ; 
  fill(128*noise(t), 128 , 128 + noise(t)*(255 - 128)  ) ; 
  rect( 0, 0, width, headerlen ) ; 
  fill( 128 ) ; 
  imageMode(CORNERS) ; 
  
  //image( HeadBanner , 0 , 0 , width , headerlen*1.5 ) ; 
  rect( 0, headerlen , width, height/5.5f - headerlen ) ;

  textAlign( CENTER, TOP ) ; 
  for ( int i = 0; i < pages.length; i++ ) {
    if ( dist(i, 0, currentpage, 0 ) < 1 ) { 
      textSize(20 + map( dist(i, 0, currentpage, 0 ), 0, 1, 4 , 0)) ; 
      fill( map( dist(i, 0, currentpage, 0 ), 0, 1, 0, 200), 200, 200 ) ;
    } else { 
      textSize(20) ;
      fill(200) ;
    }
    text(pages[i], (2*i + 1)*width/(pages.length*2), height/7.5f ) ;
  } 
  stroke(255) ;
  strokeWeight(2) ; 
  line(0, height/5.5f, width, height/5.5f ) ; 

  stroke(0, 200, 200 ) ; 
  line( currentpage*width/pages.length, height/5.5f, (currentpage+1)*width/pages.length, height/5.5f ) ; 
  t += 0.0015f + random(0, 0.0005f) ;
  
  
  //image( HeadLogo , width/2 - headerlen/2 , 0 , width/2 + headerlen/2  , headerlen ) ;
  
}
public void Messages() { 
  float x = width*1 ; 
  stroke(255) ; 
  textSize(50) ; 
  text( z , x + width/2 , height/2 ) ;
}
class Particle { 
  float x, y, dx, dy, d , a; 
  int c ; 
  Particle(float tx , float ty) { 
    x = tx ; 
    y = ty ; 
    set_d() ;
  }
  public void set_d() { 
    a = random(20,150) ; 
    d = random(15,30) ; 
    c = color( random(100, 255), random(20), random(150, 255) ) ;
    dx = random(6, 15)/5 ; 
    dy = random(8, 20)/5 ;
  }
  public void walls() { 
    if ( x >= width  || x <= 0 ) x = width - x ; 
    if ( y >= height || y <= 0 ) { 
      set_d() ; 
      y = height - y ;
    }
  }
  public void update() { 
    x += dx ; 
    y -= dy ;
  }
  public void display() { 
    noStroke() ; 
    fill(c , a) ; 
    ellipse( x, y, d, d) ;
  }
} 
public void Profile() { 
  float x = width*2 ; 
  String name = "Chinmay" ; 
  String phone = "< 8283828790 >" ; 
  textAlign(CENTER, CENTER) ; 
  stroke(255) ; 
  textSize(50) ; 
  stroke(0 , 128 , 128 ) ;
  strokeWeight(6) ; 
  fill(200) ; 
  //circle( x + width/2 , height/2.5 , 170 ) ;
  text( name , x + width/2 , height/1.8f ) ;
  textSize(20) ; 
  text( phone , x + width/2 , height/1.6f ) ; 
  
  noStroke() ;
  strokeWeight(3) ; 
  fill(120) ; 
  circle( x + width/2 , height/1.2f , 80 ) ; 
  fill(0) ; 
  imageMode(CENTER) ; 
  //image(EditLogo , x + width/2 , height/1.2 ) ; 
}
  public void settings() {  size(displayWidth , displayHeight) ; }
}
