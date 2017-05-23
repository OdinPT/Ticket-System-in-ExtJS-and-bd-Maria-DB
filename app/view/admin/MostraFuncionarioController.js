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
                var c = Ext.getCmp('id_departamento_funcionarios').setValue(record.data.id_departamento_funcionarios);
                var d = Ext.getCmp('Tipo_Funcionario').setValue(record.data.Tipo_Funcionario);
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
    }

});