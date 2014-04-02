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










