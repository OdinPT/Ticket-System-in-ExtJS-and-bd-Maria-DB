Ext.define('TrackIT.view.main.MainController', {
    extend: 'Ext.app.ViewController',

    alias: 'controller.main',
    handler: function() {
      var grid = Ext.ComponentQuery.query('gridticket')[0];
      grid.getStore().removeAll();
    },
    onItemSelected: function (sender, record) {
        Ext.Msg.confirm('Confirm', 'Are you sure?', 'onConfirm', this);
        var grid = Ext.ComponentQuery.query('gridticket')[0];
        grid.getStore().removeAll();
    },

    onConfirm: function (choice) {
        if (choice === 'yes') {
          var grid = Ext.ComponentQuery.query('gridticket')[0];
          grid.getStore().removeAll();
        }
    },
    onClickButton: function () {

        // Remove the localStorage key/value
        localStorage.removeItem('TrackITLoggedIn');
        // Remove Main View
        this.getView().destroy();

        // Add the Login Window
        Ext.create({
            xtype: 'login'
        });
        Ext.util.Cookies.clear('password');
        Ext.util.Cookies.clear('email');
        Ext.util.Cookies.clear('cookieID');
        Ext.util.Cookies.clear('cookieIDhistorico');
        Ext.util.Cookies.clear('cookieIDrecovered');
        Ext.util.Cookies.clear('cookieIDanswer');
        Ext.util.Cookies.clear('cookieIDemail');

    }
});
