/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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
columD = FOREACH datos GENERATE ToString(ToDate(D,'yyyy-MM-dd'),'yyyy');
columnD_separar = FOREACH columD GENERATE FLATTEN(TOKENIZE($0)) AS letra;
agrup = GROUP columnD_separar BY letra;
wcount = FOREACH agrup GENERATE group, COUNT(columnD_separar);
STORE wcount INTO 'output' USING PigStorage(',');
