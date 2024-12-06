(deftemplate EDAD
	0 60
	(
		(crio (0 1) (10 1)(20 0))
		(joven (20 0) (30 1) (42 0))
		(adulto (30 0) (50 1) (60 0))
		(mayor (58 0) (60 1))
	)
)

(deftemplate ACTIVIDAD-FISICA
	0 30
	(
		(sedentario (0 1) (5 1) (10 0))
		(actividad-moderada (10 0) (20 1) (25 0))
		(actividad-intensa (25 0) (30 1))
	)
)


(defrule R1
	(EDAD crio)
	(ACTIVIDAD-FISICA sedentario)
=>
	(assert (KC muy-poco))
)

(defrule R2
	(EDAD joven)
	(ACTIVIDAD-FISICA sedentario)
=>
	(assert (KC media))
)

(defrule R3
	(EDAD adulto)
	(ACTIVIDAD-FISICA sedentario)
=>
	(assert (KC media))
)

(defrule R4
	(EDAD mayor)
	(ACTIVIDAD-FISICA sedentario)
=>
	(assert (KC poco))
)

(defrule R5
	(EDAD crio)
	(ACTIVIDAD-FISICA actividad-moderada)
=>
	(assert (KC poco))
)

(defrule R6
	(EDAD joven)
	(ACTIVIDAD-FISICA actividad-moderada)
=>
	(assert (KC alta))
)

(defrule R7
	(EDAD adulto)
	(ACTIVIDAD-FISICA actividad-moderada)
=>
	(assert (KC alta))
)

(defrule R8
	(EDAD mayor)
	(ACTIVIDAD-FISICA actividad-moderada)
=>
	(assert (KC medio))
)

(defrule R9
	(EDAD crio)
	(ACTIVIDAD-FISICA actividad-intensa)
=>
	(assert (KC medio))
)

(defrule R10
	(EDAD joven)
	(ACTIVIDAD-FISICA actividad-intensa)
=>
	(assert (KC muy-alta))
)

(defrule R11
	(EDAD adulto)
	(ACTIVIDAD-FISICA actividad-intensa)
=>
	(assert (KC muy-alta))
)

(defrule R12
	(EDAD mayor)
	(ACTIVIDAD-FISICA actividad-intensa)
=>
	(assert (KC alta))
)



