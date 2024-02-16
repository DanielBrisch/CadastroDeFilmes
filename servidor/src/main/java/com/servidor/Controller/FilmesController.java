package com.servidor.Controller;

import com.servidor.Repository.FilmesRepository;
import com.servidor.entities.Filme;
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
    public Filme cadastraFilme(@RequestBody Filme filme) {
        return filmesRepository.save(filme);
    }
}
