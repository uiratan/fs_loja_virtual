package br.com.uira.lojavirtual.model;

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
	
	private String inscricaoEstadual;
	private String inscricaoMunicipal;
	private String nomeFantasia;
	private String razaoSocial;
	private String categoria;
	
	

}
