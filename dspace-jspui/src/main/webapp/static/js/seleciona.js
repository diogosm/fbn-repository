    $(function(){
                $('#tcollection2').change(function(){
                        ans = $('#tcollection2').val();
                        $('#tcollection').html('<option value="-1"></option>');
                        var option = '<option value=""></option>';

                        if(ans == -2){
                            option += '<option value="45">Atas CONDIR</option>'+
                            			'<option value="51">Atas do DAB</option>'+
                            			'<option value="50">Atas do DECOM</option>'+
                                        '<option value="46">Colegiados de Curso</option>'+
                                        '<option value="47">Editais</option>'+
                                        '<option value="11">Memorandos emitidos</option>'+
                                        '<option value="14">Ofícios emitidos</option>'+
                                        '<option value="42">PIT</option>'+
                                        '<option value="13">Portarias da FIC</option>'+
                                        '<option value="12">Resoluções da FIC</option>'+
                                        '<option value="43">RIT</option>'+
                                        '<option value="44">Sem título</option>';
                        } else if(ans == -3){
                            option += '<option value="9">Plano de Ensino</option>'+
                                        '<option value="15">Projeto Pedagógico</option>';
                        } else if(ans == -4){
                            option += '<option value="2">Plano de Ensino</option>'+
                                        '<option value="1">Projeto Pedagógico</option>';
                        } else if(ans == -5){
                            option += '<option value="17">Plano de Ensino</option>'+
                                        '<option value="18">Projeto Pedagógico</option>';
                        } else if(ans == -6){
                            option += '<option value="22">Plano de Ensino</option>'+
                                        '<option value="23">Projeto Pedagógico</option>';
                        } else if(ans == -7){
                            option += '<option value="54">Projeto de Extensão</option>'+
                                        '<option value="55">Projeto de Inovação</option>'+
                                        '<option value="52">Projeto de Pesquisa</option>';
                        } else if(ans == -8){
                            option += '<option value="27">Plano de Ensino</option>'+
                                        '<option value="28">Projeto Pedagógico</option>';
            }

                        $('#tcollection').html(option);
                });
        });



