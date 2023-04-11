package br.com.uira.lojavirtual.model;

import java.math.BigDecimal;
import java.util.Date;

import br.com.uira.lojavirtual.enums.StatusContaPagar;
import jakarta.persistence.ConstraintMode;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Entity
@Data
public class ContaPagar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String descricao;

	private BigDecimal valorTotal;

	private BigDecimal valorDesconto;

	@Enumerated(EnumType.STRING)
	private StatusContaPagar status;

	@Temporal(TemporalType.DATE)
	private Date dataVencimento;

	@Temporal(TemporalType.DATE)
	private Date dataPagamento;

	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "pessoa_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk"))
	private Pessoa pessoa;

	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "fornecedor_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "fornecedor_fk"))
	private Pessoa fornecedor;

}
