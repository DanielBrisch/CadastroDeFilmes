package com.servidor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.servidor.entities")
@EnableJpaRepositories(basePackages = "com.servidor.Repository")
public class ServidorApplication {
	public static void main(String[] args) {
		SpringApplication.run(ServidorApplication.class, args);
	}
}
