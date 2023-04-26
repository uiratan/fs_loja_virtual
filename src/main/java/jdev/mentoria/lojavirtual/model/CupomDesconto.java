package jdev.mentoria.lojavirtual.model;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
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
