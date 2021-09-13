void Chat() { 
  float x = width*1 ; 

  if ( messages.size() == 0 ) { 
    stroke(255) ; 
    textSize(50) ; 
    textAlign(CENTER, CENTER ) ; 
    text( "Inbox Empty", x + width/2, height/2 ) ;
  } else { 
    float y = - holtedpagey[1] ; 
    for ( Message m : messages ) {   
      if ( m.from == self.name ) y += message_display_self( m, y ) + height/20 ; 
      else y += message_display_other( m, y ) + height/20 ;
    }
  }
}
