package com.servidor.Controller;

import com.servidor.Repository.FilmesRepository;
import com.servidor.entities.Filmes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/filmes")
public class FilmesController {

    @Autowired
    private FilmesRepository filmesRepository;

    @PostMapping("/cadastrar")
    public Filmes cadastraFilme(@RequestBody Filmes filmes) {
        return filmesRepository.save(filmes);
    }
}
