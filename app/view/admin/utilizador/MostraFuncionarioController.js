Ext.define('TrackIT.view.admin.utilizador.MostraFuncionarioController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.funcionariocont',

    onClickApagarFuncionario: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagarfuncionario.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('Funcionario Apagado',' com Sucesso');
                Ext.getCmp('gridfuncionarios').getStore().load();
            },
            failure: function (){alert('Erro...');
                Ext.MessageBox.alert('Utilizador Não Apagado','Sem Sucesso!');
            }
        })
    },
    onClickEditaFuncionario: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Funcionário',
            modal: true,
            width: 500,
            height: 345,
            items: [{
                xtype: 'editautilizador'
            }]
        });
        myWin2.show();
    }

});