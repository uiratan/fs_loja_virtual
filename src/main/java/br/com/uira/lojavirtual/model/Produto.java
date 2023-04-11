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
	
	@Column(nullable = false)
	private String tipoUnidade;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private Boolean ativo = Boolean.TRUE;

	
	@Column(nullable = false, columnDefinition = "text")
	private String descricao;	
	 
	/**
	 * TODO: nota item nota produto - assosciar
	 * **/
	
	@Column(nullable = false)
	private Double peso;
	
	@Column(nullable = false)
	private Double altura;
	
	@Column(nullable = false)
	private Double largura;
	
	@Column(nullable = false)
	private Double profundidade;
	
	@Column(nullable = false)
	private BigDecimal valorVenda = BigDecimal.ZERO;
	
	@Column(nullable = false)
	private Integer quantidadeEstoque = 0;
	
	private Boolean alertaEstoque = Boolean.FALSE;
	private Integer quantidadeAlertaEstoque = 0;
	
	private String linkVideo;
	
	private Integer quantidadeCliques = 0;
	
	
}
