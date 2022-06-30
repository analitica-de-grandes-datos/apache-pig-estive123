/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

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
 
conjunt = FOREACH datos GENERATE E; 
result = FILTER conjunt BY NOT (E MATCHES '.*^[bB].*'); 
STORE result INTO 'output' USING PigStorage(',');
