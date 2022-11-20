WITH target_clients AS (
	  SELECT id,
	         city,
	         stated_turnover
	  FROM clientdata
	  WHERE city IN ('London', 'New York')
), small_open_loans AS (
	  SELECT id,
	         client_id,
	         requested_at
	  FROM open_loans
	  WHERE amount_granted < 1000
), converted_timestamps (london_cutoff, new_york_cutoff) AS (
	  VALUES(
		    CURRENT_TIMESTAMP AT TIME ZONE 'EUROPE/LONDON' AT TIME ZONE 'UTC' - INTERVAL '30 days',
		    CURRENT_TIMESTAMP AT TIME ZONE 'AMERICA/NEW_YORK' AT TIME ZONE 'UTC' - INTERVAL '30 days'
	  )
)

SELECT PERCENTILE_DISC(0.8) WITHIN GROUP (ORDER BY stated_turnover) AS turnover_80p
FROM target_clients c
     JOIN small_open_loans l
	     ON c.id = l.client_id
WHERE CASE
          WHEN c.city = 'London' THEN l.requested_at >= (SELECT london_cutoff FROM converted_timestamps)
          WHEN c.city = 'New York' THEN l.requested_at >= (SELECT new_york_cutoff FROM converted_timestamps)
	    END
