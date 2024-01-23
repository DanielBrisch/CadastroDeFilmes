package com.servidor.Repository;

import com.servidor.entities.Filme;
import com.servidor.entities.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FilmesRepository extends JpaRepository<Filme, Long> {
}
