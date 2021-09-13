void Profile() { 
  float x = width*3 ; 

  draw_picture( self.profilepic, x + width/2, height/2.5 , width/3 ) ; 
  for ( int i = particles.size() - 1; i >= 0; i-- ) { 
    Particle p = particles.get(i) ; 
    p.update() ; 
    p.display() ;
    if ( p.y < 0 ) { 
      particles.remove(p) ;
    }
  }

  textAlign(CENTER, CENTER) ;  
  textSize(width/9) ; 
  fill(200) ; 
  text( self.name, x + width/2, height/1.8 ) ;
  textSize(width/20) ; 
  text( "< " + self.phone + " >", x + width/2, height/1.6 ) ; 
  textSize(width/30) ; 
  if( self.isadmin ) text( "< ADMIN MODE >" , x + width/2 , height/4 ) ; 
  
  noStroke() ;
  strokeWeight(3) ; 
  fill(120) ; 
  circle( x + width/2, height/1.2, width/5.6 ) ; 
  fill(0) ; 
  imageMode(CENTER) ; 
  if( displayimages ) image(EditLogo, x + width/2, height/1.2 ) ; 
}
