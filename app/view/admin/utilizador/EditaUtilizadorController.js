Ext.define('TrackIT.view.admin.utilizador.EditaUtilizadorController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.editautilizador',


    onClickEditaUtilizador: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editautilizador.php',
                success: function (response, opts){
                    Ext.MessageBox.alert('Utilizador Editado','Com Sucesso!');
                    Ext.getCmp('gridfuncionarios').getStore().load();
                },
                failure: function (){alert('Erro...');
                    Ext.MessageBox.alert('Utilizador Não Editado','Sem Sucesso!');
                },
                params: { user:
                    Ext.getCmp('user2').getValue(), pass:
                    Ext.getCmp('password2').getValue(), id_departamento:
                    Ext.getCmp('id_departamento2').getValue(), tipo_funcionario:
                    Ext.getCmp('tipo_funcionario2').getValue()
                }
            });

    }

});