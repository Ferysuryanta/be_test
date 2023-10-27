package com.backend_test.repo;

import com.backend_test.entity.Car;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepo extends JpaRepository<Car, Long> {

    List<Car> findByBrandName( String brandName);
}
