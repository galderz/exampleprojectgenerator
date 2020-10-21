package com.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.enterprise.event.Observes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

import io.quarkus.runtime.StartupEvent;

@Path("/")
public class BootTimeMeasure {

	@GET
	@Path("/timestampedgreeting")
	public String greeting(@QueryParam("name") String name) {
		final String now = nowAsString();
		System.out.println("Request handled at: " + now);
		String suffix = name != null ? name : "World";
		return "Hello " + suffix + ' ' + now;
	}

	void onStart(@Observes StartupEvent startup) {
		System.out.println("Startup event at: " + nowAsString());
	}

	private static String nowAsString() {
		return new SimpleDateFormat("HH:mm:ss.SSS" ).format(new Date(System.currentTimeMillis()));
	}
}