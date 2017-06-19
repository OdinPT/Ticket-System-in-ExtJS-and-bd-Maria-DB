
Ext.define('TrackIT.view.main.historico.HisDep.GridMostraDep', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisdep',
    xtype: 'mainlisthistoricoDep',
    requires: [
        'TrackIT.store.TipoDepartamentoMD.Departamentos',
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
        type: 'Departamentos'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoDep', flex: 0.1},
        { text: 'ID ticket ',  dataIndex: 'IdTicketDep', flex: 1.3},
        { text: 'Hora de atribuição', dataIndex: 'HoraAtribuicaoDep', flex: 2.4},
        { text: 'ID Departamento', dataIndex: 'IDDepartamentoDep', flex: 2.1},
        { text: 'ID funcionario', dataIndex: 'IDFuncEstado', flex: 4}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('gridhisdep').store.reload();
                }
            }]
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