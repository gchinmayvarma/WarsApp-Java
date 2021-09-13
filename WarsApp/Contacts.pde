void Contacts() { 
  float y = height/5 - holtedpagey[2] ; 
  float marginy = width/10 ; 
  for ( User u : users ) { 
    display_user( u, y) ;
    y += width/4.5 + marginy ; 
  }
}
