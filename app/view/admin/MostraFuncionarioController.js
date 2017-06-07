Ext.define('TrackIT.view.admin.MostraFuncionarioController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.funcionariocont',

    onClickObterResposta: function() {
        var store = Ext.getStore('funcionarioseleccionado');
        store.load({
            callback: function(records, operation, success) {
                var record=store.getAt(0);
                var a = Ext.getCmp('id_funcionario').setValue(record.data.id_funcionario);
                var b = Ext.getCmp('usernamefunc').setValue(record.data.usernamefunc);
                var c = Ext.getCmp('nome_departamento').setValue(record.data.nome_departamento);
                var d = Ext.getCmp('Descricao_TipoUtilizador').setValue(record.data.Descricao_TipoUtilizador);
            }
        });

    },
    onClickApagarFuncionario: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagarfuncionario.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('title','Sucesso');
                Ext.getCmp('gridfuncionarios').getStore().load();
            }
        })
    },
    onClickEditaFuncionario: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Funcionário',
            modal: true,
            // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
            width: 500,
            height: 345,
            items: [{
                xtype: 'editautilizador'
            }]
        });
        myWin2.show();
    }

});