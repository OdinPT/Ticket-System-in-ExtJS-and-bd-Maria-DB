Ext.define('TrackIT.view.admin.FormRegistaHisEstado', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registahisestado',
    controller: 'registahisestado',
    requires: [
        'TrackIT.view.admin.FormRegistaHisEstadoController',

    ],
    id: 'formregistahisEstado',
    frame: false,

    height: 230,
    border: false,
    //title: 'Alterar Estado ',

    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {
        layout: 'form',
        margin: 20,
        border: 'true'
    },

    items: [
       /* {
            xtype: 'textfield',
            fieldLabel: 'Hora atribuicao:',
            id: 'horaatribuicao',
            name: 'horaatribuicao'

        },*/

        {
            xtype: 'textfield',
            fieldLabel: 'id  estado :',
            id: 'IDEstadoEstado',
            name: 'IDEstadoEstado'

        },

    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Registar',
                glyph: 43,
                formBind: true,
                listeners: {
                    click: 'onClickRegistarEstado'
                }

            }
        ]
    }
});