package com.backend_test.repo;

import com.backend_test.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BrandRepo extends JpaRepository<Brand, Long> {


}
