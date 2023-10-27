package com.backend_test.controller;

import com.backend_test.entity.Car;
import com.backend_test.repo.CarRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CarController {
    @Autowired
    private CarRepo carRepository;

    @GetMapping("/car")
    public List<Car> getCars( @RequestParam(name = "brand", required = false) String brandName) {
        if (brandName != null) {
            return carRepository.findByBrandName(brandName);
        } else {
            return carRepository.findAll();
        }
    }

    @GetMapping("/carByBrand")
    public List<Car> getCarsByBrand(@RequestParam(name = "brand") String brandName) {
        return carRepository.findByBrandName(brandName);
    }
}
