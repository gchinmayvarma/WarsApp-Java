class User { 
  String name, phone ; 
  boolean isadmin ; 
  PImage profilepic ; 
  User(String name_, String phone_, PImage profilepic_, boolean isadmin_ ) { 
    name = name_ ; 
    phone = phone_ ; 
    profilepic = profilepic_  ; 
    isadmin = isadmin_ ; 
    profilepic.resize( int(width/3), int(width/3) ) ;
  }
}

void display_user( User u, float y ) { 
  float x = width*2 ; 
  float s = width/4.5 ;
  float marginx = width/25 ; 
  draw_picture( u.profilepic, x + s/2 + marginx, y + s/2, s ) ; 

  fill(255) ; 
  strokeWeight(5) ; 
  textSize( s/3 ) ; 
  textAlign( LEFT, TOP ) ; 
  text( u.name, x + s + marginx*2, y  ) ; 
  textSize( s/5 ) ; 
  fill(150) ; 
  text( "< " + u.phone + " >", x + s + marginx*2, y + s/2.5 ) ; 

  if ( true ) { 
    fill( 10, 150, 50 ) ; 
    noStroke() ; 
    circle( x + s + marginx*2 + s/10, y + s - s/8.3, s/10 ) ; 
    textAlign( LEFT, BOTTOM ) ; 
    text( "Online", x + s + marginx*2 + s/5, y + s ) ;
  }
  if ( u.isadmin ) { 
    fill( 150, 50, 10 ) ; 
    textAlign( RIGHT, BOTTOM ) ; 
    text( "Admin", x + width - marginx, y + s ) ;
  }
  stroke(200) ; 
  //line( x , y , x + width , y ) ; 
  //line( x , y + s, x + width , y + s) ;
}
