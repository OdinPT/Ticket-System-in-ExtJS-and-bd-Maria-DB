Ext.define('TrackIT.view.tickets.HisComent.FormRegistaComent', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registacoment',
    id: 'formregistacoment',
    controller: 'regisctacoment',

    frame: false,
    width: 700,
    height: 160,
    border: false,

    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {

        layout: 'form',
        margin: 0,
        border: 'false'
    },

    items: [
        {
            xtype: 'textareafield',
            fieldLabel: 'Comentário:',
            id: 'comentario',
            allowBlank: false,
            autoScroll: true,
            blankText: 'Insira um comentário'

        }

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

                    click: 'onClickRegistaComent'
                }

            }
        ]
    }
});