COPY Customer FROM stdin USING DELIMITERS '|' NULL 'null';
1|Indiana Jones|USA|1973-04-22|H
2|Shelock Holmes|221 Baker St|1895-04-22|O
3|Dunston|222 Baker St|1895-04-22|O
4|Kevin|223 Baker St|1895-04-22|H
5|Matthew|224 Baker St|1895-04-22|H
6|Maven|null|1995-03-23|O
7|Gavin|null|null|H
8|Matthew|441 Acme Ln|1983-02-03|H
9|Alice|441 Acme Ln|1983-02-03|O
10|Gavin|null|null|H
\.
COPY MenuItem FROM stdin USING DELIMITERS '|' NULL 'null';
1|Foie Gras|Something delicious| 112.23
2|Rice bowl|Something delicious| 2.23
3|Ramen bowl|Something delicious| 232.23
4|Fried Rice|Something delicious|14.25
5|Pita Bread|null|4.25
6|Hummus|null|1.25
7|Apple Pie|null|3.25
\.
