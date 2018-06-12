// Definição do modelo de para cada resposta enviada por um funcionário ao criador do ticket.

Ext.define('TrackIT.model.Respostas', {
extend: 'Ext.data.Model',
fields: ['id_resp','subject_resp','body_resp', 'datea_resp', 'id_email']
});
