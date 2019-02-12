
public class ScrumPoker.Application : Gtk.Application {
    
    ScrumPoker.Window window;
    
    public Application() {
        Object(
            application_id: "me.dcordero.scrumpoker",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    protected override void activate() {
        setUpWindow();
    }
    
    // Private
    
    private void setUpWindow() {
        window = new ScrumPoker.Window(this);
        setUpCards();
        window.show_all();
    }
    
    private void setUpCards() {
        var box = new Gtk.VBox(true, 10);
        
        var grid = new Gtk.Grid();
        grid.set_column_homogeneous(true);
        grid.set_row_homogeneous(true);
        grid.set_column_spacing(10);
        grid.set_row_spacing(10);
        
        string[] template = Templates.standard();
        
        for(int i=0; i<template.length; i++) {
            var button = new Gtk.Button.with_label(template[i].to_string());

            var label = button.get_child() as Gtk.Label;
            label.override_font(Pango.FontDescription.from_string("Sans 25"));

            grid.attach(button, i%3, i/3);
            
            button.clicked.connect(() => {
                on_click(button, window);
            });
        }
        
        box.add(grid);
        window.add(box);
    }
    
    private void on_click(Gtk.Button button, ScrumPoker.Window window) {
        var dialog = new Hdy.Dialog(window);
        
        var readyButton = new Gtk.Button.with_label("Ready !");

        var label = readyButton.get_child() as Gtk.Label;
        label.override_font(Pango.FontDescription.from_string("Sans 25"));

        readyButton.set_vexpand(true);
        (dialog.get_content_area () as Gtk.Box).add (readyButton);
        
        dialog.add_buttons("Reveal", Gtk.ResponseType.ACCEPT, null);
        dialog.show_all();
        
        readyButton.clicked.connect(() => {
            reveal(button.label, readyButton);
        });
            
        dialog.response.connect((response) => {
            reveal(button.label, readyButton); 
        });
    }
    
    private void reveal(string value, Gtk.Button button) {
        button.set_label(value);
        var label = button.get_child() as Gtk.Label;
        label.override_font(Pango.FontDescription.from_string("Sans 100"));
    }
}
