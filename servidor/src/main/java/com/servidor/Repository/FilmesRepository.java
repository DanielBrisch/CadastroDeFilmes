package com.servidor.Repository;

import com.servidor.entities.Filme;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FilmesRepository extends JpaRepository<Filme, Long> {

    List<Filme> findAll();
}
