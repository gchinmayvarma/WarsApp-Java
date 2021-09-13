class Message { 
  String content, from, time, date ; 
  Message(String content_, String from_, String time_ ) { 
    content = content_ ;
    from = from_ ;
    time = time_ ;
  }
}

int wordWrap(String s, float maxWidth) {
  ArrayList a = new ArrayList();
  float w = 0;    
  int i = 0;      
  int rememberSpace = 0; 
  while (i < s.length()) {
    char c = s.charAt(i);
    w += textWidth(c);
    if (c == ' ') rememberSpace = i; 
    if (w > maxWidth) {  
      String sub = s.substring(0, rememberSpace); 
      if (sub.length() > 0 && sub.charAt(0) == ' ') {
        sub = sub.substring(1, sub.length());
      }
      a.add(sub);
      s = s.substring(rememberSpace, s.length());
      i = 0;
      w = 0;
    } else {
      i++;
    }
  }

  if (s.length() > 0 && s.charAt(0) == ' ') {
    s = s.substring(1, s.length());
  }
  a.add(s);
  return a.size() ;
}

float message_display_other( Message m , float y) {
  float textsize = width/20 ;  
  float h ;
  float w = width*0.8 ; 
  float x = width ;  
  float toptextsize = width/20 ; 
  float textmarginx = width/50 ; 
  float textmarginy = textmarginx ; 
  float screenmargin = width/2 - w/2 ; 

  textSize( textsize ) ; 
  float textwidth = textWidth(m.content) ; 
  textLeading( textsize*1.25 ) ; 
  if ( textwidth <= w - textmarginx*2 ) { 
    h = 2*textmarginy + textsize*1.25 ; 
    textSize(toptextsize) ; 
    w = constrain( textwidth + textmarginx*2 + 1, textWidth(m.from) + textWidth(m.time) + w/5, w ) ;  
    textSize( textsize ) ;
  } else { 
    int textlines =  wordWrap(m.content, w - 2*textmarginx) ; //1 + int(textwidth/(w - textmarginx*2)) ; 
    h = 2*textmarginy + textlines*(textsize*1.25) ;
  } 
  rectMode(CORNER) ; 
  noStroke() ; 
  fill( 55, 27, 160 ) ; 
  rect( x + screenmargin, y + toptextsize, w, h ) ;


  float tril = 27*width/450 ; 
  triangle( x + screenmargin*3/4, y + toptextsize + h - tril/9, 
    x + screenmargin*3/4, y + toptextsize + h - tril - tril/9, 
    x + screenmargin/3, y + toptextsize + h - tril/2 - tril/9 ) ; 

  rectMode(CORNERS) ; 
  noStroke() ; 
  strokeWeight(0) ; 
  fill(255) ; 
  textAlign( LEFT, TOP ) ; 
  text( m.content, x + screenmargin + textmarginx, y + toptextsize + textmarginy, x + screenmargin + w - textmarginx, y + toptextsize + h - textmarginy  ) ;
  noFill() ; 
  stroke(200) ; 
  strokeWeight(2) ; 

  fill(255) ; 
  textAlign(LEFT, TOP ) ; 
  textSize(toptextsize) ;

  text( m.from, x + screenmargin, y) ; 

  textAlign(RIGHT, TOP ) ; 
  text( m.time, x + screenmargin + w, y ) ;

  stroke(255) ; 
  strokeWeight(3) ; 
  //line( 0, y, width, y ) ;
  return h + toptextsize ; 
}

float message_display_self( Message m , float y ) {
  float textsize = width/20 ;  
  float h ;
  float w = width*0.8 ; 
  float x = width ;  
  float toptextsize = width/20 ; 
  float textmarginx = width/50 ; 
  float textmarginy = textmarginx ; 
  float screenmargin = width/2 - w/2 ; 

  textSize( textsize ) ; 
  float textwidth = textWidth(m.content) ; 
  textLeading( textsize*1.25 ) ; 
  if ( textwidth <= w - textmarginx*2 ) { 
    h = 2*textmarginy + textsize*1.25 ; 
    textSize(toptextsize) ; 
    w = constrain( textwidth + textmarginx*2 + 1, textWidth(m.from) + textWidth(m.time) + w/5, w ) ;  
    textSize( textsize ) ;
  } else { 
    int textlines =  wordWrap(m.content, w - 2*textmarginx) ; 
    h = 2*textmarginy + textlines*(textsize*1.25) ;
  } 
  rectMode(CORNER) ; 
  noStroke() ; 
  fill( 118, 42, 166 ) ;
  rect( x + width - screenmargin - w, y + toptextsize, w, h ) ;

  float tril = 27*width/450 ; 

  triangle( x + width - screenmargin*3/4, y + toptextsize + h - tril/9, 
    x + width - screenmargin*3/4, y + toptextsize + h - tril - tril/9, 
    x + width - screenmargin/3, y + toptextsize + h - tril/2 - tril/9 ) ; 

  rectMode(CORNERS) ; 
  noStroke() ; 
  strokeWeight(0) ; 
  fill(255) ; 
  textAlign( LEFT, TOP ) ; 
  text( m.content, x + width - screenmargin + textmarginx - w, y + toptextsize + textmarginy, x + width - screenmargin - textmarginx, y + toptextsize + h - textmarginy  ) ;
  noFill() ; 
  stroke(200) ; 
  strokeWeight(2) ;   
  textAlign(LEFT, TOP ) ; 
  text( m.time, x + width - w - screenmargin, y ) ;
  stroke(255) ; 
  strokeWeight(3) ; 
  //line( 0, y, width, y ) ;
  return h + toptextsize ; 
}

/*
boolean keyboard = false ; 
void keyPressed() {  
  if ( ms.content.length() > 0 && keyCode == BACKSPACE ) ms.content = ms.content.substring(0, ms.content.length() - 1) ; 
  else if ( (key >= 32 && key <= 126) ) ms.content += key ;
}
void mousePressed() {
  if (!keyboard) {
    openKeyboard();
  } else { 
    closeKeyboard();
  }  
  keyboard = !keyboard ;
}
*/
