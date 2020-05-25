// JavaScript Document

function abrirCalendario(){
    $(".fecha_vigencia").datepicker();
};
function abrirCalendarioFactura(){
    $(".fecha_factura").datepicker();
};

function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
}
      
$(document).ready(function(){
	if(typeof(pngfix) != "undefined"){ DD_belatedPNG.fix('.png'); }	
    //$(".flotante").fadeOut();
    $(window).on("scroll", function () {
        if ($(this).scrollTop() > 73) {
            //$(".flotante").removeClass("hidden");
            $(".flotante").fadeIn();
        }
        else {
            $(".flotante").fadeOut();
            //$(".flotante").addClass("hidden");
        }
    });
    
    
    
    
    // Get the modal
    var modal = document.getElementById('myModal');
    
    $("#headerclick").on("click", function(){
        
        modal.style.display = "block";
    });
    
    $("#sideclick").on("click", function(){
        
        modal.style.display = "block";
    });
    
    $("#closecall").on("click", function(){
        
        modal.style.display = "none";
    });
    
    
    window.onclick = function(event) {
        // Get the modal
        var modal = document.getElementById('myModal');
        
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
//	$("#p_especial").click( function () {
//          $("#d_especial").toggle();  
//        if($("#d_especial").is(":visible")){
//		  $("#p_especial").addClass("abierto");
//        }else{
//          $("#p_especial").removeClass("abierto");
//        }		
//	});
//    $("#p_medium").click( function () {
//          $("#d_medium").toggle(); 
//        if($("#d_medium").is(":visible")){
//		  $("#p_medium").addClass("abierto");
//        }else{
//          $("#p_medium").removeClass("abierto");
//        }
//	});
//    $("#p_plus").click( function () {
//          $("#d_plus").toggle();  
//        if($("#d_plus").is(":visible")){
//		  $("#p_plus").addClass("abierto");
//        }else{
//          $("#p_plus").removeClass("abierto");
//        }
//	});

//   $("#p_especial, #p_medium, #p_plus").click( function () {
//        $("#d_especial").toggle();  
//         $("#d_medium").toggle();
//         $("#d_plus").toggle();
//         if($("#d_plus").is(":visible")){
//            $("#p_especial, #p_medium, #p_plus").addClass("abierto");
//         }else{
//            $("#p_especial, #p_medium, #p_plus").removeClass("abierto");
//         }
//    });
    
    $(".inspeccion_centro").click( function () {
        $(".ins_centro").fadeIn(); 
        $(".ins_domicilio").fadeOut();  
	});
    $(".inspeccion_domicilio").click( function () {
            $(".ins_centro").fadeOut(); 
          $(".ins_domicilio").fadeIn();  
	});
     $(".tipo_pago1").click( function () {
           $(".pago_automatico").fadeIn();       
    });
     $(".tipo_pago2, .tipo_pago3, .tipo_pago4").click( function () {
           $(".pago_automatico").fadeOut();       
    });
    
    if($(".marca").val()=='1'){
           $(".op1").fadeIn();
           $(".op2").hide();
           $(".op3").hide();
           $(".op4").hide();
           $(".op5").hide();
    }
    if($(".marca").val()=='2'){
           $(".op1").fadeIn();
           $(".op2").hide();
           $(".op3").hide();
           $(".op4").hide();
           $(".op5").hide();
    }
    if($(".marca").val()=='3'){
           $(".op1").hide();
           $(".op2").hide();
           $(".op3").fadeIn();
           $(".op4").hide();
           $(".op5").hide();
    }
    if($(".marca").val()=='4'){
           $(".op1").hide();
           $(".op2").hide();
           $(".op3").hide();
           $(".op4").fadeIn();
           $(".op5").hide();
    }
    if($(".marca").val()=='5'){
           $(".op1").hide();
           $(".op2").hide();
           $(".op3").hide();
           $(".op4").hide();
           $(".op5").fadeIn();
    }
     $("#marca").change( function () {
         if($(".marca").val()=='1'){
               $(".op1").fadeIn();
               $(".op2").hide();
               $(".op3").hide();
               $(".op4").hide();
               $(".op5").hide();
        }
        if($(".marca").val()=='2'){
               $(".op1").hide();
               $(".op2").fadeIn();
               $(".op3").hide();
               $(".op4").hide();
               $(".op5").hide();
        }
        if($(".marca").val()=='3'){
               $(".op1").hide();
               $(".op2").hide();
               $(".op3").fadeIn();
               $(".op4").hide();
               $(".op5").hide();
        }
        if($(".marca").val()=='4'){
               $(".op1").hide();
               $(".op2").hide();
               $(".op3").hide();
               $(".op4").fadeIn();
               $(".op5").hide();
        }
        if($(".marca").val()=='5'){
               $(".op1").hide();
               $(".op2").hide();
               $(".op3").hide();
               $(".op4").hide();
               $(".op5").fadeIn();
        }
     });
        $(".checkDatosContratante").click( function () {
               $(".DatosContratante").toggle();
        });
    
	
});



////function alerta(){
////    var url = $('.alerta').html();
////    setTimeout(function() {                
////        window.parent.Shadowbox.open({
////          content: url,
////          player: 'html'
////        });
////}, 5);
//
//};

//$(function () {
//	$('.popup-modal').magnificPopup({
//		type: 'inline',
//		preloader: false,
//		focus: '#username',
//		modal: true
//	});
//	$(document).on('click', '.popup-modal-dismiss', function (e) {
//		e.preventDefault();
//		$.magnificPopup.close();
//	});
//});


/*function abrirPlanes(){
         $("#d_especial").toggle();  

         $("#d_plus").toggle();
         if($("#d_plus").is(":visible")){
            $("#p_especial, #p_medium, #p_plus").addClass("abierto");
         }else{
            $("#p_especial, #p_medium, #p_plus").removeClass("abierto");
        }
    };*/
function abrirPlan(idPago) {
    $(idPago).toggle();
    var res = idPago.replace("#", ".");

    if ($(idPago).is(":visible")) {
        $(res).addClass("abierto");
    } else {
        $(res).removeClass("abierto");
    }
}


function rastreo_analytics(mensaje) {
    var men = mensaje;
   //window.dataLayer = window.dataLayer || [];
    dataLayer.push({ 'event': 'GAevent', 'eventCategory': 'Seguro Vehiculo', 'eventAction': 'error', 'eventLabel': men });
}


function preguntas_declaracion_estado_n(btnRadio, resp, idPregunta, idPreguntaPadre){
    var url = "Emisor.aspx/preguntasDeclaracionEstado";
    var aData = [];
    aData[0] = btnRadio.id;
    aData[1] = idPregunta;
    aData[2] = idPreguntaPadre;
    aData[3] = resp;
    
    var jData = JSON.stringify({ aData: aData});
    
    $.ajax({
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      type: 'POST',
      url: url,
      data: jData,
      success: function (response) {
        //console.log(response);
        if(response != ""){
            // Auto Nuevo
            if($('#Resp1_2').is(':checked')){
                $('#ctl00_ContentPlaceHolder1_dvInspeccion').hide();
                $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Contratar Seguro');
            }else{
                $('#ctl00_ContentPlaceHolder1_dvInspeccion').show();
                $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Emitir Propuesta');
            }
        }else{
        }
      },
      error: function (response) {
        console.log(response);
      }
    });
}

function preguntas_declaracion_estado(btnRadio, resp, idPregunta, idPreguntaPadre){
    
    var url_a = "Emisor.aspx/preguntasDeclaracionEstado";
    
    var url_b = "Emisor.aspx/cantidadPreguntas";
    
    var aData = [];
    aData[0] = btnRadio.id;
    aData[1] = idPregunta;
    aData[2] = idPreguntaPadre;
    aData[3] = resp;
    
    var bData = [];
    var aNuevo  = $('#ctl00_ContentPlaceHolder1_hdn_AutoNuevo').val();
    if(aNuevo != 'true')
        bData[0] = '0';
    else
        bData[0] = '1';
    bData[1] = '0';
    
    
    
    
    var jData = JSON.stringify({ aData: aData});
    console.log("jData: " + jData);

    var jData2 = JSON.stringify({ bData: bData});
    
    var cant_preguntas = 0;
    
    $.ajax({
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      type: 'POST',
      url: url_a,
      data: jData,
      success: function (response) {
        //console.log(response);
        
        $.ajax({
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            type: 'POST',
            url: url_b,
            data: jData2,
            success: function (resp) { cant_preguntas = resp; },
            async: false
        });
        
        if(response != ""){
            if(response != "N"){
                $('#Resp' + (parseInt(idPregunta) + 1) + '_1').attr('disabled', false);
                $('#Resp' + (parseInt(idPregunta) + 1) + '_2').attr('disabled', false);
            }else{
                for(i = (parseInt(idPregunta) + 1); i <= parseInt(cant_preguntas); i++){
                    $('#Resp' + (i) + '_1').attr('checked', false);
                    $('#Resp' + (i) + '_1').attr('disabled', true);
                    $('#Resp' + (i) + '_2').attr('checked', false);
                    $('#Resp' + (i) + '_2').attr('disabled', true);
                }
            }
        }
      },
      error: function (response) {
        console.log(response);
      },
      async: false
    });
    
    var logica = false;
    
    
    for(j = 1; j <= cant_preguntas; j++){
        var rsi = $('#Resp' + j + '_1');
        var rno = $('#Resp' + j + '_2');
        
        aData[0] = j;
        aData[1] = j; 
        
        debugger;
        if(rsi.is(':checked') || rno.is(':checked')){
            if(rsi.is(':checked')){
                aData[3] = "SI";
                jData = JSON.stringify({ aData: aData});
                $.ajax({
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    url: url_a,
                    data: jData,
                    success: function(response){
                        if(response != "N"){ logica = true;}
                        else { logica = false;}
                    },
                    async: false
                });
                
                if(j < cant_preguntas)
                    logica = false;
                    
            }else if(rno.is(':checked')){
                aData[3] = "NO";
                jData = JSON.stringify({ aData: aData});
                $.ajax({
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    url: url_a,
                    data: jData,
                    success: function(response){
                        if(response != "N" && response != ""){ logica = true;}
                        else {logica = false;}
                    },
                    async: false
                });
                
                if(j < cant_preguntas)
                    logica = false;
            }
        }else{
            logica = false;
        }
    }
    debugger;
    if(cant_preguntas == 1 && aData[3] == "NO")
		facturaValidaDiasHabilesSinFecha();
	else
	{
        if(logica){
    //        $('#ctl00_ContentPlaceHolder1_dvInspeccion').hide();
            $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Contratar Seguro');
            $('#ctl00_ContentPlaceHolder1_trSinInspeccion').show();
            $('#ctl00_ContentPlaceHolder1_tr1').hide();
            $('#ctl00_ContentPlaceHolder1_trautoinspeccion').hide();
            $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').hide();
            $('#ctl00_ContentPlaceHolder1_rdbInspeccionDomicilio').hide();
            $('#ctl00_ContentPlaceHolder1_rdbSinInspeccion').attr('checked', true);
        }else{
    //        $('#ctl00_ContentPlaceHolder1_dvInspeccion').show();
             $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Emitir Propuesta');
    //         $('#ctl00_ContentPlaceHolder1_rdbSinInspeccion').attr('checked', false);
             $('#ctl00_ContentPlaceHolder1_trSinInspeccion').hide();
             $('#ctl00_ContentPlaceHolder1_tr1').show();
             $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').show();
             $('#ctl00_ContentPlaceHolder1_rdbInspeccionDomicilio').show();
             $('#ctl00_ContentPlaceHolder1_rdbSinInspeccion').attr('checked', false);
             
             
        }
    }
}

function facturaValidaDiasHabiles(fecha){
    var url = "Emisor.aspx/validaDiasHabiles";
    var aData = [];
    aData[0] = fecha.value;
    aData[1] = "";
    
    var jData = JSON.stringify({ aData: aData});
    
    $.ajax({
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      type: 'POST',
      url: url,
      data: jData,
      success: function (response) {
        console.log(response);
        if(response != ''){
            if(response != 'NOK'){
                $('#ctl00_ContentPlaceHolder1_tr1').show();
                $('#ctl00_ContentPlaceHolder1_trautoinspeccion').show();
                $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').show();
//                $('#ctl00_ContentPlaceHolder1_rdbSinInspeccion').attr('checked', false);
                $('#ctl00_ContentPlaceHolder1_trSinInspeccion').hide();
                $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Emitir Propuesta');
            }else{
                $('#ctl00_ContentPlaceHolder1_tr1').hide();
                $('#ctl00_ContentPlaceHolder1_trautoinspeccion').hide();
                $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').hide();
                $('#ctl00_ContentPlaceHolder1_trSinInspeccion').show();
                $('#ctl00_ContentPlaceHolder1_rdbInspeccionDomicilio').hide();
                $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Contratar Seguro');
            }
        }else{
            
        }
      },
      error: function (response) {
        console.log(response);
      }
    });
}

function facturaValidaDiasHabilesSinFecha() {
    var url = "Emisor.aspx/validaDiasHabilesConFecha";
    var aData = [];
    var jData = JSON.stringify({ aData: aData });

    $.ajax({
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        type: 'POST',
        url: url,
        data: jData,
        success: function (response) {
            console.log(response);
				if (response != '') {
					if(response != 'NOK'){
                    $('#ctl00_ContentPlaceHolder1_tr1').show();
                    $('#ctl00_ContentPlaceHolder1_trautoinspeccion').show();
                    $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').show();
                    $('#ctl00_ContentPlaceHolder1_rdbInspeccionDomicilio').show();
//                    $('#ctl00_ContentPlaceHolder1_rdbSinInspeccion').attr('checked', false);
                    $('#ctl00_ContentPlaceHolder1_trSinInspeccion').hide();
                    $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Emitir Propuesta');
				}else{
                    $('#ctl00_ContentPlaceHolder1_tr1').hide();
                    $('#ctl00_ContentPlaceHolder1_trautoinspeccion').hide();
                    $('#ctl00_ContentPlaceHolder1_trCentrosInspeccion').hide();
                    $('#ctl00_ContentPlaceHolder1_rdbInspeccionDomicilio').hide();
                    $('#ctl00_ContentPlaceHolder1_trSinInspeccion').show();
                    $('#ctl00_ContentPlaceHolder1_ImgValidaEmitir').val('Contratar Seguro');
				}
            } else {

            }
        },
        error: function (response) {
            console.log(response);
        }
    });
}


function validaPreguntas(e){

    for(i = 1; i <= 4; i++){
        var rsi = $('#Resp' + i + '_1');
        var rno = $('#Resp' + i + '_2');

        var dsi = document.getElementById('#Resp' + i + '_1').getAttribute('disabled');
        var dno = document.getElementById('#Resp' + i + '_2').getAttribute('disabled');

        if(!dsi || !dno){
            if(rsi.is(':checked'))
                $('#ctl00_ContentPlaceHolder1_hdnR' + i).val('SI');
            else if(rno.is(':checked'))
                $('#ctl00_ContentPlaceHolder1_hdnR' + i).val('NO');
            else
                $('#ctl00_ContentPlaceHolder1_hdnR' + i).val('');
        }else{
            $('#ctl00_ContentPlaceHolder1_hdnR' + i).val('disabled');
        }
    }
}