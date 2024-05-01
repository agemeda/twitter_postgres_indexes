/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus

SELECT
    tag,
    count(*) as count
FROM (
    SELECT DISTINCT
        id_tweets,
        t2.tag
    FROM tweet_tags t1
    JOIN tweet_tags t2 USING (id_tweets)
    WHERE t1.tag='#coronavirus'
      AND t2.tag LIKE '#%'
) t
GROUP BY (1)
ORDER BY count DESC,tag
LIMIT 1000;

*/


SELECT tag, COUNT(*) as count

FROM (
    SELET DISTINCT
    data->>'id' as id_tweets,
        '#' || (jsonb_array_elements(data->'entities'->'hashtags' || coalesce(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') as tag
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
       OR data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
) tg
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
