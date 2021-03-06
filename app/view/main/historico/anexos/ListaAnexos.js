Ext.define('TrackIT.view.main.historico.anexos.ListaAnexos', {
    extend: 'Ext.grid.Panel',
    id: 'gridanexoshis',
    xtype: 'mainlistanexoshistorico',


    width: 1050,
    //height: 350,
    requires: [
        'TrackIT.store.anexos.Anexoshistorico',
        'Ext.toolbar.Paging'
    ],
    config: {
        autoLoad: true
    },
    title: 'Anexos',
    store: {
        type: 'anexoshistorico'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id', flex: 0.1,hidden:true},
        { text: 'NOME',  dataIndex: 'nome', flex: 1},
        { text: 'ID DO TICKET', dataIndex: 'id_ticket', flex: 0.3, hidden:true}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Atualizar',
                handler: function() {
                    myRequest1 = Ext.Ajax.request({
                        url: 'app/php/ObterAnexos/src/CarregaAnexos.php',
                        method: 'POST',
                        success: function (response, opts) {
                            Ext.MessageBox.alert('title', 'Sucesso');
                            Ext.getCmp('gridanexoshis').getStore().load();
                        }
                    })
                }

            }]
    },
    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id');
            Ext.util.Cookies.set('cookieIDanexo', id);
            var messageBox = Ext.create('Ext.window.MessageBox', {
                buttonText: {
                    yes: 'Sim',
                    no: 'Não'
                }
            });
            messageBox.confirm('Download', 'Pretende mesmo descarregar o ficheiro?', function(btn){
                if(btn === 'yes'){
                    window.location.assign('app/php/ObterAnexos/src/ObterAnexos.php');
                    messageBox.maskClickAction = this.getMaskClickAction();
                }
                else{
                    messageBox.maskClickAction = this.getMaskClickAction();
                }
            });



        }

    },
    onGridAfterRender: function(gridanexoshis){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});