void mousePressed() { 
  if ( mouseButton == RIGHT ) {
    panhold = true ; 
    panholdx += mouseX ; 
    panholdy += mouseY ;
  } else {
    hold = true ; 
    holdpage = currentpage ; 
    currentx = mouseX ; 
    if ( mouseY > height/8 && mouseY < height/5.5 ) { // -> Jump Page
      targetpage = round(pages.length*mouseX/width) ;
      hold = false ;
    }
    for ( int i = 0; i < pages.length; i++ ) {
      if ( dist( currentpage, 0, i, 0 ) < 0.3 ) { 
        holtpagey[i] = mouseY + holtedpagey[i] ;
        holtpage[i] = true ;
      }
    }
  }
}

void mouseReleased() { 
  if ( panhold ) { 
    panhold = false ; 
    panholdx -= mouseX ; 
    panholdy -= mouseY ;
  }
  if ( hold ) targetpage = constrain( round(currentpage), 0, pages.length ) ;
  hold = false ; 
  for ( int i = 0; i < pages.length; i++ ) holtpage[i] = holtpagesure[i] = false ;
} 


void touch() { 
  boolean flag = false ; 
  for ( int i = 0; i < pages.length; i++ ) {  
    if (holtpage[i] && (abs(mouseX - pmouseX) < abs(mouseY - pmouseY) )||holtpagesure[i]) {  
      holtpagesure[i] = true ; 
      holtedpagey[i] = (holtpagey[i] - mouseY) ;
      flag = true ;

      holtedpagey[2] = constrain( holtedpagey[2], 0, (users.size() - 1)*(width/4.5 + width/10) - height*4/5 + width/4.5) ;
      //holtedpagey[1] = constrain( holtedpagey[1], -1500, 100) ;
    }
  } 
  if (hold && !flag) { 
    currentpage = holdpage - 1.8*(mouseX - currentx)/width ;
  } 

  if ( currentpage != targetpage ) { 
    float d = map( abs(currentpage - targetpage), 1, 0, 0.1, 0 ) ; 
    if ( currentpage < targetpage ) currentpage += d ; 
    else if ( currentpage > targetpage ) currentpage -= d ;
  }
}

void draw_picture(PImage pic, float x, float y, float s) { 
  imageMode(CORNERS) ; 
  if ( displayimages ) image( pic, x - s/2, y - s/2, x + s/2, y + s/2 ) ; 
  else {
    fill( 60, 220, 175 ) ; 
    noStroke() ; 
    circle( x, y, s/3 ) ; 
    stroke( 60, 220, 175 ) ; 
    strokeWeight(5) ; 
    for (float theta = frameCount/30.0 ; theta <= TWO_PI + frameCount/30.0 ; theta += 0.628 ) {
      point( x + s*cos(theta)/2.5, y + s*sin(theta)/2.5 ) ;
    }
  }
  noFill() ; 
  strokeWeight(0.207*s) ; 
  stroke(0) ; 
  ellipse( x, y, 1.207*s, 1.207*s) ;
}

void blur() { 
  loadPixels() ; 
  float s = 1 ; 
  for (int y = 1; y < height-1; y++  ) {   
    for (int x = 1; x < width-1; x++ ) {  
      float r, g, b ; 
      r = g = b = 0 ; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*width + (x + kx);
          r += red(pixels[pos]); 
          g += green(pixels[pos]); 
          b += blue(pixels[pos]);
        }
      }
      r /= s*9 ; 
      g /= s*9 ; 
      b /= s*9 ; 
      pixels[y*width + x] = color(r, g, b);
    }
  }
  int i = 1 ; 
  for ( int x = 0; x < width; x += width - 1, i *= -1) { 
    for ( int y = 0; y < height; y ++) {
      int pos = width*y + x + i ; 
      pixels[y*width + x] = color( red(pixels[pos]), green(pixels[pos]), blue(pixels[pos])  ) ;
    }
  }
  for ( int y = 0; y < height; y += height - 1, i *= -1) { 
    for ( int x = 0; x < width; x ++) { 
      int pos = width*(y+i) + x ; 
      pixels[y*width + x] = color( red(pixels[pos]), green(pixels[pos]), blue(pixels[pos])  ) ;
    }
  }
  updatePixels() ;
}

void keyPressed() { 
  inmain = !inmain ; 
  blurring = 0 ;
}
