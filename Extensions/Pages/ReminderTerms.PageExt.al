PageExtension 52193494 pageextension52193494 extends "Reminder Terms" 
{
    layout
    {
        modify("Post Add. Fee per Line")
        {
            Visible = false;
        }
        modify("Note About Line Fee on Report")
        {
            Visible = false;
        }
    }
    actions
    {
        modify(Translation)
        {
            Visible = false;
        }
    }
}

