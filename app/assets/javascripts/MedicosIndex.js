$(document).ready( function() {
 
  
 
  $.ajax({

      url: "medicos.json",
      complete: function( data ) {

          var meuJSON = JSON.parse( data.responseText );
          var area = document.querySelector('#whapper_conteudo table');

          for ( var cont = 0; cont < meuJSON.length; cont++ ) {
             
            

               area.innerHTML += 
                                  
                             '<tr>' +
                             '<td>' + meuJSON[ cont ].CRM + '</td>' +
                             '<td>' + meuJSON[ cont ].nome + '</td>' +
                             '<td>' + meuJSON[ cont ].atraso_medio + '</td>'+
                             '</tr>'
                }
          
      }
  });
});