Ext.define('TrackIT.view.main.tickets.HisComent.FormRegistaComentController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.regisctacoment',


    onClickRegistaComent: function()
    {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarcomentario.php',
                success: function (response, opts){

                    Ext.MessageBox.alert('Sucesso','comentario registado!');

                    function hide_message() {
                        Ext.defer(function() {
                            Ext.MessageBox.hide();
                            Ext.getCmp('gridhiscoment2').getStore().load();
                        }, 1200);
                    }
                    hide_message();
                },

                failure: function (){alert('Erro...');},
                params: { comentario: Ext.getCmp('comentario').getValue()}
            });
    }

});