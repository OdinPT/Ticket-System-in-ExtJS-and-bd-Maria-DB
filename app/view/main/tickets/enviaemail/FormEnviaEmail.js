Ext.define('TrackIT.view.main.tickets.enviaemail.FormEnviaEmail', {
    extend: 'Ext.form.Panel',
    xtype: 'enviaemail',
    controller: 'enviaemailcontroller',
    requires: [
        'TrackIT.view.main.tickets.enviaemail.FormEnviaEmailController'
    ],
    id: 'formenviaemail',
    frame: false,
    width: 700,
    height: 270,
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
          xtype: 'textfield',
          fieldLabel: 'Email:',
          id: 'email',
          allowBlank: false,
          blankText: 'Insira um email'

      },
        {
            xtype: 'textfield',
            fieldLabel: 'Assunto:',
            id: 'assuntoresposta2',
            allowBlank: false,
            blankText: 'Insira um assunto'

        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Corpo:',
            id: 'conteudoresposta2',
            autoScroll: true,
            allowBlank: false,
            blankText: 'Insira a resposta'

        },
        {
            xtype: 'fileuploadfield',
            name: 'anexo2',
            emptyText: 'Select a document to upload...',
            fieldLabel: 'File',
            buttonOnly: true,
            hideLabel: true,
            glyph: 43,
            formBind: true
        }
    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Enviar',
                glyph: 43,
                formBind: true,

                    handler: function(){
                            form_action=1;
                            Ext.getCmp('formenviaemail').getForm().submit({
                                url: 'app/view/main/tickets/enviaemail/EnviaMail/mandarmail.php',
                                waitMsg: 'Enviando...',
                                params: {
                                assuntoresposta2: Ext.getCmp('assuntoresposta2').getValue(),
                                conteudoresposta2: Ext.getCmp('conteudoresposta2').getValue(),
                                email: Ext.getCmp('email').getValue()
                        }});
                        Ext.MessageBox.alert('Sucesso','Enviado!');
                        }
                    }
        ]
    }
});
