go :- hypothesis(Disease),
  write('******************************************** '), nl,
      write('==> I believe that the patient has :'),
      write(Disease),
      nl,
      write(' Take care <3'),
      undo.

/* Hypothesis that should be tested */
hypothesis(cold)        :- cold, !.
hypothesis(flu)         :- flu, !.
hypothesis(typhoid)     :- typhoid, !.
hypothesis(measles)     :- measles, !.
hypothesis(malaria)     :- malaria, !.
hypothesis(pneumonia)   :- pneumonia, !.
hypothesis(appendicitis):- appendicitis, !.
hypothesis(diabetes)    :- diabetes, !.
hypothesis(unknown). /* no diagnosis */

/* Hypothesis Identification Rules */
cold :-
    verify(sneezing),
    verify(runny_nose),
    verify(sore_throat),
    verify(headache),
    verify(cough),
    write('________________Advice and Suggestions:_______________'), nl,
    nl,
    write('==> 1. Rest and drink plenty of fluids.'), nl,
    write('==>2. Over-the-counter cold medication.'), nl,
    write('==>3. Warm saltwater gargles.'), nl,
    write('==>Please cover your mouth and nose when coughing or sneezing.'), nl.

flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache),
    verify(fatigue),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
    write('==> 1. Get plenty of rest.'), nl,
    write('==> 2. Drink fluids to stay hydrated.'), nl,
    write('==> 3. Over-the-counter pain relievers.'), nl,
    write('==> 4. Antiviral medication (prescribed by a doctor).'), nl,
    write('==> Please avoid close contact with others to prevent spreading the flu.'), nl.

typhoid :-
    verify(fever),
    verify(headache),
    verify(abdominal_pain),
    verify(poor_appetite),
    verify(lethargy),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
    write('==> 1. Antibiotics (prescribed by a doctor).'), nl,
    write('==> 2. Drink clean water and eat well-cooked food.'), nl,
    write('==> 3. Rest and maintain proper hygiene.'), nl,
    write('==> Please maintain proper hygiene and sanitation.'), nl.

measles :-
    verify(fever),
    verify(rash),
    verify(cough),
    verify(conjunctivitis),
    verify(runny_nose),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
    write('==> 1. Rest and drink plenty of fluids.'), nl,
    write('==> 2. Over-the-counter pain relievers.'), nl,
    write('==> 3. Vitamin A supplements (if recommended by a doctor).'), nl,
    write('==> Please avoid close contact with others to prevent spreading the disease.'), nl.

malaria :-
    verify(fever),
    verify(chills),
    verify(sweating),
    verify(headache),
    verify(body_ache),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
    write('==> 1. Antimalarial medication (prescribed by a doctor).'), nl,
    write('==> 2. Use mosquito repellents and bed nets.'), nl,
    write('==> 3. Cover your skin and avoid mosquito bites.'), nl,
    write('==> Please seek medical attention promptly for accurate diagnosis and treatment.'), nl.

pneumonia :-
    verify(fever),
    verify(chest_pain),
    verify(cough),
    verify(shortness_of_breath),
    verify(fatigue),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
write('==> 1. Antibiotics (prescribed by a doctor).'), nl,
write('==> 2. Rest and drink plenty of fluids.'), nl,
write('==> 3. Over-the-counter pain relievers for fever and discomfort.'), nl,
write('==> 4. Use a humidifier or take steam inhalation for congestion.'), nl,
write('==> Please follow the prescribed medication and seek medical attention for severe symptoms.'), nl.

appendicitis :-
verify(abdominal_pain),
verify(nausea),
verify(vomiting),
verify(fever),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
write('==> 1. Immediate medical attention is necessary.'), nl,
write('==> 2. Avoid eating or drinking anything.'), nl,
write('==> 3. Surgery (appendectomy) is typically required.'), nl,
write('==> Please go to the emergency room for further evaluation and treatment.'), nl.

diabetes :-
verify(frequent_urination),
verify(excessive_thirst),
verify(unexplained_weight_loss),
verify(fatigue),
verify(blurred_vision),
    write('________________Advice and Suggestions:_______________'), nl,  nl,
write('==> 1. Consult a doctor for proper diagnosis and management.'), nl,
write('==> 2. Blood tests and other diagnostic measures may be required.'), nl,
write('==> 3. Medications, lifestyle changes, and dietary modifications may be prescribed.'), nl,
write('==> Please prioritize your health and seek medical guidance for diabetes management.'), nl.

/* How to ask questions */
ask(Question) :-
write('==> Does the patient have the following symptom: '),
write(Question),
write('? '),
read(Response),
nl,
((Response == yes ; Response == y)
-> assert(yes(Question))
; assert(no(Question)), fail).
/* The predicate dynamic/1 in Prolog is used to declare  predicates as dynamic*/
:- dynamic yes/1, no/1.

/* How to verify something */
verify(S) :-
(yes(S)
-> true
; (no(S)
-> fail
; ask(S))).

/* The retract/1 predicate in Prolog is used to remove a clause or fact from the program's dynamic database during runtime.*/
/* Undo all yes/no assertions */

undo :- retract(yes()), fail.
undo :- retract(no()), fail.
undo.