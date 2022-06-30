datos = LOAD 'data.csv' USING PigStorage(',') 
    AS ( 
            A: int, 
            B:chararray, 
            C:chararray, 
            D:chararray, 
            E:chararray, 
            F:chararray 
    ); 
 
conjunt = FOREACH datos GENERATE B;
result = FILTER conjunt BY SUBSTRING(B, 0, 1) >= 'M'; 
STORE result INTO 'output' USING PigStorage(',');/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
