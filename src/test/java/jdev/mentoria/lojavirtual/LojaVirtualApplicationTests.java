package jdev.mentoria.lojavirtual;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jdev.mentoria.lojavirtual.controller.AcessoController;
import jdev.mentoria.lojavirtual.model.Acesso;
import jdev.mentoria.lojavirtual.repository.AcessoRespository;
import junit.framework.TestCase;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Profile;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@Profile("test")
@SpringBootTest(classes = LojaVirtualApplication.class)
class LojaVirtualApplicationTests extends TestCase {

    @Autowired
    private AcessoController acessoController;

    @Autowired
    private AcessoRespository acessoRespository;

    @Autowired
    private WebApplicationContext wac;

    @Test
    public void testRestApiCadastroAcesso() throws JsonProcessingException, Exception {
        DefaultMockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(this.wac);
        MockMvc mockMvc = builder.build();

        Acesso acesso = new Acesso();
        acesso.setDescricao("ROLE_TESTE_API_CADASTRO_ACESSO");

        ObjectMapper objectMapper = new ObjectMapper();
        ResultActions retornoApi = mockMvc.perform(
                MockMvcRequestBuilders.post("/salvarAcesso")
                        .content(objectMapper.writeValueAsString(acesso))
                        .accept(MediaType.APPLICATION_JSON)
                        .contentType(MediaType.APPLICATION_JSON)
        );
        //System.out.println("Recebido pela API: " + retornoApi.andReturn().getRequest().getContentAsString());
        System.out.println("Retorno da API: " + retornoApi.andReturn().getResponse().getContentAsString());

        Acesso objetoRetorno = objectMapper.readValue(
                retornoApi.andReturn().getResponse().getContentAsString(),
                Acesso.class);

        assertEquals(acesso.getDescricao(), objetoRetorno.getDescricao());
    }

    @Test
    public void testRestApiDeletarAcesso() throws JsonProcessingException, Exception {
        DefaultMockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(this.wac);
        MockMvc mockMvc = builder.build();

        Acesso acesso = new Acesso();
        acesso.setDescricao("ROLE_TESTE_API_DELETAR_ACESSO");
        acesso = acessoRespository.save(acesso);

        ObjectMapper objectMapper = new ObjectMapper();
        ResultActions retornoApi = mockMvc.perform(
                MockMvcRequestBuilders.post("/deleteAcesso")
                        .content(objectMapper.writeValueAsString(acesso))
                        .accept(MediaType.APPLICATION_JSON)
                        .contentType(MediaType.APPLICATION_JSON)
        );
        System.out.println("Corpo de retorno da API: " + retornoApi.andReturn().getResponse().getContentAsString());
        System.out.println("Status de retorno da API: " + retornoApi.andReturn().getResponse().getStatus());

        assertEquals("Acesso Removido", retornoApi.andReturn().getResponse().getContentAsString());
        assertEquals(200, retornoApi.andReturn().getResponse().getStatus());
    }

    @Test
    public void testRestApiDeletarAcessoPorId() throws JsonProcessingException, Exception {
        DefaultMockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(this.wac);
        MockMvc mockMvc = builder.build();

        Acesso acesso = new Acesso();
        acesso.setDescricao("ROLE_TESTE_API_DELETAR_ACESSO_POR_ID");
        acesso = acessoRespository.save(acesso);

        ObjectMapper objectMapper = new ObjectMapper();
        ResultActions retornoApi = mockMvc.perform(
                MockMvcRequestBuilders.delete("/deleteAcessoPorId/" + acesso.getId())
                        .content(objectMapper.writeValueAsString(acesso))
                        .accept(MediaType.APPLICATION_JSON)
                        .contentType(MediaType.APPLICATION_JSON)
        );
        System.out.println("Corpo de retorno da API: " + retornoApi.andReturn().getResponse().getContentAsString());
        System.out.println("Status de retorno da API: " + retornoApi.andReturn().getResponse().getStatus());

        assertEquals("Acesso Removido", retornoApi.andReturn().getResponse().getContentAsString());
        assertEquals(200, retornoApi.andReturn().getResponse().getStatus());
    }

    @Test
    public void testRestApiObterAcessoId() throws JsonProcessingException, Exception {
        DefaultMockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(this.wac);
        MockMvc mockMvc = builder.build();

        Acesso acesso = new Acesso();
        acesso.setDescricao("ROLE_TESTE_OBTER_ACESSO_POR_ID");
        acesso = acessoRespository.save(acesso);

        ObjectMapper objectMapper = new ObjectMapper();
        ResultActions retornoApi = mockMvc.perform(
                MockMvcRequestBuilders.get("/obterAcesso/" + acesso.getId())
                        .content(objectMapper.writeValueAsString(acesso))
                        .accept(MediaType.APPLICATION_JSON)
                        .contentType(MediaType.APPLICATION_JSON)
        );

        assertEquals(200, retornoApi.andReturn().getResponse().getStatus());

        Acesso objetoRetorno = objectMapper.readValue(
                retornoApi.andReturn().getResponse().getContentAsString(),
                Acesso.class);

        assertEquals(acesso.getDescricao(), objetoRetorno.getDescricao());
        assertEquals(acesso.getId(), objetoRetorno.getId());
    }

    @Test
    public void testRestApiObterListaDeAcessoPorDescricao() throws JsonProcessingException, Exception {
        DefaultMockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(this.wac);
        MockMvc mockMvc = builder.build();

        Acesso acesso = new Acesso();
        acesso.setDescricao("ROLE_TESTE_OBTER_LISTA_ACESSO_POR_DESCRICAO");
        acesso = acessoRespository.save(acesso);

        ObjectMapper objectMapper = new ObjectMapper();
        ResultActions retornoApi = mockMvc.perform(
                MockMvcRequestBuilders.get("/buscarPorDescricao/OBTER_LISTA_ACESSO_POR_DESCRICAO")
                        .content(objectMapper.writeValueAsString(acesso))
                        .accept(MediaType.APPLICATION_JSON)
                        .contentType(MediaType.APPLICATION_JSON)
        );

        assertEquals(200, retornoApi.andReturn().getResponse().getStatus());

        List<Acesso> retornoApiList = objectMapper.readValue(
                						retornoApi.andReturn().getResponse().getContentAsString(),
                						new TypeReference<List<Acesso>>() {});

		assertEquals(1, retornoApiList.size());
        assertEquals(acesso.getDescricao(), retornoApiList.get(0).getDescricao());
        assertEquals(acesso.getId(), retornoApiList.get(0).getId());

		acessoRespository.deleteById(acesso.getId());
    }

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
