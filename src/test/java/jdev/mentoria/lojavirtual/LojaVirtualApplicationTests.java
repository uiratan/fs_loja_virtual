package jdev.mentoria.lojavirtual;

import jdev.mentoria.lojavirtual.controller.AcessoController;
import jdev.mentoria.lojavirtual.model.Acesso;
import jdev.mentoria.lojavirtual.repository.AcessoRespository;
import junit.framework.TestCase;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest(classes = LojaVirtualApplication.class)
class LojaVirtualApplicationTests extends TestCase {

	@Autowired
	private AcessoController acessoController;

	@Autowired
	private AcessoRespository acessoRespository;

	@Test
	public void testCadastroDeAcesso() {
		Acesso novoAcesso = new Acesso();
		novoAcesso.setDescricao("ROLE_ADMIN");
		assertEquals(true, novoAcesso.getId() == null);

		novoAcesso = acessoController.salvarAcesso(novoAcesso).getBody();
		assertEquals(true, novoAcesso.getId() > 0);
		assertEquals("ROLE_ADMIN", novoAcesso.getDescricao());

		Acesso acessoCarregadoDoBanco = acessoRespository.findById(novoAcesso.getId()).get();
		assertEquals(novoAcesso.getId(), acessoCarregadoDoBanco.getId());

		acessoRespository.deleteById(novoAcesso.getId());
		acessoRespository.flush();
		Acesso acessoDeletadoDoBanco = acessoRespository.findById(acessoCarregadoDoBanco.getId()).orElse(null);
		assertEquals(true, acessoDeletadoDoBanco == null);

		novoAcesso = new Acesso();
		novoAcesso.setDescricao("ROLE_TESTE_QUERY_SQL");
		novoAcesso = acessoController.salvarAcesso(novoAcesso).getBody();
		List<Acesso> acessosCarregadosDoBancoComQuery = acessoRespository.buscarAcessoDescricao("TESTE_QUERY_SQL".trim().toUpperCase());
		assertEquals(1, acessosCarregadosDoBancoComQuery.size());
		acessoRespository.deleteById(novoAcesso.getId());

	}

}
