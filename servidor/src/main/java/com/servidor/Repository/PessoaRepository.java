package com.servidor.Repository;

import com.servidor.entities.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {
    Pessoa findByNome(String nome);

    @Query("SELECT p FROM Pessoa p WHERE p.nome = :nome AND p.senha = :senha")
    Pessoa findByNomeAndSenha(@Param("nome") String nome, @Param("senha") String senha);
}
