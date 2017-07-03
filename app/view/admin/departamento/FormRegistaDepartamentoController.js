Ext.define('TrackIT.view.admin.departamento.FormRegistaDepartamentoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registadepartamento',


    onClickRegistarDepartamento: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registadepartamento.php',
                success: function (response, opts){
                    Ext.MessageBox.alert('Departamento Registado','Com Sucesso!');
                    Ext.getCmp('griddepartamentos').getStore().load();
                    },

                failure: function (){alert('Erro...');},
                params: { nome_departamento4:
                    Ext.getCmp('nome_departamento4').getValue(), id_departamento4:
                    Ext.getCmp('id_departamento4').getValue()}

            });

    }

});