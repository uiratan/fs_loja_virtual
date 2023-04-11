package br.com.uira.lojavirtual.model;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.ConstraintMode;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Data;

@Entity
@Data
public class NotaFiscalCompra {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String numero;
	
	@Column(nullable = false)
	private String serie;
	
	private String descricao;
	
	@Column(nullable = false)
	private BigDecimal valorTotal;
	
	private BigDecimal valorDesconto;
	
	@Column(nullable = false)
	private BigDecimal valorICMS;
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dataCompra;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "pessoa_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk"))
	private Pessoa pessoa;
	
	@ManyToOne
	@JoinColumn(name = "conta_pagar_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "conta_pagar_fk"))
	private ContaPagar contaPagar;
	
}
