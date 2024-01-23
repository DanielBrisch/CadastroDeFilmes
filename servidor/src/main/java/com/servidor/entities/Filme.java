package com.servidor.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Blob;

@Entity
@Setter
@Getter
@AllArgsConstructor
public class Filme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true)
    private Long id;

    @Column(name = "NOME", nullable = false)
    private String nome;

    @Column(name = "DESCRICAO")
    private String descricao;

    @Column(name = "RESTRICAO")
    private int restricao;

    @Column(name = "CLASSIFICACAO")
    private Double classificacao;

    @Column(name = "CAPAFILME", nullable = false)
    private Blob capaFilme;

    public Filme() {
    }
}
