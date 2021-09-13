ArrayList<Particle> particles ;
PImage HeadLogo, HeadBanner, EditLogo ;

ArrayList<Message> messages ; 
User self ; 
ArrayList<User> users ;  



String[] Months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" } ; 
String[] Days = { "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY" } ;
int[] Days_Buffer = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 } ;

float t = 0 ; 
boolean hold = false ; //, holdchat = false, holdchatsure = false ; 

String[] pages = { "Admin News", "Group Chat", "Contacts" } ; 
float currentpage = 0, holdpage, targetpage = currentpage ; 
float currentx ; 

boolean[] holtpage = new boolean[pages.length], holtpagesure = new boolean[pages.length] ;
float[] holtpagey = new float[pages.length], holtedpagey = new float[pages.length] ; 
boolean inmain = true ;
float blurring, dblurring = 1.0/7 ; 

float panholdx, panholdy ; 
boolean panhold = false ; 
