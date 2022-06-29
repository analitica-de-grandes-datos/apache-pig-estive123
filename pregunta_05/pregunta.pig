/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

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

colum2 = FOREACH datos GENERATE B;
colum2_separ = FOREACH colum2 GENERATE FLATTEN(TOKENIZE(B)) AS A;
colum2_separ = FILTER colum2_separ BY (A MATCHES '.*[a-z].*');
agrup = GROUP colum2_separ BY A;
wcount = FOREACH agrup GENERATE group, COUNT(colum2_separ);
STORE wcount INTO 'output' USING PigStorage(',');
