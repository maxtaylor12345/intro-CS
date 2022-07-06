float[] aeu = {4.2, 5.4, 8.7, 9.2}; //<>//
float[] sb = {4, 10, 85, 2, 0.5};
float[] mbp = {4, 6, 7, 8, 9, 9, 8, 7, 6, 4};
float[] fo = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
void setup() {
  println(addEmUP(aeu));
  println(smollestBoi(sb));
  println(myBestPal(mbp));
  println(filterOdds(fo));
}
float addEmUP(float[] a) {
  float x = 0;
  for (int i = 0; i<a.length; i++) {
    x+=a[i];
  }
  return x;
}
float smollestBoi(float[] a) {
  float x = a[0];
  for (int i = 0; i < a.length; i++) {
    if (a[i]<x) {
      x=a[i];
    }
  }
  return x;
}

boolean myBestPal(float[] a) {
  for (int i = 0; i < a.length; i++) {
    if (a[i]!=a[a.length-1-i]) {
      return false;
    }
  }
  return true;
}
float[] filterOdds(float[] a) {
  float[] b = new float[0];
  for (int i = 0; i<a.length; i++) {
    if (a[i] % 2 !=0) {
      b = append(b, a[i]);
    }
  }
  return b;
}
