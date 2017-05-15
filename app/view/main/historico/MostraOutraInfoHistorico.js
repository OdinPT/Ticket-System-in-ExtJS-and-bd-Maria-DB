
Ext.define('TrackIT.view.main.historico.MostraOutraInfoHistorico', {
    extend: 'Ext.form.Panel',
    xtype: 'infohistorico',
    controller: 'outrainfohistorico',
    requires: [
      'TrackIT.store.historico.CarregaInfoHistorico',
      'TrackIT.view.main.historico.MostraOutraInfoHistoricoController'
    ],
    id: 'paginaoutrainfohistorico',
    frame: true,
    title: 'Outras Informações',
    width: 1080,
    height: 300,
    bodyPadding: 10,
    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 20
        },

    config:{stores: ['historicoseleccionado1']},

    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'idee'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Data:',
        id: 'dateaaa'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Estado:',
        id: 'stateee'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Departamento:',
        id: 'departmenttt'
    }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Carregar Informações',
        glyph: 43,
        listeners: {
           click: 'onClickObterOutrasInfoHistorico'
        }

      },
      {
        text: 'Limpar',
        glyph: 43,
        listeners: {
          click: 'onClickLimpaOutrasInfoHistorico'
        }
      }
    ]
  }
  });
