package jdev.mentoria.lojavirtual.service;

import jdev.mentoria.lojavirtual.model.Acesso;
import jdev.mentoria.lojavirtual.repository.AcessoRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AcessoService {

    @Autowired
    private AcessoRespository acessoRespository;

    public  Acesso save(Acesso acesso) {
        return acessoRespository.save(acesso);
    }

}
