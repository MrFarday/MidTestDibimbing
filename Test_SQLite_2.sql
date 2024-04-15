SELECT item
FROM (
    SELECT item, COUNT(*) AS count
    FROM item_bought
    GROUP BY item
) AS item_counts
WHERE count != (
    SELECT MIN(count) AS min_count
    FROM (
        SELECT COUNT(*) AS count
        FROM item_bought
        GROUP BY item
    )
)
AND count != (
    SELECT MAX(count) AS max_count
    FROM (
        SELECT COUNT(*) AS count
        FROM item_bought
        GROUP BY item
    )
);
