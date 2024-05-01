/*
 * Count the number of English tweets containing the word "coronavirus"
 
SELECT
    count(*)
FROM tweets
WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
  AND lang='en'
;

*/

SELECT COUNT(DISTINCT (data ->>'id'))
FROM tweets_jsonb
WHERE to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text',data->>'text')) @@ to_tsquery('english','coronavirus') AND data->>'lang' = 'en';
