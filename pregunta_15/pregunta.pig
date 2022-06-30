/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
datos = LOAD 'data.csv' USING PigStorage(',') 
    AS ( 
            A: int, 
            B:chararray, 
            C:chararray, 
            D:chararray, 
            E:chararray, 
            F:chararray 
    ); 
 
conjunt = FOREACH datos GENERATE B, E; 
result = FILTER conjunt BY (B MATCHES '.*^[zZ].*') AND (E == 'blue'); 	
STORE result INTO 'output' USING PigStorage(' ');
