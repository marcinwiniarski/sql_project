SELECT COALESCE(a.dimension_1, b.dimension_1) AS [dimension_1],
       map.correct_dimension_2 AS dimension_2,
       COALESCE(SUM(measure_1), 0) measure_1,
       COALESCE(SUM(measure_2), 0) measure_2
FROM [Table A] a
FULL  JOIN [Table B] b ON a.dimension_1 = b.dimension_1
INNER JOIN
  (SELECT DISTINCT dimension_1,
                   correct_dimension_2
   FROM [Table MAP]) map ON COALESCE(a.dimension_1, b.dimension_1) = map.dimension_1
GROUP BY COALESCE(a.dimension_1, b.dimension_1),
         map.correct_dimension_2
