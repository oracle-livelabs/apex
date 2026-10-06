-- Lab 7: embed the knowledge base articles with the in-database ONNX model.
-- Requires the minilm_l12 model loaded via DBMS_VECTOR.LOAD_ONNX_MODEL (Lab 7, Task 3).
-- Plain SQL - no external calls, no credentials. Re-run any time (e.g. after a
-- helpdesk-schema.sql reset) to repopulate the vectors.
update kb_articles
   set embedding = vector_embedding(minilm_l12 using title || ' ' || content as data);

commit;

-- sanity check: every article embedded
select count(*) as embedded from kb_articles where embedding is not null;
