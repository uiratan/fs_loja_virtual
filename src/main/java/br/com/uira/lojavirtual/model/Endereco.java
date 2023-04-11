package br.com.uira.lojavirtual.model;

import br.com.uira.lojavirtual.enums.TipoEndereco;
import jakarta.persistence.Column;
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
import lombok.Data;

@Entity
@Data
public class Endereco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private String rua;
	
	@Column(nullable = false)
	private String cep;
		
	@Column(nullable = false)
	private String numero;
	
	private String complemento;
	
	@Column(nullable = false)
	private String bairro;
	
	@Column(nullable = false)
	private String uf;
	
	@Column(nullable = false)
	private String cidade;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "pessoa_id", nullable = false, foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk"))
	private Pessoa pessoa;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private TipoEndereco tipoEndereco;
}
