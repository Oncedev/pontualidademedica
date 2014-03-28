////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
// Requisitando páginas ao clicar nestes botões...
/////////////////////////////////////////////////////

   var cadastrar = document.getElementById('link_cadastrar').onclick = function() {
        
        requisitar("cadastro.html");
        return false;

     }//... 

     

////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Função carrega a imagem loader...
/////////////////////////////////////////////////////////

     function carregando(c) {

             while(c.hasChildNodes()) {
             c.removeChild(c.lastChild);
      }

      var img = document.createElement('img');
          img.setAttribute('src', 'ajax-loader.gif');
          c.appendChild(img);
      }

//////////////////////////////////////////////////////

/////////////////////////////////////////////////////
// Função mostra na tela a requisição...
////////////////////////////////////////////////////

     function mostrar(ajax) {
          var cadastrar = document.getElementById('whapper_conteudo');
              cadastrar.innerHTML = ajax.responseText;

      }

////////////////////////////////////////////////

///////////////////////////////////////////////
// Função faz a requisição dos dados...
///////////////////////////////////////////////

     function requisitar(url) {
              var ajax = iniciaAjax(); 
              carregando(document.getElementById('whapper_conteudo'));      
              ajax.onreadystatechange = function() {

              if(ajax.readyState == 4) {
                   mostrar(ajax);
           }
        }

         ajax.open("POST", url);
         ajax.send(null);

     } // end requisitar url

////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Função verifica qual tipo de objeto o navegador está utilizando...
//////////////////////////////////////////////////////////////////////

     function iniciaAjax() {

        var ajax = null;

          if(window.XMLHttpRequest) {
             ajax = new XMLHttpRequest();
        }

        else if(window.ActiveXObject) {
           try {
             ajax = new ActiveXObject("Msxml2.XMLHTTP");
        } 
        catch(e) {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");

        } 
       }
          return ajax;
     } // end iniciar ajax...

 //////////////////////////////////////////////////////////////////


