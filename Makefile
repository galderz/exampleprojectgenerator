PROFILER_HOME=/opt/async-profiler

small-classes=200
small-args=-Dquarkus.native.additional-build-args=$\
	-J-Xmx8G$\
	,-J-XX:+HeapDumpOnOutOfMemoryError

large-classes=1000
large-args=-Dquarkus.native.additional-build-args=$\
	-J-Xmx64G

debug-args=-Dquarkus.native.additional-build-args=$\
	-H:-DeadlockWatchdogExitOnTimeout

profile-cpu-args=-Dquarkus.native.additional-build-args=$\
	-J-Xmx8G$\
	,-J-agentpath:$(PROFILER_HOME)/build/libasyncProfiler.so=start\\,file=profile-cpu.svg\\,event=cpu

profile-alloc-args=-Dquarkus.native.additional-build-args=$\
	-J-Xmx8G$\
   	,-J-agentpath:$(PROFILER_HOME)/build/libasyncProfiler.so=start\\,file=profile-alloc.svg\\,event=alloc

small:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		$(small-args)

small-reports:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		-Dquarkus.native.enable-reports=true \
		$(small-args)

large:
	mvn install -P native \
		-Dclasses=$(large-classes) \
		$(large-args)

debug:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		-Dquarkus.native.debug-build-process=true \
		$(debug-args)

profile-small:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		$(profile-args)

profile-cpu:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		$(profile-cpu-args)

profile-alloc:
	mvn install -P native \
		-Dclasses=$(small-classes) \
		$(profile-alloc-args)

clean:
	mvn clean
