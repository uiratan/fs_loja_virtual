package br.com.uira.lojavirtual.enums;

import lombok.Data;

@Data
public enum TipoEndereco {

	COBRANCA("Cobrança"), ENTREGA("Entrega");

	private String descricao;

	private TipoEndereco(String descricao) {
		this.descricao = descricao;
	}
}
