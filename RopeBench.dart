#import("./lib/mutable_string.dart");

void main() {
  String testStr = "hello world";
  MutableString ropeSample = new FlatRope(testStr);
  String testStr2 = "world hello";
  print(ropeSample.toString());
  
  var buf = new List<int>(512000);
  for(int i = 0;i< buf.length; ++i ){
    buf[i] = 65;
  }
  Stopwatch timer = new Stopwatch();
  timer.start();
  String plainString = new String.fromCharCodes(buf);
  MutableString awesomeString = new FlatRope(plainString);
  timer.stop();
  timer.reset();

  print("Init ${timer.elapsedInMs()}ms");

  /* List stuff = new List(); */
  /* timer.start(); */
  /* for(int i = 0;i< 512; ++i){ */
  /*    plainString.substring(i, 200000+i);     */
  /* } */
  /* timer.stop(); */
  /* print("Parsing ${timer.elapsedInMs()}ms"); */

  
  /* timer.reset(); */
  /* timer.start(); */
  /* for(int i = 0;i<512; ++i){ */
  /*   awesomeString.subSequence(i, 200000+i); */
  /* } */
  /* timer.stop(); */
  
  /* print("Parsing ${timer.elapsedInMs()}ms"); */
  var newRope = new FlatRope(testStr);

  newRope = newRope.subSequence(2, 2+3);
  newRope = newRope.append("helloworld");
  var newRope2 = awesomeString.subSequence(1000, 200000);
  var newRope3 = awesomeString.subSequence(100, 200000);
  newRope2 = newRope2.append("helloworld");
  newRope2 = newRope2.append(newRope3);
  if(newRope2 is ConcatenationRope)
    print("yay for concatenation" + newRope2.length);
  var it = new RopeIterator(newRope2);
  for(int j = 0; it.hasNext(); ++j){
    print( it.next().toString());
  }

 }
