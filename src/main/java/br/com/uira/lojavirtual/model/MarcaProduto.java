package br.com.uira.lojavirtual.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
//@Table(name = "marca_produto")
//@SequenceGenerator(name = "seq_marca_produto", sequenceName = "seq_marca_produto", allocationSize = 1, initialValue = 1)
public class MarcaProduto {

	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_marca_produto")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String descricao;

}
