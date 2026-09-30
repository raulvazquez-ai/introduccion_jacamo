// Agent sample_agent in project holamundo

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true
    <- .print("hello world.");
       .date(Y,M,D); .time(H,Min,Sec,MilSec); // get current date & time
       +started(Y,M,D,H,Min,Sec).             // add a new belief

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }

+greeting(M)[source(A)]
    <- .print("He recibido ", M, " de ", A).

+!say_hello
    <- .wait(play(Ag, role2, _));
       .send(Ag, tell, greeting("hola mundo")).

!count.
+!count
    <- inc_get(1, V);
       .print("Valor único: ", V);
       .wait(1000);
       !count.
