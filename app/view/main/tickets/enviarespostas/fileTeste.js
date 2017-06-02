
    Ext.define('TrackIT.view.main.tickets.EnviaRespostas.fileTeste', {
        extend: 'Ext.form.Panel',
    xtype: 'fileuploadform',
    id: 'fileuploadform',
    fileUpload: true,
    width: 500,
    autoHeight: true,
    bodyStyle: 'padding: 10px 10px 10px 10px;',
    labelWidth: 50,
    defaults: {
        anchor: '95%',
        allowBlank: false,
        msgTarget: 'side'
    },
    items:[
        {
            xtype: 'fileuploadfield',
            name: 'anexo',
            emptyText: 'Select a document to upload...',
            fieldLabel: 'File',
            buttonOnly: true,
            hideLabel: true
        }],
    buttons: [{
        text: 'Upload',
        handler: function(){
            if(Ext.getCmp('fileuploadform').getForm().isValid()){
                form_action=1;
                Ext.getCmp('fileuploadform').getForm().submit({
                    url: 'app/view/main/tickets/enviarespostas/EnviaMail/mandarmail.php',
                    waitMsg: 'Uploading file...',
                    success: function(form,action){
                        Ext.MessageBox.alert('Sucesso','Enviado!');
                    }
                });
            }
        }
    }]
});