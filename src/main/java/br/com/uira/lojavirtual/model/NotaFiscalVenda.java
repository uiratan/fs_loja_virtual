package br.com.uira.lojavirtual.model;

import jakarta.persistence.Column;
import jakarta.persistence.ConstraintMode;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class NotaFiscalVenda {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String numero;
	private String serie;
	private String tipo;
	
	@Column(columnDefinition = "text")
	private String xml;
	
	@Column(columnDefinition = "text")
	private String pdf;
	
	@OneToOne
	@JoinColumn(name = "venda_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "venda_fk"))
	private Venda venda;
}
