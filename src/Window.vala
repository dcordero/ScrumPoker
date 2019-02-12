
public class ScrumPoker.Window : Gtk.ApplicationWindow {
    
    public Window(Gtk.Application application) {
        Object(
            application: application
        );
    }
    
    construct {
        title = "Scrum Poker";
        border_width = 10;
        set_default_size(360, 654);
        resizable = false;
        show_all();
    }
}

