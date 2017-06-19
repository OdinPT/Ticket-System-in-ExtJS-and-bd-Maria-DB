
Ext.define('TrackIT.view.main.tickets.HisEst.GridMostraHistoricoEstados', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisest',
    xtype: 'mainlisthistoricoest',
    requires: [
        'TrackIT.store.HistoricoEstados.HistoricoEstado',
        'Ext.toolbar.Paging'],



    width: 630,
    autoLoad: true,
    config: {
        autoLoad: true,
        scroll:false,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'HistoricoEstados'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoEstados', flex: 0.1},
        { text: 'Hora de atribuição ',  dataIndex: 'HoraAtribuicaoEstado', flex: 0.5},
        { text: 'Id Ticket', dataIndex: 'IdTicketEstado', flex: 0.2},
        { text: 'Estado', dataIndex: 'Descricao_Estado', flex: 0.3},
        { text: 'Nome de utilizador', dataIndex: 'username', flex: 0.7}
    ],

    tbar: {
        defaultButtonUI: 'default',

       /* items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('gridhisest').store.reload();
                }
            }]*/
    },
    /*listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_funcionario');
            Ext.util.Cookies.set('cookieIDfuncionario', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Funcionário',
                modal: true,
                // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                width: 500,
                height: 345,
                items: [{
                    xtype: 'fieldfuncionario'
                }]
            });
            myWin.show();
        }
    */
    //},





    onGridAfterRender: function(gridhisest){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});