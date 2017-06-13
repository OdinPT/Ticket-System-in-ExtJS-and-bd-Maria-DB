
Ext.define('TrackIT.view.admin.departamento.GridMostraDepartamentos', {
    extend: 'Ext.grid.Panel',
    id: 'griddepartamentos',
    xtype: 'mainlistdepartamentos',
    requires: [
        'TrackIT.store.admin.Departamentos',
        'Ext.toolbar.Paging',
        'TrackIT.view.admin.departamento.MostraDepartamento',
        'TrackIT.store.admin.DepartamentoSeleccionado'
    ],
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
        type: 'departamentos'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id_departamento', flex: 0.2},
        { text: 'Nome de Departamento',  dataIndex: 'nome_departamento', flex: 1}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('griddepartamentos').store.reload();
                }
            }]
    },
    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_departamento');
            Ext.util.Cookies.set('cookieIDdepartamento', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Departamento',
                modal: true,
                // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                width: 500,
                height: 345,
                items: [{
                    xtype: 'fielddepartamento'
                }]
            });
            myWin.show();
        }

    },




    onGridAfterRender: function(griddepartamentos){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});