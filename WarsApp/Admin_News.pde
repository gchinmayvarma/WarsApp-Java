void Admin_News() {
  float x = width*0 ; 
  textAlign(CENTER, CENTER ) ;
  fill(255) ; 
  textSize(width/12) ; 
  text( "No news", x + width/2, height/2 ) ;







  // CALENDER
  String s ; 
  fill(255, 230)  ; 
  textSize(40) ;  
  s = str(hour()) + " : " + str(minute()) + " : " + str(second()) ; 
  //text(s, width/2, height/3) ;

  fill( 255, 25, 25, 175 ) ; 
  textSize(width/7) ; 
  textAlign( RIGHT, BOTTOM ) ; 
  s = str( day() ) ; 
  text( s, x + width/5 - 2, height/1.1 ) ;

  fill( 250, 50, 250, 150 ) ; 
  textSize(width/10) ;
  textAlign( LEFT, BOTTOM ) ; 
  s = Months[ month() - 1 ] ;
  text( s, x + width/5 + 2, height/1.1 - 4.5 ) ;

  fill( 250, 250, 50, 150 ) ; 
  textSize(width/16) ; 
  textAlign( CENTER, TOP ) ; 
  s = Days[ (year() + year()/4 - year()/100 + year()/400 + Days_Buffer[month() - 1] + day() - 1 )%7 ] ;
  text( s, x + width/5, height/1.1) ;


  textAlign(CENTER, BOTTOM ) ;
  fill(128) ; 
  textSize(width/32) ; 
  text( "VERSION : APLHA ONE", x + width/5, height ) ;

  stroke(255) ; 
  strokeWeight(width/150) ; 
  for ( float theta = PI*3/2 ; theta <= PI*2; theta += PI/60 ) { 
    point( width*cos(theta)/2 + x, width*sin(theta)/2 + height ) ;//, width*cos(theta)/2 + x, width*sin(theta)/2 + height ) ;
  }
}
