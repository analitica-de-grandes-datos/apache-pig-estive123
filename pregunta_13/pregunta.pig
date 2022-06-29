/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
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

conjun = FOREACH datos GENERATE E;
result = FILTER conjun BY (E MATCHES '.*^[bB].*'); 
STORE result INTO 'output' USING PigStorage(',');
