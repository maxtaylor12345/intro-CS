void setup() {
  size(500, 500);
  background(#3AAFCE);
  for (int x=50; x<=width-100; x+=(width-150)/4) {
    boolean color1=random(0, 1)>.5;
    int suit1 = int(random(1, 5));
    int value1 = int(random(1, 11));
    fill(255);
    card(x, value1, suit1, color1);
  }
}
