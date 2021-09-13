class Particle { 
  float x, y, dx, dy, d , a; 
  color c ; 
  Particle() { 
    x = random(width*3, width*4) ; 
    set_d() ;
  }
  void set_d() { 
    a = random(20,150) ; 
    d = random(15,30)*width/450 ; 
    c = color( random(100, 255), random(20), random(150, 255) ) ;
    dx = random(6, 15)*width/2250 ; 
    dy = random(8, 20)*width/2250 ;
    y = height + d ; 
  }
  void update() { 
    x += dx ; 
    y -= dy ;
  }
  void display() { 
    noStroke() ; 
    fill(c , a) ; 
    ellipse( x, y, d, d) ;
  }
} 

void addParticle() { 
  if ( dist( currentpage, 0, 3, 0 ) < 0.5 && random(1) > 0.69 ) particles.add( new Particle() ) ;
}
