package com.servidor.Controller;

import com.servidor.Repository.PessoaRepository;
import com.servidor.entities.Pessoa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/pessoas")
public class PessoaController {

    @Autowired
    private PessoaRepository pessoaRepository;

    @GetMapping("/{id}")
    public ResponseEntity<Pessoa> verificarPessoa(@PathVariable Long id) {
        Optional<Pessoa> pessoaOptional = pessoaRepository.findById(id);

        if (pessoaOptional.isPresent()) {
            return ResponseEntity.ok(pessoaOptional.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/cadastrar")
    public Pessoa cadastrarPessoa(@RequestBody Pessoa pessoa) {
        return pessoaRepository.save(pessoa);
    }
}
