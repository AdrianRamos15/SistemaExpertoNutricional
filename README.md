# Sistema Experto Nutricional para Condiciones de Salud Específicas 🌱

## Descripción del Proyecto
Este proyecto desarrolla un sistema experto nutricional diseñado para proporcionar recomendaciones personalizadas de alimentos a personas con ciertas condiciones de salud. Está enfocado en tres enfermedades principales:

- Diabetes
- Enfermedades cardiovasculares
- Enfermedad celíaca

### Objetivo
El sistema busca ayudar a las personas a controlar sus síntomas, prevenir complicaciones y mejorar su calidad de vida a través de una dieta adecuada y personalizada. Esto se logra mediante reglas de inferencia basadas en lógica borrosa y conocimiento adquirido de expertos en nutrición.

## Alcance
El sistema:
1. Identifica y clasifica alimentos según criterios nutricionales específicos para las enfermedades consideradas.
2. Adapta las dietas a las necesidades individuales teniendo en cuenta:
   - Características personales (edad, peso, altura, nivel de actividad física)
   - Tipo de enfermedad
   - Nutrientes esenciales

**Nota:** Este sistema está limitado a las enfermedades mencionadas y no cubre todas las posibles condiciones de salud.

## Características Principales
- **Personalización:** Clasifica y adapta dietas basadas en datos del usuario.
- **Reglas basadas en lógica borrosa:** Utiliza herramientas como FuzzyCLIPS para crear reglas de inferencia que manejan la incertidumbre.
- **Validación experta:** Evaluado y aprobado por un experto en nutrición.

## Tecnologías Utilizadas
- **FuzzyCLIPS:** Para la inferencia basada en lógica borrosa.
- **Python:** Desarrollo y manejo de datos.
- **Taxonomía jerárquica:** Para estructurar y representar el conocimiento nutricional.

## Ejemplo de Uso
Supongamos que un paciente proporciona los siguientes datos:

- Edad: 35 años
- Altura: 1.70 metros
- Peso: 100 kilogramos
- Actividad física: 20 minutos/día
- Condición: Diabetes

El sistema:
1. Clasifica al paciente como adulto con exceso de peso y actividad ligera.
2. Genera una dieta adaptada a las necesidades de una persona con diabetes, priorizando nutrientes específicos como carbohidratos controlados, fibra y vitamina C.

### Regla Ejemplo
```clips
(defrule necesidad-diabetes
   (paciente (tipo_enfermedad diabetes))
   =>
   (assert (nutriente "vitaminaC"))
)
