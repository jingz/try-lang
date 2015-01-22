select setval(c.relname::varchar, 1),c.relname from pg_statio_user_sequences c;
