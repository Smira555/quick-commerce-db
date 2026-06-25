EXPLAIN ANALYZE
SELECT 
    o.order_id, 
    p.product_name, 
    oi.add_to_cart_order
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.user_id = 4567;

--using b-trees
-- 1. Index the foreign key we are searching by
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- 2. Index the keys used to stitch the bridge table together
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

EXPLAIN ANALYZE
SELECT 
    o.order_id, 
    p.product_name, 
    oi.add_to_cart_order
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.user_id = 4567;