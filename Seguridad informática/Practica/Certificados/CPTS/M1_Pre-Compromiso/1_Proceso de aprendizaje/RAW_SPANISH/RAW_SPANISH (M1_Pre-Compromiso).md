[[Índice - CPTS|CPTS]]
-------------
## La manera de pensar

La seguridad informática es un campo enorme, imposible de abarcar completamente. Un ejemplo: si quisiéramos aprender los más de 200 lenguajes de programación en 100 horas cada uno, tardaríamos casi 7 años en solo eso, sin haber practicado depuración o ingeniería inversa. Y luego, necesitaríamos otros 7 años para aprenderlas. Es evidente que esto no es eficiente ni necesario.

Cada lenguaje tiene fortalezas y debilidades, pero entendiendo bien uno, aprenderemos otros más rápido. Todos siguen principios comunes, definidos por R. D. Tennent:

- **Principio de abstracción**
- **Principio de correspondencia**
- **Principio de completitud de los tipos de datos**

En seguridad informática, debemos aprender rápidamente estos principios y adaptarnos a distintos entornos. A menudo, no sabremos cómo funciona algo, y ahí es cuando debemos investigar.

Las comunidades de aprendizaje en ciberseguridad, como Hack The Box, ofrecen recursos gratuitos, máquinas vulnerables y guías. En estas comunidades, hay dos tipos de personas:

1. Los que no saben nada.
2. Los que creen que no saben nada.

Esto puede ser frustrante, pero es parte del proceso. Es clave mantener el respeto y recordar que todos empezamos desde cero. Podemos interactuar con la comunidad en:

