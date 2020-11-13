small-args=-Dquarkus.native.additional-build-args=$\
	-J-XX:+HeapDumpOnOutOfMemoryError$\
	,-J-Xmx8G

large-args=-Dquarkus.native.additional-build-args=$\
	-J-Xmx40G

debug-classes=-Dclasses=200
debug-args=-Dquarkus.native.additional-build-args=$\
	-H:-DeadlockWatchdogExitOnTimeout

small:
	mvn install -P native \
		-Dclasses=200 \
		$(small-args)

large:
	mvn install -P native \
		-Dclasses=1000 \
		$(large-args)

debug:
	mvn install -P native \
		-Dclasses=200 \
		-Dquarkus.native.debug-build-process=true \
		$(debug-args)

clean:
	mvn clean
