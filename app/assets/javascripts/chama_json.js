//////////////////////////////////////////////////////////
// FUNÇÃO CHAMA O JSON....
///////////////////////////////////////////////////////// 

function chamaJson( registro, num_pagina ) {

                var area = document.querySelector('#whapper_conteudo #table_conteudo');
                    area.innerHTML = "";

                $.ajax({

                  url: "medicos.json",
                  data: {
                  CRM_ou_nome: $("#pesquisa_crm").val(),
                  registros_pagina: registro,
                  num_pagina: num_pagina
                },
                  complete: function( data ) {

                      var meuJSON = JSON.parse( data.responseText );   

////////////////////////////////////////////////////
// VERIFICA SE FOI ENCONTRADO UM CADASTRADO...
///////////////////////////////////////////////////

                        if ( meuJSON.medicos.length == 0 ) {
                           area.innerHTML =  '';
                           area.innerHTML = '<h2>Esse médico não foi encontrado no sistema <br> <small> Certifique-se de ter digitado o Nome ou CRM coretamente <br> ou volte para a página Inicial!</small></h2>';
                           $('#anterior').hide();
                           $('#proximo').hide();
                           $('#show_num_paginas').hide();

                            return false;
                         }
                         else {
                           $('#anterior').show();
                           $('#proximo').show();
                           $('#show_num_paginas').show();
                         }

////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////
// SE O NUMERO DA PAGINA FOR IGUAL AO TAMANHO DO JSON, SOME O BUTTON PROXIMO...
//////////////////////////////////////////////////////////////////////////////////////

                      if ( num_pagina == meuJSON.numero_paginas ) {
                          $('#proximo').hide();
                          $('#anterior').css('opacity','0.90');
                      }
                      else {
                          $('#proximo').show();
                      }

////////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////////////////////////////
// MOSTRA OS NÚMEROS DA PÁGINA...
///////////////////////////////////////////////////

              var show_num_paginas = document.querySelector('#show_num_paginas');
                  show_num_paginas.innerHTML = 'Página ' + num_pagina + ' de ' + meuJSON.numero_paginas;

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
                            '<td id="td_atraso">' + saidaAtrasoFormato + '</td>'+
                         '</tr>'

                     } // end for...   

                 } // end complete...
             });
        
        } // end chama json...

/////////////////////////////////////////////////////////







