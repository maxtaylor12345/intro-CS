/*
Maxwell Tayor
 loops practice
 7/5/22
 */

void setup() {
  size(500, 500);

// for loop print every integer from 11-71
  /*for (int x = 11; x<=71; x++){
   println(x);
   }
   */
   
// for loop print every odd integer from 1 to 100
  /*for (int x = 1; x<=100; x++){
   if (x%2!=0){
   println(x);
   }
   } */
   
// for loop print every integer going down by 10 from 1000
  /*for (int x=1000; x>=0; x-=10){
   println(x);
   }*/

//10 squares barely touching walls
  /*for (int x=1; x<width-11; x+=(width-12)/9){
   square(x, height/2, 10);
   }*/
  
//7 circles across
  /*for ( int x=80; x<width-80; x+=(width-160)/6){
   circle(x, height/2, 10);
   }*/

// 10x10 grid of 20x20 sqaures centered
  for (int x=100; x<=width-120; x+=(width-220)/9) {
    for (int y=100; y<=height-120; y+=(height-220)/9) {
      square(x, y, 20);
    }
  }
  //center checking lines
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}
