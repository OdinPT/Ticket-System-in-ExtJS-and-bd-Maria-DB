Ext.define('TrackIT.view.main.tickets.anexos.ListaAnexos', {
    extend: 'Ext.grid.Panel',
    id: 'gridanexos',
    xtype: 'mainlistanexos',
    width: 1050,
    requires: [
        'TrackIT.store.anexos.Anexos',
        'Ext.toolbar.Paging'
    ],
    config: {
        autoLoad: true
    },
    title: 'Anexos',
    store: {
        type: 'anexos'
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
                            Ext.MessageBox.alert('Ficheiro obtido ', 'Com sucesso');
                            function hide_message() {
                                Ext.defer(function () {
                                    Ext.MessageBox.hide();
                                    Ext.getCmp('gridanexos').getStore().load();
                                }, 1500);
                            }
                            hide_message();
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
    onGridAfterRender: function(gridanexos){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});