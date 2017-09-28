Ext.define('TrackIT.view.admin.utilizador.FormRegistaUtilizadorController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registautilizador',


    onClickRegistarUtilizador: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarutilizador.php',
                success: function (response, opts){
                    Ext.MessageBox.alert('Utilizador Registado','Com Sucesso!');

                    function hide_message() {
                        Ext.defer(function() {
                            Ext.MessageBox.hide();

                            Ext.getCmp('gridfuncionarios').store.reload();
                        }, 1100);
                    }
                    hide_message();

                    },

                failure: function (){alert('Erro...');
                    Ext.MessageBox.alert('Utilizador Não Registado',' Sem sucesso');
                },
                params: { user: Ext.getCmp('user').getValue(), pass: Ext.getCmp('pass').getValue(), id_departamento: Ext.getCmp('id_departamento').getValue(), tipo_funcionario: Ext.getCmp('tipo_funcionario').getValue(),login: Ext.getCmp('login').getValue()}

            });

    }

});