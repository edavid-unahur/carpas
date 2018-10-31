# Oktubre Fest

[Ein Prosit!](https://www.youtube.com/watch?v=DNxE5NQXLM4)

En Münich-Alemania, todos los años se festeja la Oktubrefest. Para esta gran feria de comidas, entretenimientos y mucha cerveza nos piden construir un programa en objetos que modele el comportamiento de las personas en la fiesta. 

Al entrar en la fiesta se pueden encontrar enormes carpas cerveceras, en donde muchísima gente se reune a . . . bueno . . . tomar cerveza. Queremos controlar la entrada a estas carpas dependiendo de la disponibilidad de la carpa y los gustos del público.

### Jarras y Carpas
Las carpas cerveceras tienen:
* un límite de gente admitida, 
* algunas tienen una banda para tocar música tradicional (esto debe indicarse para cada una),
* y por supuesto que todas venden jarras de cerveza. 

De cada jarra de cerveza sabemos su capacidad en litros y de qué marca es. Cada carpa sirve jarras de cerveza de sólo una marca (que depende de cada carpa).

### Personas
De cada persona se sabe su peso, las jarras de cerveza que compró hasta el momento, si le gusta escuchar música tradicional o no, y su nivel de aguante, que es un número. Una persona está ebria si la cantidad de alcohol que ingirió multiplicado por su peso supera su aguante. 

Además, de cada persona interesará saber qué marcas de cerveza le gustan. Se sabe que a los belgas les gusta solamente la cerveza con más de 4 gramos de lúpulo por litro, a los checos les gustan las cervezas de más de 8 % de graduación (ver abajo qué es la graduación de la cerveza), a los alemanes les gustan todas.

### Marcas
Existen varias marcas de cerveza. Están las marcas de cerveza rubia (como la Corona), las marcas de cerveza negra (como la Guiness), y las marcas de cerveza roja (como la Hofbräu). De cada marca se sabe su contenido de lúpulo, o sea, cuántos gramos de lúpulo por litro llevan. También se conoce el país donde se fabrica.

La graduación de una cerveza es su porcentaje de alcohol en volumen. P.ej. una cerveza de 10 % de graduación, tendrá 0.1 litro de alcohol por litro de cerveza: 
* Cada marca de cerveza rubia tiene una graduación distinta. 
* Por otro lado, la graduación de una marca de cerveza negra se calcula como el mínimo entre la graduación reglamentaria y el doble de su contenido de lúpulo. La graduación reglamentaria es mundial, o sea que es única para todas las marcas de cerveza negra del mundo; puede cambiar con el tiempo. 
* La cerveza roja se fabrica con procedimientos similares a la de la cerveza negra, pero que concentran más el alcohol. Por lo tanto, la graduación de una marca de cerveza roja se calcula multiplicando el valor que correspondería a una cerveza negra con la misma configuración, por 1.25.


### Requerimientos

Se pide test y codificación completa para los siguientes requerimientos:

1. Saber el **contenido de alcohol** de una jarra de cerveza. Ej: una jarra de cerveza de medio litro de la marca _Hofbräu_ (suponiendo que tiene 8 % de graduación alcohólica) tiene 0.5 * 0.08 = 0.04 litros de alcohol.

2. Saber el **total de alcohol** que ingirió una persona (en base a las jarras de cerveza que compró).

3. Saber si una persona **está ebria** o no.

4. Saber si una persona **quiere entrar** a una carpa. Para esto hay que mirar si la marca de cerveza que venda la carpa le gusta a la persona y si cumple su preferencia sobre que haya o no haya música (ojo con esto: si a la persona le gusta la música tradicional tiene que haber música en la carpa, y si no le gusta, entonces no puede haber música). 
Los alemanes, además, requieren que haya una cantidad par de personas en la carpa (antes de entrar ellos).

5. Saber si una carpa **deja ingresar** a una persona, o sea, si dejándola entrar no supera su límite de personas y la persona no está ebria.

6. Saber si una persona **puede entrar** a una carpa, es decir, si quiere entrar a la carpa y la carpa lo deja entrar.

7. Hacer que una persona efectivamente **entre** a una carpa. Si una persona quiere ingresar a una carpa y no puede por la falla de alguna condición resuelta en los puntos anteriores, generar un error. Si entra, debe actualizarse la capacidad de la carpa.

8. Saber cuantos **ebrios empedernidos** hay dentro de una carpa. Los ebrios empedernidos son los ebrios que todas las jarras que compraron, son de 1 litro ó más.

9. Saber si una persona **es patriota**, o sea, si todas las jarras de cerveza que compró son del país del que proviene. P.ej. un alemán es patriota si todas las jarras de cerveza que compró son alemanas.
