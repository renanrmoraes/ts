//------------SOMENTE NUMEROS
function TeclaNumeros(campo){
	if (document.all) // Internet Explorer
	var tecla = event.keyCode;
	else if(document.layers) // Nestcape
	var tecla = e.which;
	if (tecla > 47 && tecla < 58) // numeros de 0 a 9
	return true;
	else{
	if (tecla != 8) // backspace
	event.keyCode = 0;//return false;
	else return true;
	}
}
 
function selecionaVertical(codigo){
	var Formulario = document.forms[0];  
	var combo = Formulario.verticalId; 
	for(x=0; x < combo.length; x++){  
		if(combo[x].value == codigo){  
	    	combo[x].selected = true;  
	    }  
	}  
}

function salvar(form){
	
	formulario = form;
	habilitaCamposForm(form);

	formulario.submit();
	

}

function desabilitaCamposForm(form){
	
	formulario = form;
	
	formulario.regraId.disabled=true;
	formulario.clienteId.disabled=true;
	formulario.projectId.disabled=true;
	formulario.oportunidade.disabled=true;
	formulario.verticalId.disabled=true;
	formulario.description.disabled=true;
	formulario.atividadeId.disabled=true;
	formulario.regraTipoDeslocamentoId.disabled=true;
	
	
}

function habilitaCamposForm(form){
	
	formulario = form;
	
	formulario.regraId.disabled=false;
	formulario.clienteId.disabled=false;
	formulario.projectId.disabled=false;
	formulario.oportunidade.disabled=false;
	formulario.verticalId.disabled=false;
	formulario.description.disabled=false;
	formulario.atividadeId.disabled=false;
	formulario.regraTipoDeslocamentoId.disabled=false;
	formulario.hoursBegin.disabled = false;
	formulario.minBegin.disabled = false;
	formulario.hoursEnd.disabled = false;
	formulario.minEnd.disabled = false;
	
	
}

function validacaoCamposObrigatorios(){

	var formulario = document.forms[0];
	var tipo = formulario.typeId;
	
	
	if(tipo == '4'){
		if(!validaCampoObrigatorio(formulario.regraId)) return false;
		if(!validaCampoObrigatorio(formulario.regraTipoDeslocamentoId)) return false;
	}
	
	if(!validaCampoObrigatorio(formulario.clienteId)) return false;
	if(!validaCampoObrigatorio(formulario.projectId)) return false;
	
	
	return true;
}
	

function validaCampoObrigatorio(campo){
	if(!verificaBranco(campo.value)){
		alert('Campo obrigatório não informado.');
		focusCampo(campo);
		return false;
	}
	return true;
}

function verificaBranco(parametro){	
	teste_parametro = "false"; //variavel para teste de espacos em branco
	tamanho_parametro = parametro.length;
	if (tamanho_parametro != 0){
		
		for (i = 0; i < tamanho_parametro; i++){
			if (parametro.charAt(i) != " " || parametro.charAt(i) != "0"){
				teste_parametro = "true"; /*existe caracter diferente de branco*/
			}
		}
		
		
		if (teste_parametro == "false"){  //todos os caracteres digitados são brancos
			return false;
		}
		else{
			return true;
		}
	}
	else{
		return false;
	}
}

function focusCampo(campoF){
	campoF.focus();
}

var BrowserDetect = {
		init: function () {
			this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
			this.version = this.searchVersion(navigator.userAgent)
				|| this.searchVersion(navigator.appVersion)
				|| "an unknown version";
			this.OS = this.searchString(this.dataOS) || "an unknown OS";
		},
		searchString: function (data) {
			for (var i=0;i<data.length;i++)	{
				var dataString = data[i].string;
				var dataProp = data[i].prop;
				this.versionSearchString = data[i].versionSearch || data[i].identity;
				if (dataString) {
					if (dataString.indexOf(data[i].subString) != -1)
						return data[i].identity;
				}
				else if (dataProp)
					return data[i].identity;
			}
		},
		searchVersion: function (dataString) {
			var index = dataString.indexOf(this.versionSearchString);
			if (index == -1) return;
			return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
		},
		dataBrowser: [
			{
				string: navigator.userAgent,
				subString: "Chrome",
				identity: "Chrome"
			},
			{ 	string: navigator.userAgent,
				subString: "OmniWeb",
				versionSearch: "OmniWeb/",
				identity: "OmniWeb"
			},
			{
				string: navigator.vendor,
				subString: "Apple",
				identity: "Safari",
				versionSearch: "Version"
			},
			{
				prop: window.opera,
				identity: "Opera"
			},
			{
				string: navigator.vendor,
				subString: "iCab",
				identity: "iCab"
			},
			{
				string: navigator.vendor,
				subString: "KDE",
				identity: "Konqueror"
			},
			{
				string: navigator.userAgent,
				subString: "Firefox",
				identity: "Firefox"
			},
			{
				string: navigator.vendor,
				subString: "Camino",
				identity: "Camino"
			},
			{		// for newer Netscapes (6+)
				string: navigator.userAgent,
				subString: "Netscape",
				identity: "Netscape"
			},
			{
				string: navigator.userAgent,
				subString: "MSIE",
				identity: "Explorer",
				versionSearch: "MSIE"
			},
			{
				string: navigator.userAgent,
				subString: "Gecko",
				identity: "Mozilla",
				versionSearch: "rv"
			},
			{ 		// for older Netscapes (4-)
				string: navigator.userAgent,
				subString: "Mozilla",
				identity: "Netscape",
				versionSearch: "Mozilla"
			}
		],
		dataOS : [
			{
				string: navigator.platform,
				subString: "Win",
				identity: "Windows"
			},
			{
				string: navigator.platform,
				subString: "Mac",
				identity: "Mac"
			},
			{
				   string: navigator.userAgent,
				   subString: "iPhone",
				   identity: "iPhone/iPod"
		    },
			{
				string: navigator.platform,
				subString: "Linux",
				identity: "Linux"
			}
		]

	};
	BrowserDetect.init();

