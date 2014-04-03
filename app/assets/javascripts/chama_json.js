//////////////////////////////////////////////////////////
// FUNÇÃO CHAMA O JSON....
///////////////////////////////////////////////////////// 

function chamaJson() {

                var area = document.querySelector('#whapper_conteudo #table_conteudo');
                    area.innerHTML = "";

                $.ajax({

                  url: "medicos.json",
                  data: {CRM_ou_nome: $("#pesquisa_crm").val()},
                  complete: function( data ) {

                      var meuJSON = JSON.parse( data.responseText );   

////////////////////////////////////////////////////
// MOSTRA O CABEÇALHO DA TABELA...
///////////////////////////////////////////////////

                     area.innerHTML += 
                       '<tr>' +
                            '<td class="c"> CRM    </td>' +
                            '<td class="c"> Nome   </td>' +
                            '<td class="c"> Atraso </td>' +
                        '</tr>' 

//////////////////////////////////////////////////

                    for ( var cont = 0; cont < meuJSON.medicos.length; cont++ ) {
                      
///////////////////////////////////////////////////////////
// FORMATA O ATRASO.
//////////////////////////////////////////////////////////

                       var passaMinutosParaHoras = Math.floor( meuJSON.medicos[ cont ].atraso_medio / 60 ),
                           resto = meuJSON.medicos[ cont ].atraso_medio % 60,
                           saidaAtrasoFormato = null;

                           if ( passaMinutosParaHoras < 1 ) {
                                saidaAtrasoFormato = meuJSON.medicos[ cont ].atraso_medio + ' m ';
                           }

                           else {
                               saidaAtrasoFormato = passaMinutosParaHoras + ' h ' + resto;
                           }

///////////////////////////////////////////////////////////
// MOSTRA OS DADOS VIA JSON...
//////////////////////////////////////////////////////////                          

                        area.innerHTML += 

                         '<tr>' +
                            '<td>' + meuJSON.medicos[ cont ].CRM + '</td>' +
                            '<td>' + meuJSON.medicos[ cont ].nome + '</td>' +
                            '<td>' + saidaAtrasoFormato + '</td>'+
                         '</tr>'
                     }                       
                 }
             });
        
        } // end chama json...

/////////////////////////////////////////////////////////

 ////////////////////////////////////////////////
 // ANIMA A PÁGINA AO CARREGAR!
 ///////////////////////////////////////////////
 $(document).ready( function() {
     $('body').hide();
     $('body').fadeIn('slow');
});



//////////////////////////////////////////////////////////
// PAGINAÇÃO....
/////////////////////////////////////////////////////////

 function paginacao( registro, num_pagina ) {
    
            var area = document.querySelector('#whapper_conteudo #table_conteudo');
                area.innerHTML = "";

                $.ajax({

                  url: "medicos.json",
                  data: {
                    registros_pagina: registro,
                    num_pagina: num_pagina,
                  },

                  complete: function( data ) {

                      var meuJSON = JSON.parse( data.responseText );  

////////////////////////////////////////////////////////////////////////////////
// SE NUMERO DA PAGINA FOR IGUAL AO TAMANHO DO JSON, SOME O BUTTON PROXIMO...
///////////////////////////////////////////////////////////////////////////////

                      if ( num_pagina == meuJSON.medicos.length ) {
                          $('#proximo').hide();
                      }
                      else {
                          $('#proximo').show();
                      }
/////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
// SE O NUMERO DA PÁGINA FOR IGUAL A 1 SOME O BUTTON ANTERIOR...
////////////////////////////////////////////////////////////////

                      if ( num_pagina == 1 ) {
                           $('#anterior').hide();
                      }
                      else {
                           $('#anterior').show();
                      }
/////////////////////////////////////////////////
          var show_num_paginas = document.querySelector('#show_num_paginas');
              show_num_paginas.innerHTML = 'Página ' + num_pagina + ' de ' + meuJSON.numero_paginas;
          //console.log(meuJSON.numero_paginas);
          //console.log(num_pagina);

////////////////////////////////////////////////////
// MOSTRA O CABEÇALHO DA TABELA...
///////////////////////////////////////////////////

                     area.innerHTML += 
                       '<tr>' +
                            '<td class="c"> CRM    </td>' +
                            '<td class="c"> Nome   </td>' +
                            '<td class="c"> Atraso </td>' +
                        '</tr>' 

//////////////////////////////////////////////////

                    for ( var cont = 0; cont < meuJSON.medicos.length; cont++ ) {
                      
///////////////////////////////////////////////////////////
// FORMATA O ATRASO.
//////////////////////////////////////////////////////////
                     

                       var passaMinutosParaHoras = Math.floor( meuJSON.medicos[ cont ].atraso_medio / 60 ),
                           resto = meuJSON.medicos[ cont ].atraso_medio % 60,
                           saidaAtrasoFormato = null;

                           if ( passaMinutosParaHoras < 1 ) {
                                saidaAtrasoFormato = meuJSON.medicos[ cont ].atraso_medio + ' m ';
                           }

                           else {
                               saidaAtrasoFormato = passaMinutosParaHoras + ' h ' + resto;
                           }

///////////////////////////////////////////////////////////
// MOSTRA OS DADOS VIA JSON...
//////////////////////////////////////////////////////////                          

                        area.innerHTML += 

                         '<tr>' +
                            '<td>' + meuJSON.medicos[ cont ].CRM + '</td>' +
                            '<td>' + meuJSON.medicos[ cont ].nome + '</td>' +
                            '<td>' + saidaAtrasoFormato + '</td>'+
                         '</tr>'

                       //console.log('tamanho json' +meuJSON.medicos.length);

                      
                     } // end loop...                      
                 }
             });





 }// end paginação...

///////////////////////////////////////////////////////////////////