- **Foro**: [https://forum.hackthebox.com](https://forum.hackthebox.com)
- **Discord**: [https://discord.gg/hackthebox](https://discord.gg/hackthebox)

Muchos desconocen su verdadero nivel de conocimiento. Un pentester necesita manejar muchas tecnologías, lo que hace difícil especializarse. Podemos aprender sobre todo sin ser expertos en nada, o profundizar en un área específica.

Una alternativa es desarrollar una metodología de aprendizaje eficiente. El éxito depende de saber buscar información y aprender rápido. Pero para lograrlo, primero debemos aprender a aprender.

No hay atajos: la práctica es esencial. Leer sobre programación ayuda a entender código (aprendizaje pasivo), pero escribir y probar código (aprendizaje activo) es fundamental para mejorar.

Una pregunta común es: **¿Cuándo un pentester es lo suficientemente bueno?**  
Dado que nadie lo sabe todo, la clave está en saber encontrar, seleccionar y adaptar la información.

Y falta un concepto clave: **APRENDER**.

Aprender a aprender no es fácil. En la escuela nos enseñaron un solo método para resolver problemas, sin explorar alternativas. Por ejemplo, intenta resolver esta ecuación:

**20 * ________ + ________ = 65535**

Ahora reflexiona: ¿por qué la resolviste de esa manera y no de otra? Escríbelo y analiza tu proceso de pensamiento.

-------------------

# Organización

Ya hemos visto el panorama general mencionado varias veces. Para comprender qué tan importante es el término, imagina la siguiente situación:

	Estás de pie en una gran montaña, y al pie de la montaña hay un bosque inmenso. En el horizonte, vemos otra montaña a la que queremos llegar. La dificultad aquí es que no veremos esa montaña en cuanto bajemos al bosque. La única forma de llegar a ella es orientándonos usando los lagos, ríos y campos entre estas dos montañas.

Esto significa que debemos llevar con nosotros las herramientas necesarias y todos los puntos de orientación intermedios para evitar perdernos. Porque, en cuanto nos perdamos, no podremos simplemente avanzar por el bosque con la esperanza de alcanzar nuestro objetivo de alguna manera, o tendremos que volver a la primera montaña para reorientarnos.

Podemos ver cómo los términos dependen unos de otros y lo importante que es tener un mapa para orientarnos. Al completar los ejercicios anteriores, ya hemos hecho los primeros trazos en nuestro mapa. Estos nos ayudarán a comprender dónde estamos y hacia dónde queremos ir. Estar organizados es fundamental en las pruebas de penetración porque todo el proceso de redacción del informe debe estar estructurado.

Podemos tardar solo un día en tomar el control de varios sistemas, por lo que no queremos perder tiempo buscando una y otra vez las fuentes o la información que necesitamos. La organización se describe mejor con el siguiente ejemplo:

	 Un **leñador inexperto** tarda 30 minutos en afilar su hacha y 3 horas en talar el árbol.  
	Un **leñador experimentado** afilará el hacha durante 3 horas y talará el árbol en 30 minutos.

Existen muchas técnicas y métodos de gestión diferentes que podemos utilizar. Estos incluyen:

>- Scrum
>- Agile
>- Listas de tareas (To-Do List)
>- Bullet Journal y más.

---
# Enfocate

Vamos a profundizar un poco más. Esta vez hablaremos sobre el **enfoque**, una habilidad vital que necesitamos. Sin embargo, como muchas otras habilidades, es un arma de doble filo. Cuando hablamos de enfoque, nos referimos a concentrarnos en un tema durante un tiempo determinado. Al hacerlo, dirigimos la mayor parte de nuestro pensamiento y atención al tema elegido, dejando de lado por completo otros pensamientos relacionados con otros asuntos.

¿Alguna vez nos hemos preguntado por qué la mayoría de las personas frustradas van al gimnasio después de un día estresante en lugar de simplemente tumbarse y no hacer nada? ¿Por qué se sienten mejor después? A menudo escuchamos que lo necesitan absolutamente para calmarse. Si lo pensamos un poco, al principio parece ilógico, porque estas personas necesitan energía física adicional cuando ya están agotadas.

Esto nos lleva nuevamente a la pregunta: **"¿Por qué un esfuerzo físico adicional les ayuda a calmarse?"**

Por un lado, el cuerpo produce las llamadas endorfinas (hormonas de la felicidad) al hacer ejercicio. Estas tienen diferentes efectos en el organismo, y uno de ellos es la reducción del dolor. Además, los neurotransmisores tienen un efecto calmante y favorecen un sueño reparador. Otra función es la regulación del hambre. Probablemente lo hayamos experimentado en el deporte: en cuanto nos agotamos, sentimos hambre. Otro efecto beneficioso de las endorfinas es el fortalecimiento del sistema inmunológico, tanto a nivel físico como psicológico.

Esto puede explicar por qué empezamos a sentirnos mejor después del ejercicio, pero después de todo, el estrés más significativo no está en el cuerpo, sino en la mente. Sabemos que después de hacer deporte el cuerpo está exhausto, pero ¿por qué nuestra mente empieza a relajarse? Durante el ejercicio, nos concentramos completamente en la actividad física, ya que suele requerir una gran cantidad de energía y, por lo tanto, nuestra total atención. Al desviar el enfoque del estrés real, dejamos ir las situaciones que nos han agobiado y estas se procesan de manera **subconsciente**, resolviéndose en su mayoría.

Aquí hay un excelente ejemplo de una situación similar que probablemente hayas experimentado:

Seguramente has olvidado dónde pusiste algo o no puedes recordar un término específico que en otro momento te resultaría obvio. ¿Alguna vez te has preguntado por qué de repente puedes recordarlo después de un corto tiempo?

Nos distraemos y nos enfocamos en otro tema. De esta manera, le damos a nuestro subconsciente la posibilidad de resolver el problema por sí mismo.

Es importante diferenciar entre **enfoque** y **atención**, ya que no son lo mismo. La **atención** se refiere al **momento presente**, como ahora mismo, mientras lees este texto. Sin embargo, el **enfoque** está en el tema con el que estamos lidiando en ese momento.

Si volvemos al ejemplo de las llaves perdidas, intenta recordar qué pasaba por tu mente. Lo más probable es que fuera algo como:

	_"¿Dónde puse las llaves?"_ o _"¿Dónde las vi por última vez?"_

Si estas eran las preguntas que nos hacíamos, podemos ver que el tema central eran las llaves, por lo que nuestro **enfoque estaba en encontrarlas**.

Si alguna vez has estado en esta situación y has dicho algo como:

	_"Ok, las llaves no están aquí..."_

Entonces teníamos nuestra **atención completamente en la búsqueda** de las llaves. Sin embargo, ¿qué pasa si tenemos prisa?

Entonces miramos el reloj cada 5 segundos y nuestros pensamientos ya están en el lugar al que deberíamos llegar pronto. Difícilmente podremos **concentrarnos** en la búsqueda de las llaves porque nuestro enfoque está en **"llegar tarde"** y no en **"encontrar las llaves"**.

Debería quedar más claro que **el enfoque y la atención no son lo mismo**, y que la atención está influenciada por el enfoque.

El enfoque se basa en nuestra voluntad y en lo que queremos lograr. Puede ser una **decisión consciente** o una **decisión subconsciente** guiada por influencias externas.

> **Enfocarse es la alineación intencional y deliberada hacia un objetivo específico.**

----
# Atencion

Se puede decir que la atención es la percepción de un tema con un mayor nivel de interés para recopilar información y datos específicos sobre él.

Nuestra atención cambia con nuestra experiencia y la información que obtenemos del contexto y su claridad.

> **La atención está influenciada por nuestros intereses, necesidades, actitudes personales, creencias, orientaciones, objetivos y experiencias.**

Hemos abordado este módulo con una actitud confiada, con expectativas, orientación y un objetivo. La atención es un **proceso mental independiente** que ocurre de manera subconsciente.

Cuando hablamos de concentración, nos referimos al mantenimiento de nuestra atención en un tema específico. Esto significa que, mientras estemos interesados en un tema determinado, seguiremos trabajando en él hasta lograr el resultado deseado para nuestro bienestar. Nuevamente, la atención va de la mano con la concentración y el enfoque.

Sabemos que nuestra atención comenzará a disminuir en algún momento y que ya no podremos absorber información de manera efectiva. Llegamos a un punto de estancamiento, nos forzamos a seguir intentando y el aprendizaje termina en **problemas** de comprensión y, por lo tanto, en una mayor **frustración**.

La seguridad informática es un tema muy amplio, como ya hemos comentado. No podremos absorber toda la información de una sola vez. Volveremos a menudo sobre los temas y repetiremos lo que no entendemos. Este es un proceso normal. Debemos comprender cómo dividir nuestra atención.

No existe una fórmula general para aprender a dividir nuestra atención correctamente. Es un proceso individual que aún no se puede categorizar sin profundizar demasiado en los estudios psicológicos. Hay demasiadas características y experiencias personales a considerar.

Sabemos que la atención ocurre en el momento y, por lo tanto, tiene una duración limitada. Será una gran ventaja averiguar cuánto tiempo pueden durar nuestro estado emocional y nuestra capacidad de atención.

Podemos documentarlo y, después de una semana, observaremos un patrón interesante. Si queremos abordarlo de manera más científica, podemos agregar los siguientes puntos a nuestra documentación para obtener una mejor visión:

- Estado emocional actual
- Flujo del día hasta el momento
- Lugar de trabajo
- Horas de trabajo
- Duración
- Calidad del sueño
- Pausas insertadas
- Duración de las pausas
- Cualquier otro factor relevante

Estas son fases para las que debemos invertir al menos una hora de nuestra atención. Hagámoslo divertido y nos sorprenderemos con los descubrimientos que hagamos. Podemos crear una lista simple o incluso una tabla para documentarlo de manera rápida y sencilla. No es necesario documentarlo cada vez que comencemos algo, pero podemos relacionarlo con el módulo, curso o camino de aprendizaje en el que estemos.

Una vez que comprendamos cómo se comporta nuestra capacidad de atención, también tendremos una idea de cómo podemos dividirla. Sin embargo, esto no significa que, si tenemos una capacidad de atención de 60 minutos, podamos dividirla en tres temas de 20 minutos cada uno. Recordemos que la cantidad de atención que podemos dedicar a un tema depende de muchos factores.

Experimentemos con esto. Cambiemos nuestro lugar de trabajo, nuestros horarios, la duración del trabajo si es posible. Escuchemos música diferente y probemos cosas nuevas que puedan ayudarnos.

Lo ideal sería que no nos obligáramos a enfocarnos en un tema específico, ya que esto tendría un efecto negativo y, como mencionamos antes, podría terminar en frustración, un tema que trataremos en otra sección.

> **Asegurémonos de sentirnos cómodos y preparados para aprender cosas nuevas.**


---
# Confort
[[Índice - CPTS|CPTS]]

==Confort== es un ==estado emocional== de la mente de una persona que, entre otros aspectos, tiene una gran influencia en el comportamiento, el pensamiento, el enfoque, la atención y la capacidad de concentración. Es la sensación de bienestar en forma de comodidad y la actitud de comportamiento libre de riesgos. A esto también se le conoce como la llamada ==zona de confort==, en la que la persona ==cree== que se encuentra.

Existe la llamada ==ley de Yerkes-Dodson==, que describe el rendimiento cognitivo como una función del nivel de estrés/nerviosismo. La curva de rendimiento de esta ley es muy individual, ya que depende en gran medida de factores emocionales y motivacionales, y se divide en cuatro secciones.

La representación más utilizada de esta ley y su proceso de rendimiento es la versión de Hebb.

![[NEW_yerkes-dodson-law.png]]

Cuando hablamos de confort, depende en gran medida de si tenemos un nivel saludable de estrés o si ya hemos cruzado el umbral, lo que lleva a una disminución en nuestro rendimiento. El punto de equilibrio es muy individual. Nos encontramos en una zona a la que estamos acostumbrados y que consideramos cómoda. Generalmente, estas son situaciones y áreas en las que ya hemos adquirido cierta experiencia y sabemos cómo desenvolvernos.

Cuando salimos de la llamada ==zona de confort==, entramos en una situación o área donde tenemos poca o ninguna experiencia. Esta incertidumbre reduce nuestra capacidad de pensar y tiene un impacto significativo en nuestro proceso mental, lo que nos ralentiza.

Es interesante notar que los niños pequeños no muestran esta misma incertidumbre.

==Les encanta probar cosas nuevas todo el tiempo y no tienen miedo o dudas sobre cometer errores.==

Después de todo, ==los errores son una parte esencial del proceso de aprendizaje==, y siempre debemos recordarlo.

Aquí surge una pregunta interesante: "¿Por qué los niños pequeños, a diferencia de los adultos, no sienten esta incertidumbre?"

Veamos primero el siguiente diagrama:

![[NEW_The-Comfort-Zone-diagram.png]]

	Ahora imagina que estás parado en la entrada de un bosque oscuro y denso en plena noche. Es tan espeso que la luz del día no puede atravesar las copas de los árboles. A la izquierda y a la derecha del bosque hay acantilados demasiado empinados para descender, y sabemos que en algún lugar de ese bosque se encuentra aquello que deseamos.

	¿Entrarías a buscarlo?  
	Nuestro instinto nos diría que evitáramos hacerlo.

	Pero, ¿y si lo que deseas está solo cien metros más adelante en el bosque y está brillantemente iluminado?  
	Es aquello que te llenará de la forma en que siempre lo has deseado.  
	¿Te arriesgarías ahora?

Aquellos que eligen salir de su zona de confort llegarán a su objetivo más rápido de lo que pensaban. Se moverán más rápido de lo que jamás imaginaron.

Ahora deberíamos comprender mejor la progresión entre tomar la decisión de salir de nuestra zona de confort o permanecer en ella. Sin embargo, siempre aprenderemos algo nuevo, y cada vez será más fácil salir de ella.

---
### **Miedo**

	A menudo, las personas sienten miedo de algo nuevo o desconocido y no pueden evaluar si podría perjudicarlas de alguna manera. Existen muchos tipos de miedo, pero por ahora solo nos interesan dos. Primero, debemos diferenciar entre el miedo en situaciones peligrosas y el miedo interpretado en el proceso de aprendizaje.

	El miedo en situaciones peligrosas es necesario, ya que sirve para proteger nuestra vida o la de nuestros seres queridos. Sin embargo, el miedo interpretado pertenece a un estado imaginario de temor. Esto significa que podemos sentir miedo sin estar en una situación que ponga en riesgo nuestra vida. De hecho, el cuerpo humano puede llegar a manifestarlo como dolor, ya que el miedo es una emoción (y, por lo tanto, subconsciente) que, en casos extremos, puede incluso provocar un mal funcionamiento del músculo cardíaco (síndrome del corazón roto).

	Un excelente ejemplo de este comportamiento en la naturaleza humana es el miedo a los extraterrestres en las películas. En la mayoría de las películas, los alienígenas aterrizan en la Tierra y comienzan los "problemas de relación". Un ejemplo más común es cuando alguien desconocido golpea repentinamente nuestra puerta principal. En ese momento, nos sobresaltamos y nos asustamos, porque no sabemos si se trata de un criminal o de alguien que necesita ayuda.

El miedo imaginario está dirigido a eventos que imaginamos, con consecuencias que calculamos. Sin embargo, hay un aspecto crucial que no podemos pasar por alto:

	- Las personas temen lo que podría suceder en el futuro sin considerar el presente.

El miedo en situaciones que no ponen en peligro la vida se encuentra en nuestros pensamientos sobre el futuro imaginario. Mientras más detallado lo imaginemos, mayor será el miedo. Will Smith ha hablado sobre su experiencia enfrentando sus propios miedos.

![](https://youtu.be/bFIB05LGtMs)

El miedo imaginario es un estado emocional que nos impide vivir experiencias únicas y nos frena en nuestro camino. Incluso si queremos ser excelentes pentesters, la mayoría de los principiantes temen dar el máximo esfuerzo por el miedo imaginario al fracaso. Esto se debe a muchos otros factores que analizaremos más adelante.

Si nos encontramos sintiendo este miedo, debemos responder con el mayor detalle posible a la siguiente pregunta:

- "¿Cuál de estas razones es realmente cierta en este momento?"

Otro factor que refuerza este miedo imaginario y nos hace pensar que fracasaremos son nuestras experiencias pasadas de fracaso. Algo que debemos recordar, escribir y colgar en la pared donde siempre podamos verlo:

- **La diferencia entre un ganador y un perdedor es que el ganador ha perdido más veces que el perdedor.**

El fracaso es esencial en el aprendizaje y es inevitable. Nadie ha adquirido una habilidad sin cometer errores. De hecho, ocurre lo contrario. Nuestros fracasos son cruciales en nuestra curva de aprendizaje porque nos impulsan a llegar más alto. Cuando volvemos a un punto donde fallamos antes, ya sabemos qué esperar, lo que nos facilita superar la dificultad.

Muchas personas se rinden en este punto. Podemos imaginarlo como si estuvieran sentadas esperando subir sin moverse. Incluso si alguien les lanza una cuerda para ayudarlas a pasar el obstáculo, no servirá de nada si no hacen el esfuerzo de escalar.

---

### **Mentalidad**

Es en estas situaciones cuando aparecen nuestras excusas, como:

- No puedo hacer esto.
- Esto no es para mí.
- No entiendo esto.
- Etc.

Esto proviene de nuestra mentalidad y de cómo interpretamos las situaciones y ciertos desafíos. Nuestra mentalidad está formada por procesos de pensamiento inconscientes que desarrollamos para evitar situaciones difíciles o esfuerzos. Estos procesos también se moldean durante nuestra infancia. Por ejemplo, un niño constantemente criticado por sus éxitos y fracasos tendrá dificultades para atreverse a probar cosas nuevas. Por otro lado, la falta de crítica puede hacer que el niño sea demasiado confiado, lo que podría llevarlo a sobrestimar sus capacidades.

La mentalidad también puede describirse como un conjunto de creencias (no solo culturales). Un ejemplo de esto es la creencia de que el contacto visual es señal de interés y apertura en todas partes. Sin embargo, en Japón, esto se considera una invasión de la privacidad y es visto como una falta de respeto.

Es recomendable ser conscientes de estos procesos de pensamiento. Una vez que comprendemos nuestra forma de pensar, tenemos más información para trabajar y podemos decidir qué queremos cambiar. Por ejemplo, cuando nos encontramos pensando =="No puedo"==, podemos cambiar esta idea agregando una sola palabra:

- No puedo hacer esto **todavía**.
- Esto no es para mí **todavía**.
- No entiendo esto **todavía**.
- Etc.

Este pequeño cambio estimula nuestras creencias y mentalidad para superar los obstáculos.

Todos los sentimientos y obstáculos que nos impiden avanzar son temporales. Estos sentimientos pasarán, pero el objetivo permanecerá.

Otro factor que a menudo se percibe como un obstáculo es la comparación entre habilidad, talento y pasión. Sin embargo, ya hemos aprendido qué significa realmente cada uno de ellos:

- **El talento** es una habilidad altamente desarrollada con gran eficiencia.
- **La habilidad** es la capacidad de manejar o resolver algo de manera efectiva.
- **La pasión** es el compromiso emocional con un área en particular.

Si analizamos estas definiciones, veremos que están interrelacionadas y se apoyan mutuamente, en lugar de ser factores que nos limitan. Todos tenemos diferentes talentos, patrones de pensamiento que facilitan unas tareas y dificultan otras, habilidades que podemos aprender y la pasión necesaria para alcanzar nuestro objetivo. Lo importante no son los componentes individuales, sino el objetivo que queremos lograr.

---

### **Presión**

La presión también puede describirse como estrés mental, la suma de todas las influencias externas e internas detectables. La presión psicológica surge según la situación y demanda nuestros recursos.

Se distingue entre influencias internas y externas. Las influencias internas incluyen nuestras creencias y actitudes. Estas pueden ser una espada de doble filo. Por ejemplo, el perfeccionismo nos hace querer hacerlo todo perfectamente y rápido, lo que puede volverse en nuestra contra.

Es difícil controlar estos rasgos de carácter porque ocurren inconscientemente y se manifiestan en forma de emociones. Si nos sentimos incómodos o abrumados por una tarea, inconscientemente pensamos que no estamos a la altura. A menudo nos preguntamos:

- "¿Por qué debería seguir con esto?"

		Como esto está gobernado por nuestro subconsciente, necesitamos cambiar nuestro enfoque mental. Una manera de hacerlo es a través de actividades creativas, ya que nos obligan a usar el cerebro de una manera diferente.

		Una de estas actividades creativas puede ser la música o el dibujo. La razón es que al crear algo nuevo, no podemos enfocarnos en nuestra mentalidad negativa al mismo tiempo.

		Las influencias externas incluyen lo que otros piensan y dicen de nosotros. Puede tratarse de plazos estrictos o de personas que intentan desmotivarnos. Muchas veces, estas personas lo hacen para inflar su propio ego y no tienen nada que ver con nuestras habilidades reales.

Debemos recordar lo siguiente:

	- **Solo la persona que ha recorrido exactamente el mismo camino que tú puede evaluar tus decisiones. Todo lo demás son suposiciones.**


---

# Cuestionamiento

Aprender a hacer las preguntas correctas es un arte y una habilidad crítica. No importa en qué situación estemos ni si estamos discutiendo temas técnicos o no técnicos. Sin embargo, muchas personas no conocen la diferencia entre preguntas correctas e incorrectas. De hecho, la mayoría ni siquiera sabe qué es una pregunta. Actualmente, definimos las preguntas y vemos su propósito como la recopilación de información y hechos a partir de los cuales podemos sacar conclusiones y hacer suposiciones que guiarán nuestras decisiones y, por lo tanto, nuestro futuro curso de acción. Sin embargo, esta opinión pronto cambiará. Además de eso, las preguntas suelen servir para orientarnos. Con esto queremos decir que podemos obtener una visión general basada en las preguntas que hacemos, lo que nos ayuda a encontrar más información sobre el tema que nos interesa. Las preguntas representan la visión de la situación antes de dar el paso y avanzar en nuestro camino.

Metafóricamente hablando, las usamos para ver dónde queremos estar o cuál puede ser nuestro próximo paso.

Especialmente en nuestro campo de la ciberseguridad y, sobre todo, en las pruebas de penetración, debemos tener en cuenta lo siguiente:

**Lo más importante y difícil en cualquier situación no es la búsqueda de la respuesta correcta, sino la búsqueda de la pregunta correcta.**

Un buen ejemplo es que, si ya se conoce la respuesta a una tarea, la tarea deja de ser necesariamente difícil de resolver. Muchas personas creen que buscar una respuesta es una de las actividades más difíciles que los acompañará a lo largo de su vida. Sin embargo, encontrar la respuesta se vuelve lo contrario cuando la pregunta se plantea correctamente. Es mucho más complicado hacer las preguntas adecuadas cuando no comprendemos los conceptos o cuando no tenemos conocimiento de un área en particular. Todos hemos estado en situaciones en las que, de repente, no sabíamos qué hacer y ni siquiera entendíamos por dónde empezar para resolver la situación.

En este punto, debemos elegir de 3 a 5 situaciones similares de nuestras vidas y escribir una pregunta para cada una de ellas. Pueden ser cualquier tipo de situación. Podemos tomar situaciones difíciles y confusas y luego escribir una pregunta para ellas. A lo largo de esta sección, aprenderemos un modelo que nos ayudará a ver la diferencia entre la calidad de las preguntas que hacíamos y las preguntas que necesitábamos hacer. Al hacerlo, también nos daremos cuenta rápidamente de la efectividad del modelo y de cuánto nos habría ayudado en su momento. Esta es la mejor manera de juzgar su efectividad en base a nuestras propias experiencias de vida. Por lo tanto, no debemos omitir este paso y escribir de 3 a 5 situaciones de nuestra vida ahora.

---

## Estados de las Preguntas

Antes de continuar, debemos aclarar un mito sobre las preguntas. Debemos tener claro lo siguiente:

- No existen preguntas "buenas" o "malas". Fin de la historia.

Examinemos la siguiente pregunta y aclaremos este mito de una vez por todas:

- `¿Qué son las "buenas" preguntas?`

Supongamos que la respuesta es `X`, `Y` y `Z`. ¿Es esta pregunta "buena" o "mala"?

No importa, es irrelevante. "Bueno" o "malo" es un estado que atribuimos a la pregunta. ¿Qué influencia tiene esta condición en la respuesta? - Ninguna. La respuesta sigue siendo `X`, `Y` y `Z`.

Si hacemos algo que no afecta el resultado, no importa y, por lo tanto, es completamente irrelevante. Es como preguntarnos:

- "¿Qué pasa si salto al agua?"

A esta pregunta, agregamos los siguientes factores:

- "El agua está fría/caliente/oscura/transparente."

¿Cómo afecta el estado del agua al resultado de saltar al agua? - No lo hace. Aparte de todas las demás consecuencias, nos mojamos de cualquier manera. Lo interesante es que al agregar la condición, nos acercamos más a la situación real, ya que hemos usado esta descripción para definir el estado del agua. Sin embargo, ¿cómo influenciaríamos el resultado si estableciéramos el estado de la pregunta y dijéramos que es una "buena" pregunta? - No lo haríamos.

Las personas usan los términos "bueno" y "malo" para describir el beneficio o la pérdida que esperan obtener de la pregunta. Si obtienen una respuesta que les beneficia, clasifican la pregunta como "buena". Pero, ¿y si la pregunta conduce a una pérdida o, incluso peor, no ayuda a la persona? ¿Es la pregunta mala? - En realidad, no.

El estado que atribuimos a las preguntas no afecta las respuestas. El estado atribuido a la pregunta pertenece a la respuesta o al resultado. La respuesta puede ser "buena" o "mala" hasta cierto punto, pero no necesariamente, dependiendo de nuestro objetivo y de si nos estamos acercando a él. Si nos acercamos a la respuesta o al resultado, alejándonos de un objetivo menos ideal, es algo positivo.

Podemos asignar dos estados a una pregunta; así, podemos describirla como una `pregunta imprecisa` o una `pregunta precisa`.

- Una `pregunta imprecisa` sería, por ejemplo: "¿Cómo puedo hackear X?"
- Una `pregunta precisa` sería: "¿Cómo puedo usar el servicio SMB del servidor para identificar sus cuentas de usuario existentes?"

Como podemos ver en estos dos ejemplos, el nivel de precisión puede afectar enormemente el resultado y la respuesta. No obstante, una pregunta precisa sigue sin ser "buena" o "mala", ya que estos términos son irrelevantes y no influyen en el resultado.

---

## Preguntas en General

Usamos preguntas en la vida cotidiana más a menudo de lo que nos damos cuenta a primera vista. En promedio, hacemos entre 3 y 5 preguntas por minuto. Por supuesto, esto depende de la situación. Podemos experimentar configurando un temporizador durante 1 minuto y observando nuestros pensamientos en ese período. Cada vez que notemos que nos hacemos una pregunta o que algo no nos queda claro, marcamos un punto en una hoja de papel hasta que se acabe el tiempo. Para realizar este experimento, necesitamos un bolígrafo, una hoja de papel y configurar el temporizador. A partir de ahora, dejamos que el temporizador corra.

Las preguntas pueden formularse de muchas maneras diferentes, ya que se adaptan a las circunstancias, situaciones y objetivos deseados. Son una parte esencial del proceso de pensamiento, en el que se crean conexiones entre nodos de información en nuestro cerebro. Así, también son una parte fija e inevitable del proceso de aprendizaje. Eliminar las preguntas, por lo tanto, reduce enormemente el aprendizaje. Si no cuestionamos nada mientras leemos contenido, es como una receta de cocina sin información sobre cómo prepararla. Porque una receta contiene una gran pregunta desde el principio:

- `¿Cómo cocino el plato?`

Cada receta tiene dos elementos clave:

1. Ingredientes
2. Método de preparación

El contenido del material de aprendizaje se puede equiparar con los ingredientes. El método de preparación se correlaciona con nuestras preguntas, ya que determinan qué paso tomaremos a continuación y definen nuestro enfoque. Finalmente, cómo el cocinero describe la preparación nos indica cuándo, cómo y qué agregar y procesar para acercarnos al resultado final.