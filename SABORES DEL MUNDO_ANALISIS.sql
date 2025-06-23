--------- PARTE B

1. ¿Cuántos artículos hay en el menú?

R= 32 articulos

SELECT COUNT(*) AS total_articulos FROM menu_items;

R= 32 articulos

--
2. ¿Cuál es el artículo menos caro y el más caro?

Menos caro

R= Edamame 5.00$

SELECT item_name, price 
FROM menu_items 
ORDER BY price ASC 
LIMIT 1;



Más caro

R= Shrimp Scampi 19.95$

SELECT item_name, price 
FROM menu_items 
ORDER BY price DESC 
LIMIT 1;

---

3. ¿Cuántos platos americanos hay en el menú?

R= 6

SELECT COUNT(*) AS platos_americanos 
FROM menu_items 
WHERE category = 'American';

---

4. ¿Cuál es el precio promedio de los platos?

R= 13.29$

SELECT ROUND(AVG(price), 2) AS precio_promedio 
FROM menu_items;

------ PARTE C

5. ¿Cuántos pedidos únicos se realizaron en total?

R= 5,370

SELECT COUNT(DISTINCT order_id) AS total_pedidos 
FROM order_details;



----

6. ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

R= 440, 2675, 3473, 4305, 443

SELECT * FROM order_details LIMIT 1;

SELECT order_id, COUNT(*) AS total_articulos
FROM order_details
GROUP BY order_id
ORDER BY total_articulos DESC
LIMIT 5;
----

7. ¿Cuándo se realizó el primer pedido y el último pedido?

R= Primer pedido 2023-01-01 , Segundo Pedido 2023-03-31

SELECT 
  MIN(order_date) AS primer_pedido, 
  MAX(order_date) AS ultimo_pedido 
FROM order_details;

---

8. ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
R= 308 pedidos

SELECT COUNT(DISTINCT order_id) AS pedidos_enero 
FROM order_details 
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

R= 308 pedidos

--- PARTE D
--LEFT JOIN 
SELECT 
  od.*, 
  mi.item_name, 
  mi.category, 
  mi.price
FROM order_details od
LEFT JOIN menu_items mi
  ON od.item_id = mi.menu_item_id;

 ----

 9.  ¿Cuáles son los productos más pedidos?

R= 1. hamburger 622, Edamame 620, Korean Beef Bowl 588, Cheeseburger 583, French Fries 571.

 SELECT 
  mi.item_name,
  COUNT(*) AS total_pedidos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY total_pedidos DESC
LIMIT 5;

--
10.  ¿Cuáles son las categorías más populares?

R= 1. Asian, Italian, Mexican, American.

Top 4

--No hay mucha diferencia entre la italiana y la méxicana son solo 2 articulos más. 

SELECT 
  mi.category,
  COUNT(*) AS total_articulos
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_articulos DESC;

---

11. ¿Cuáles son los ingresos generados por producto?

R= Korean Beef Bowl 10,554, Spaghetti & Meatballs 8,436, Tofu Paf Thai 8,149, Cheeseburguer 8,132.

SELECT 
  mi.item_name,
  SUM(mi.price) AS ingresos_totales
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY ingresos_totales DESC
LIMIT 5;
----

12. ¿Qué día hubo más pedidos? 

R= 2023-02-01 con 188 pedidos.

SELECT 
  order_date,
  COUNT(*) AS total_pedidos
FROM order_details
GROUP BY order_date
ORDER BY total_pedidos DESC
LIMIT 5;
---

13. ¿Qué categoría genera más ingresos?

R= Italian, 49,462.70$

SELECT 
  mi.category,
  SUM(mi.price) AS ingresos_totales
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE mi.category IS NOT NULL
GROUP BY mi.category
ORDER BY ingresos_totales DESC;

--- ANÁLISIS DE DATOS:


