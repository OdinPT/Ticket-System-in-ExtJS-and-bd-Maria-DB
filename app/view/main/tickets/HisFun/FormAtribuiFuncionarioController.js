Ext.define('TrackIT.view.main.tickets.HisFun.FormAtribuiFuncionarioController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.atribuifunc',


    onClickAtribuirFuncionario: function()
    {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Admin/atribuirfuncionario.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Funcionário Atribuído!');
                    Ext.getCmp('gridticket').getStore().load();},
                failure: function (){alert('Erro...');},
                params: { id_funcionario: Ext.getCmp('id_funcionario').getValue()}
            });
    }

});