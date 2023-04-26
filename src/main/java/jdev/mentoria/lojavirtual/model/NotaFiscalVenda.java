package jdev.mentoria.lojavirtual.model;

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
	
	@Column(nullable = false)
	private String numero;
	
	@Column(nullable = false)
	private String serie;
	
	@Column(nullable = false)
	private String tipo;

	@Column(nullable = false, columnDefinition = "text")
	private String xml;

	
	@Column(nullable = false, columnDefinition = "text")
	private String pdf;
	
	@OneToOne
	@JoinColumn(name = "venda_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "venda_fk"))
	private Venda venda;
}
