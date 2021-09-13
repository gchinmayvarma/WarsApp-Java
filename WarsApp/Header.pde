void header() { 
  float headerlen = height/8 ; 
  rectMode(CORNER) ; 
  /*
  for ( int i = 0; i < headerlen ; i++ ) { 
   stroke(155*noise(2*t), 20, noise(t)*255 , map( i , 0 , headerlen , 255 , 50 )  ) ; 
   line( 0, i , width , i ) ;   
   }
   */
  noStroke() ; 
  fill(128*noise(t), 128 , 128 + noise(t)*(255 - 128)  ) ; 
  rect( 0, 0, width, headerlen ) ; 
  
  imageMode(CORNERS) ; 
  if( displayimages ) image( HeadBanner , 0 , 0 , width , headerlen*1.5 ) ; 
  
  fill( 90 , 230) ; 
  rect( 0, headerlen , width, height/5.5 - headerlen ) ;

  textAlign( CENTER, CENTER ) ; 
  for ( int i = 0; i < pages.length; i++ ) {
    if ( dist(i, 0, currentpage, 0 ) < 1 ) { 
      textSize(width/23 + map( dist(i, 0, currentpage, 0 ), 0, 1, width/115 , 0)) ; 
      fill( map( dist(i, 0, currentpage, 0 ), 0, 1, 0, 200), 200, 200 ) ;
    } else { 
      textSize(width/23) ;
      fill(200) ;
    }
    text(pages[i], (2*i + 1)*width/(pages.length*2), height/8 + (height/5.5 - headerlen)/2 ) ;
  } 
  stroke(255) ;
  strokeWeight(height/400) ; 
  line(0, height/5.5, width, height/5.5 ) ; 

  stroke(0, 200, 200 ) ; 
  line( currentpage*width/pages.length, height/5.5, (currentpage+1)*width/pages.length, height/5.5 ) ; 
  t += 0.0015 + random(0, 0.0005) ;
  
  
  if( displayimages ) image( HeadLogo , width/2 - headerlen/2 , 0 , width/2 + headerlen/2  , headerlen ) ;
}
