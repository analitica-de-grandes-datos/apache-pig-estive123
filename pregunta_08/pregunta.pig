/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            A:chararray,
            B:chararray,
            C:chararray
    );

data = FOREACH datos GENERATE FLATTEN(TOKENIZE(B, ',')) AS B_separar, FLATTEN(TOKENIZE(C, ',')) AS C_separar;
data = FOREACH data GENERATE REPLACE(B_separar, '([^a-zA-Z\\s]+)','') AS A, REPLACE(C_separar,'([^a-zA-Z\\s]+)','') AS K;
data = FOREACH data GENERATE TOTUPLE(A,K) as tupla; 
agrup = GROUP data BY tupla;
wcount = FOREACH agrup GENERATE group, COUNT(data); 
STORE wcount INTO 'output' USING PigStorage(',');
