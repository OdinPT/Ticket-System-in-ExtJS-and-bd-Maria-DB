localStorage.setItem("TrackITLoggedIn", true);

// Remove Login Window
this.getView().destroy();

// Add the main view to the viewport
Ext.create({
    xtype: 'app-main'
});
