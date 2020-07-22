DELETE FROM wp_posts WHERE  id IN 
(
    SELECT a.post_id FROM
        (SELECT meta_value,max(post_id) AS post_id FROM wp_postmeta 
        WHERE meta_key='_sku' 
        GROUP BY meta_value HAVING COUNT(meta_value) > 1 ) a
        WHERE post_type = 'product' 
        AND post_status = 'publish' 
 );
