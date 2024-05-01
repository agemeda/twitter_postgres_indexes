CREATE INDEX ind_x1 on tweets_jsonb USING GIN(
    (data->'entities'->'hashtags'));
CREATE INDEX ind_x2 ON tweets_jsonb USING GIN(
    (data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX ind_x3 ON tweets_jsonb USING GIN(
    to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
