package br.com.uira.lojavirtual.enums;

public enum StatusContaPagar {
	
	COBRANCA("Pagar"),
	VENCIDA("Vencida"),
	ABERTA("Aberta"),
	QUITADA("Quitaqda"),
	NEGOCIADA("Renegociada");
	
	private String descricao;
	
	private StatusContaPagar(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return this.descricao;
	}

	@Override
	public String toString() {
		return this.descricao;
	}

}
