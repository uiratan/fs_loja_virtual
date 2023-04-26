package jdev.mentoria.lojavirtual.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Entity
@PrimaryKeyJoinColumn(name = "id")
@Data
public class PessoaFisica extends Pessoa {
	
	@Column(nullable=false)
	private String cpf;
	
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;
	

}
