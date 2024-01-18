package com.servidor.Controller;

import com.servidor.Repository.PessoaRepository;
import com.servidor.entities.Pessoa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/usuarios")
public class PessoaController {

    @Autowired
    private PessoaRepository pessoaRepository;

    @GetMapping("/id/{id}")
    public ResponseEntity<Pessoa> verificaIdPessoa(@PathVariable Long id) {
        Optional<Pessoa> pessoaOptional = pessoaRepository.findById(id);

        if (pessoaOptional.isPresent()) {
            return ResponseEntity.ok(pessoaOptional.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/nome/{nome}")
    public ResponseEntity<String> verificaNomePessoa(@PathVariable String nome) {
        Pessoa pessoaOptional = pessoaRepository.findByNome(nome);

        if (pessoaOptional != null && pessoaOptional.getNome() != null && !pessoaOptional.getNome().isEmpty()) {
            return ResponseEntity.ok(pessoaOptional.getNome());
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @PostMapping("/cadastrar")
    public Pessoa cadastrarPessoa(@RequestBody Pessoa pessoa) {
        return pessoaRepository.save(pessoa);
    }

    @GetMapping("/getUsuario/{usuario}/{senha}")
    public ResponseEntity<Pessoa> getUsuarioExistente(@PathVariable String nome, @PathVariable String senha) {
        Pessoa getPessoa = pessoaRepository.findByNomeAndSenha(nome, senha);

        if (getPessoa != null) {
            return ResponseEntity.ok(getPessoa);
        }
        return ResponseEntity.notFound().build();
    }
}
