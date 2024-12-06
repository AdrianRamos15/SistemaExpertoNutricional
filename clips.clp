(deftemplate paciente
   (slot edad)
   (slot altura)
   (slot peso)
   (slot actividadfisica)
   (slot tipo_enfermedad)
)

(defrule clasificacion-paciente
   (not (paciente (edad ?edad)(altura ?altura)(peso ?peso)(actividadfisica ?actividad)(tipo_enfermedad ?tipo_enfermedad)))
   =>
   (printout t "Ingrese la edad del paciente: ")
   (bind ?edad (read))
   (printout t "Ingrese la altura del paciente: ")
   (bind ?altura (read))
   (printout t "Ingrese el peso del paciente: ")
   (bind ?peso (read))
   (printout t "Ingrese la actividad fisica del paciente (minutos por dia): ")
   (bind ?actividad (read))
   (printout t "Ingrese el tipo de enfermdedad que padece el paciente: ")
   (bind ?tipo_enfermedad (read))
   (assert (paciente (edad ?edad)(altura ?altura)(peso ?peso)(actividadfisica ?actividad)(tipo_enfermedad ?tipo_enfermedad)))
)

(defrule clasificacion-crio 
  (paciente (edad ?edad))
  (test (and (>= ?edad 2) (<= ?edad 17)))
  =>
  (assert (etapa "crio"))
)

(defrule clasificacion-joven
  (paciente (edad ?edad))
  (test (and (>= ?edad 18) (<= ?edad 30)))
  =>
  (assert (etapa "joven"))
)

(defrule clasificacion-adulto 
  (paciente (edad ?edad)) 
  (test (and (>= ?edad 31) (<= ?edad 64))) 
  => 
  (assert (etapa "adulto")) 
)

(defrule clasificacion-mayor
  (paciente (edad ?edad))
  (test (and (>= ?edad 65) (<= ?edad 130)))
  =>
  (assert (etapa "mayor"))
)

(defrule necesidad-crio
  (paciente (edad ?edad))
  (etapa "crio")
   =>
   (assert (nutriente "proteinas"))

)

(defrule necesidad-joven
  (paciente (edad ?edad))
  (etapa "joven")
   =>
   (assert (nutriente "carbohidratos"))
)

(defrule necesidad-adulto
   (paciente (edad ?edad))
   (etapa "adulto")
   =>
   (assert (nutriente "vitaminaC"))
)

(defrule necesidad-mayor
   (paciente (edad ?edad))
   (etapa "mayor")
   =>
   (assert (nutriente "vitaminaD"))
)

(defrule clasificacion-bajo-peso 
 (paciente (altura ?altura) (peso ?peso)) 
 (test (>= (/ ?peso (* ?altura ?altura)) 1)) 
 (test (<= (/ ?peso (* ?altura ?altura)) 18)) 
 => 
 (assert (tipo-peso "bajoPeso")) 
)

(defrule clasificacion-peso-normal 
 (paciente (altura ?altura) (peso ?peso)) 
 (test (>= (/ ?peso (* ?altura ?altura)) 18.5)) 
 (test (<= (/ ?peso (* ?altura ?altura)) 24.9)) 
 => 
 (assert (tipo-peso "pesoNormal")) 
)

(defrule clasificacion-sobre-preso 
 (paciente (altura ?altura) (peso ?peso)) 
 (test (>= (/ ?peso (* ?altura ?altura)) 25)) 
 (test (<= (/ ?peso (* ?altura ?altura)) 29.9)) 
 => 
 (assert (tipo-peso "sobrePeso")) 
)

(defrule clasificacion-exceso-peso 
 (paciente (altura ?altura) (peso ?peso)) 
 (test (>= (/ ?peso (* ?altura ?altura)) 30)) 
 (test (<= (/ ?peso (* ?altura ?altura)) 40)) 
 => 
 (assert (tipo-peso "excesoPeso")) 
)

(defrule necesidad-bajo-peso
   (paciente (altura ?altura) (peso ?peso))
   (tipo-peso "bajoPeso")
   =>
   (assert (nutriente "vitaminaA"))
)

(defrule necesidad-peso-normal
   (paciente (altura ?altura) (peso ?peso))
   (tipo-peso "pesoNormal")
   =>
   (assert (nutriente "carbohidratos"))
)

(defrule necesidad-sobre-preso
   (paciente (altura ?altura) (peso ?peso))
   (tipo-peso "sobrePeso")
   =>
   (assert (nutriente "proteinas"))
)

(defrule necesidad-exceso-peso
   (paciente (altura ?altura) (peso ?peso))
   (tipo-peso "excesoPeso")
   =>
   (assert (nutriente "grasas saludables"))
)

(defrule clasificacion-sedentario 
  (paciente (actividadfisica ?actividadfisica))
  (test (and (>= ?actividadfisica 0) (<= ?actividadfisica 10)))
  =>
  (assert (ejercicio-fisico "sedentario"))
)

