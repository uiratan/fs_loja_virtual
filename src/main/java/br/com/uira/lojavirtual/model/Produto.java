package br.com.uira.lojavirtual.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Produto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String tipoUnidade;
	
	private String nome;
	
	private Boolean ativo = Boolean.TRUE;

	
	@Column(columnDefinition = "text")
	private String descricao;	
	 
	/**
	 * TODO: nota item nota produto - assosciar
	 * **/
	
	private Double peso;
	private Double altura;
	private Double largura;
	private Double profundidade;
	
	private BigDecimal valorVenda = BigDecimal.ZERO;
	
	private Integer quantidadeEstoque = 0;
	
	private Boolean alertaEstoque = Boolean.FALSE;
	private Integer quantidadeAlertaEstoque = 0;
	
	private String linkVideo;
	
	private Integer quantidadeCliques = 0;
	
	
}
