/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            A:chararray,
            B:chararray,
            C:int
    );

resul = FOREACH datos GENERATE C;
ordenada = ORDER resul By C asc;
ordenada = LIMIT ordenada 5;
STORE ordenada INTO 'output' USING PigStorage(',');
