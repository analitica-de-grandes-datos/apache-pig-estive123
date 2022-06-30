/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

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


data = FOREACH datos GENERATE A, TOKENIZE(B,',') AS B_separar, TOKENIZE(C,',') AS C_separar;
data = FOREACH data GENERATE A, COUNT(B_separar) AS data_B, COUNT(C_separar) AS data_C;
result = ORDER data BY A, data_B, data_C asc;
STORE result INTO 'output' USING PigStorage(',');
