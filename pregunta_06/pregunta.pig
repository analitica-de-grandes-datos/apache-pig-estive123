/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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

colum2 = FOREACH datos GENERATE C;
colum2_separar = FOREACH colum2 GENERATE FLATTEN(TOKENIZE(C)) AS clave;
colum2_separar  = FOREACH colum2_separar  GENERATE REPLACE (clave,'([^a-zA-Z\\s]+)','') as clave;
agrup = GROUP colum2_separar BY clave;
wcount = FOREACH agrup GENERATE group, COUNT(colum2_separar );
STORE wcount INTO 'output' USING PigStorage(',');
