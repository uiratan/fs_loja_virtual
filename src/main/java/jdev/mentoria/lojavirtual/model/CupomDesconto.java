package jdev.mentoria.lojavirtual.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;

@Entity
@Data
public class CupomDesconto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String codigo;
	
	private BigDecimal valorMonetario;
	
	private BigDecimal valorPorcentagem;
		
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dataValidade;

}
