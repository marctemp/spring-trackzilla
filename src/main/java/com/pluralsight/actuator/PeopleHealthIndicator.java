package com.pluralsight.actuator;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class PeopleHealthIndicator implements HealthIndicator {
    private final String messageKey = "PeopleService";

    @Override
    public Health health() {
        if (!isRunningServicePeopleService()) {
            return Health.down().withDetail(messageKey, "Not Available").build();
        }
        return Health.up().withDetail(messageKey, "Available").build();
    }

    private Boolean isRunningServicePeopleService() {
        Boolean isRunning = false;
        // Add real logic here to test if People Service is running; skipped for demo purposes
        return isRunning;
    }
}