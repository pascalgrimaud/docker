CREATE KEYSPACE IF NOT EXISTS cassandra2
    WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }
    AND DURABLE_WRITES = true;
