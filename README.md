[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/GCh42miP)
# P1 - Reciclaje

El propósito de esta práctica es modelar un entorno dentro de un edificio, donde un robot se dedica a coger objetos del suelo y organizarlos.
Los objetos (items) pueden ser basura, en cuyo caso el robot los debe soltar en el cubo de basura que le corresponda.
Los objetos que no sean basura deben ser colocados en una mesa.

## Ejemplo sencillo
Los archivos [recycling_domain_example](recycling_domain_example.pddl) y [recycling_problem_example](recycling_problem_example.pddl) contienen un dominio y un problema de ejemplo con la funcionalidad más básica.

En este ejemplo, se asume que el robot dispone de una base móvil con una pinza (gripper) con la capacidad de coger y soltar objetos.

Además, el dominio propuesto se limita a una única habitación, donde asumimos que el robot se puede mover libremente de una ubicación a otra.


**Ejercicio de calentamiento 1:** Analiza el ejemplo propuesto y ejecuta el planificador (POPF) para ver el plan que genera. Puedes cambiar la definición del problema para ver cómo cambian los planes.

*Nota: Puedes encontrar instrucciones para instalar y ejecutar POPF en el archivo [POPF_INSTRUCTIONS](POPF_INSTRUCTIONS.md).*

```pddl
0.000: (move walle table floor)  [0.001]
0.001: (pick bottle floor walle)  [0.001]
0.002: (move walle floor table)  [0.001]
0.003: (drop bottle table walle)  [0.001]
0.004: (move walle table floor)  [0.001]
0.005: (pick newspaper floor walle)  [0.001]
0.006: (move walle floor paper_trashbin)  [0.001]
0.007: (drop newspaper paper_trashbin walle)  [0.001]
0.008: (move walle paper_trashbin floor)  [0.001]
0.009: (pick rotten_apple floor walle)  [0.001]
0.010: (move walle floor organic_trashbin)  [0.001]
0.011: (drop rotten_apple organic_trashbin walle)  [0.001]
```


**Ejercicio de calentamiento 2:** Elimina o comenta la línea 14 del archivo [recycling_problem_example](https://github.com/Docencia-fmrico/2024-PSG-P1-Recycling/blob/afa78808a01408df736fdde3f0e965725673bf67/recycling_problem_example.pddl#L14), de tal forma que el robot ya no se encuentre inicialmente junto a la mesa:

```pddl
; (robot_at walle table)
```

Ahora vuelve a ejecutar el planificador y comprueba qué ocurre. ¿Por qué hay un error en la planificación? ¿Crees que sería posible que se mueva el robot sin saber su ubicación inicial?

*[Respuesta]*

Hay un error en la planificación porque el robot no conoce su posición incial. Esta posición es necesaria para las acciones de move, load y unload.

No creo que se pudiera mover el robot, ya que para la acción de moverse necesita la posición del robot.

**Ejercicio de calentamiento 3:** Modifica el problema para añadir más objetos (basura o no), e incluye un segundo robot que ayude a Wall-e con la limpieza.

Responde a la siguiente pregunta: ¿Es necesario que un objeto se encuentre inicialmente en el suelo? Tal y como está definido el dominio del ejemplo, ¿podríamos inicializar el problema con basura encima de la mesa? Pruébalo modificando el archivo del problema.

*[Respuesta]*

No es necesario que el objeto se encuentre en el suelo, puede estar en cualquier localización, como en la mesa, la basura o cualquier otro lugar definidos.

En el dominio del ejemplo si es posible que la basura este encima de la mesa, tanto como en la basura directamente.

## Ejercicio 1
Hemos actualizado nuestros robots de limpieza para que tengan la capacidad de llevar hasta 2 pinzas a la vez. Con estos nuevos robots, el dominio que tenemos de ejemplo ya no nos sirve. Indica el porqué.

*[Respuesta]*

Porque ahora el predicado gripper_free y robot_carry no sirve, ya que no es capaz de distinguir entre las dos pinzas de cada robot

Después de haber analizado las limitaciones que tiene el dominio de ejemplo con nuestros nuevos robots, crea un nuevo dominio en un archivo llamado [recycling_domain_gripper.pddl](recycling_domain_gripper.pddl) en el que se modele este cambio. Recuerda que ahora un robot puede tener más de una pinza, y que los objetos ya no serán manipulados por el robot directamente, sino por la pinza (que está conectada a la base del robot).

## Ejercicio 2
Ahora, crea un nuevo problema (puede estar basado en el problema de ejemplo) en un archivo llamado [recycling_problem_gripper.pddl](recycling_problem_gripper.pddl). El problema debe contener al menos dos robots y varios objetos de distintos tipos (basura y no basura). Al menos uno de los robots debe tener 2 pinzas.

Ejecuta el planificador con los nuevos archivos de dominio y problema y copia aquí la salida. ¿Es el resultado como esperabas?

*[Respuesta]*

Si, el resultado es el que esperaba, ya que en el dominio he añadido un predicado extra para ser capaz de diferenciar que pinzas son de cada robot. 