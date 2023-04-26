package jdev.mentoria.lojavirtual.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
