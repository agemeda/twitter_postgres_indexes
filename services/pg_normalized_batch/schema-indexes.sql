SET max_parallel_workers = 80;
SET maintenance_work_mem TO '16 GB';

CREATE INDEX indx_1 ON tweet_tags(id_tweets, tag);
CREATE INDEX indx_11 ON tweet_tags(tag, id_tweets);
CREATE INDEX indx_2 ON tweets(id_tweets, lang);
CREATE INDEX indx_3 ON tweets USING GIN(
    to_tsvector('english', text)) WHERE lang = 'en';

CREATE INDEX indx_4 ON tweets(lang);
