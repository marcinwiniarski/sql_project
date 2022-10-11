WITH base AS
  (SELECT dimension_1,
          measure_1,
          NULL AS measure_2
   FROM [Table A]
   UNION SELECT dimension_1,
                NULL AS measure_1,
                measure_2
   FROM [Table B])
SELECT base.dimension_1,
       map.correct_dimension_2 AS dimension_2,
       COALESCE(SUM(measure_1), 0) measure_1,
       COALESCE(SUM(measure_2), 0) measure_2
FROM base
INNER JOIN
  (SELECT DISTINCT dimension_1,
                   correct_dimension_2
   FROM [Table MAP]) map ON base.dimension_1 = map.dimension_1
GROUP BY base.dimension_1,
         map.correct_dimension_2