(defrule clasificacion-actividad-ligera 
  (paciente (actividadfisica ?actividadfisica))
  (test (and (>= ?actividadfisica 11) (<= ?actividadfisica 25)))
  =>
  (assert (ejercicio-fisico "actividadLigera"))
)

(defrule clasificacion-actividad-moderada 
  (paciente (actividadfisica ?actividadfisica))
  (test (and (>= ?actividadfisica 26) (<= ?actividadfisica 40)))
  =>
  (assert (ejercicio-fisico "actividadModerada"))
)

(defrule clasificacion-actividad-intensa 
  (paciente (actividadfisica ?actividadfisica))
  (test (and (>= ?actividadfisica 41)(<= ?actividadfisica 420)))
  =>
  (assert (ejercicio-fisico "actividadIntensa"))
)

(defrule necesidad-sedentario
   (paciente (actividadfisica ?actividadfisica))
   (ejercicio-fisico "sedentario")
   =>
   (assert (nutriente "fibra"))
)

(defrule necesidad-actividad-ligera
   (paciente (actividadfisica ?actividadfisica))
   (ejercicio-fisico "actividadLigera")
   =>
   (assert (nutriente "vitaminaB1"))
)

(defrule necesidad-actividad-moderada
   (paciente (actividadfisica ?actividadfisica))
   (ejercicio-fisico "actividadModerada")
   =>
   (assert (nutriente "proteinas"))
)

(defrule necesidad-actividad-intensa
   (paciente (actividadfisica ?actividadfisica))
   (ejercicio-fisico "actividadIntensa")
   =>
   (assert (nutriente "grasas saludables"))
)

(defrule clasificacion-enfermedadCardiovascular 
	(paciente(tipo_enfermedad enfermedadCardiovascular))
=>
	(assert(tipo_enfermedad "enfermedadCardiovascular"))
)

(defrule clasificacion-enfermedad-celiaca 
	(paciente(tipo_enfermedad enfermedadCeliaca))
=>
	(assert(tipo_enfermedad "enfermedadCeliaca"))
)

(defrule clasificacion-diabetes 
	(paciente(tipo_enfermedad diabetes))
=>
	(assert(tipo_enfermedad "diabetes"))
)

(defrule necesidad-enfermedadCardiovascular
   (paciente(tipo_enfermedad ?tipo_enfermedad))
   (tipo_enfermedad "enfermedadCardiovascular")
   =>
   (assert (nutriente "fibra"))
)

(defrule necesidad-enfermedad-celiaca
   (paciente(tipo_enfermedad ?tipo_enfermedad))
   (tipo_enfermedad "enfermedadCeliaca")
   =>
   (assert (nutriente "vitaminaB1"))
)

(defrule necesidad-diabetes
   (paciente(tipo_enfermedad ?tipo_enfermedad))
   (tipo_enfermedad "diabetes")
   =>
   (assert (nutriente "vitaminaC"))
)

(defrule imprimir-nutriente
   (nutriente ?nutriente)
   =>
   (printout t "- El paciente requiere una dieta rica en: " ?nutriente crlf)
)

(defrule macronutrientes-proteinas
   (nutriente "proteinas")
   =>
   (printout t "Es recomendable agregar alimentos(PROTEINAS) como: Pollo, Pescado, Huevos y Lacteos"   crlf)
)

(defrule macronutrientes-carbohidratos
   (nutriente "carbohidratos")
   =>
   (printout t "Es recomendable agregar alimentos(CARBOHIDRATOS) como: Arroz, Avena, Legumbres y Patata"   crlf)
)

(defrule macronutrientes-grasas-saludables
   (nutriente "grasas saludables")
   =>
   (printout t "Es recomendable agregar alimentos(GRASAS) como: Aguacate, Nueces, Aceite Oliva y Anacardos"   crlf)
)

(defrule nutriente-fibra
   (nutriente "fibra")
   =>
   (printout t "Es recomendable agregar alimentos(FIBRA) como:Espinacas, Almendras, Brocoli y Fruta"   crlf)
)

(defrule nutriente-vitaminaA
   (nutriente "vitaminaA")
   =>
   (printout t "Es recomendable agregar alimentos(VITAMINA_A) como:Yema de huevo, Hortalizas de hoja verde y Productos lacteos"   crlf)
)

(defrule nutriente-vitaminaB1
   (nutriente "vitaminaB1")
   =>
   (printout t "Es recomendable agregar alimentos(VITAMINA_B1) como:Guisantes, Semillas y Productos integrales"   crlf)
)

(defrule nutriente-vitaminaC
   (nutriente "vitaminaC")
   =>
   (printout t "Es recomendable agregar alimentos(VITAMINA_C) como:Tomate, Brocoli y citricos"   crlf)
)

(defrule nutriente-vitaminaD
   (nutriente "vitaminaD")
   =>
   (printout t "Es recomendable agregar alimentos(VITAMINA_D) como:Salmon, Caballa y Cereales enriquezidos"   crlf)
)



