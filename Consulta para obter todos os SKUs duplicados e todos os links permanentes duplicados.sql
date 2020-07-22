SELECT a.post_name,a.post_title,a.ID,b.meta_value as _sku FROM wp_posts a
INNER JOIN (SELECT meta_value,max(post_id) AS post_id FROM wp_postmeta WHERE meta_key='_sku' 
GROUP BY meta_value HAVING COUNT(meta_value) > 1 ) b ON a.ID=b.post_id WHERE post_type = 'product' AND   post_status = 'publish';
