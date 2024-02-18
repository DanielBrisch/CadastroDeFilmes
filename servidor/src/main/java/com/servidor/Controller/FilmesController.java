package com.servidor.Controller;

import com.servidor.Repository.FilmesRepository;
import com.servidor.entities.Filme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/filmes")
public class FilmesController {

    @Autowired
    private FilmesRepository filmesRepository;

    @PostMapping("/cadastrar")
    public Filme cadastraFilme(@RequestBody Filme filme) {
        return filmesRepository.save(filme);
    }

    @GetMapping("/allFilmes")
    public List<Filme> getFilmes() {
        return filmesRepository.findAll();
    }
}
