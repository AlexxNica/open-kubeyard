druid.service=druid/historical
druid.port={{ default "8083" .Values.historical.port }}

# HTTP server threads
druid.server.http.numThreads=25

# Processing threads and buffers
druid.processing.buffer.sizeBytes=536870912
druid.processing.numThreads=7

# Segment storage
druid.segmentCache.locations=[{"path":"/var/lib/druid/segment-cache","maxSize"\:130000000000}]
druid.server.maxSize=130000000000
