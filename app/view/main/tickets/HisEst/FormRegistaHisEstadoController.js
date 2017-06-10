Ext.define('TrackIT.view.admin.FormRegistaHisEstadoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registahisestado',


    onClickRegistarEstado: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/HistEstado/registaHisEstado.php',
                success: function (response, opts) {
                    Ext.MessageBox.alert('Sucesso', 'Utilizador Registado!');
                },

                failure: function () {
                    alert('Erro...');
                },
                params: {
                    horaatribuicao: Ext.getCmp('horaatribuicao').getValue(),

                    IDEstadoEstado: Ext.getCmp('IDEstadoEstado').getValue(),
                    DataAlteracaoEstado: Ext.getCmp('DataAlteracaoEstado').getValue(),
                    IDNovoEstado: Ext.getCmp('IDNovoEstado').getValue()

                }



            })
    }

    });

