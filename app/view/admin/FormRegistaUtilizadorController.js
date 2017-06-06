Ext.define('TrackIT.view.admin.FormRegistaUtilizadorController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registautilizador',


    onClickRegistarUtilizador: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarutilizador.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Registado!');
                },

                failure: function (){alert('Erro...');},

                params: { user: Ext.getCmp('user').getValue(), pass: Ext.getCmp('pass').getValue(), id_departamento: Ext.getCmp('id_departamento').getValue(), tipo_funcionario: Ext.getCmp('tipo_funcionario').getValue()}
            });

    }

});