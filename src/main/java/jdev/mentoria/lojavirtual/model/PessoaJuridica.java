package jdev.mentoria.lojavirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import lombok.Data;

@Entity
@PrimaryKeyJoinColumn(name = "id")
@Data
public class PessoaJuridica extends Pessoa {
	
	@Column(nullable=false)
	private String cnpj;
	
	@Column(nullable = false)
	private String inscricaoEstadual;
	
	private String inscricaoMunicipal;
	
	@Column(nullable = false)
	private String nomeFantasia;
	
	@Column(nullable = false)
	private String razaoSocial;
	
	private String categoria;
}
