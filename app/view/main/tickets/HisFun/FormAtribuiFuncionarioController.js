Ext.define('TrackIT.view.main.tickets.HisFun.FormAtribuiFuncionarioController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.atribuifunc',


    onClickAtribuirFuncionario: function()
    {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Admin/atribuirfuncionario.php',

                success: function (response, opts){

                    Ext.MessageBox.alert('Sucesso','Funcionário Atribuído!');

                    function hide_message() {
                        Ext.defer(function() {
                            Ext.MessageBox.hide();
                            Ext.getCmp('gridticket').getStore().load();
                        }, 1200);
                    }
                    hide_message();
                    },

                failure: function (){alert('Erro...');},
                params: { id_funcionario: Ext.getCmp('id_funcionario').getValue()}
            });
    }

});