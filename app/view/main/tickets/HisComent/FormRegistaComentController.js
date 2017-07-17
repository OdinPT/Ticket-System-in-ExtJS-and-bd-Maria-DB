Ext.define('TrackIT.view.main.tickets.HisComent.FormRegistaComentController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.regisctacoment',


    onClickRegistaComent: function()
    {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarcomentario.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','comentario registado!');
                    Ext.getCmp('gridhiscoment2').getStore().load();},
                failure: function (){alert('Erro...');},
                params: { comentario: Ext.getCmp('comentario').getValue()}
            });
    }

});