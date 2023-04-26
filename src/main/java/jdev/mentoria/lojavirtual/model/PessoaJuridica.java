package jdev.mentoria.lojavirtual.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
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
