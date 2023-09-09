use "../src/Geometry.sml";
use "/home/urek/Codes/GithubProjects/SMLibrary/assert.sml";


structure G = Geometry;

val p1 = (1,2);
val p2 = (2,3);
val p3 = (4,1)
val r1 = (p1,p2);
val r2 = (p1,p3);

Assert.trueTuple (G.addP (p1,p2)) (3,5);
Assert.trueTuple (G.subP (p1,p2)) (~1,~1);
Assert.trueTuple (G.subP (p2,p1)) (1,1);
Assert.trueTuple (G.mulP (p1, 2)) (2,4);
Assert.trueTuple (G.divP (p1, 2)) (0,1);
Assert.trueTuple (G.eqP (p1,p2)) false;
Assert.trueTuple (G.eqP (p1,p1)) true;

Assert.trueTuple (G.xP p1) 1;
Assert.trueTuple (G.yP p2) 3;

Assert.trueTuple (G.width r1)  1;
Assert.trueTuple (G.height r1)  1;
Assert.trueTuple (G.size r1)  (1,1);

Assert.trueTuple (G.emptyR r1) false;
Assert.trueTuple (G.union(r1,r2)) ((1,2),(2,1));
