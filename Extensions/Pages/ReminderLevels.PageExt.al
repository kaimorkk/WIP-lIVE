PageExtension 52193495 pageextension52193495 extends "Reminder Levels" 
{
    layout
    {

        //Unsupported feature: Property Deletion (Enabled) on ""Additional Fee (LCY)"(Control 8)".

        modify("Add. Fee per Line Amount (LCY)")
        {
            Visible = false;
        }
        modify("Add. Fee Calculation Type")
        {
            Visible = false;
        }
        modify("Add. Fee per Line Description")
        {
            Visible = false;
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (Enabled) on "Currencies(Action 20)".

        modify(Setup)
        {
            Visible = false;
        }
        modify("Additional Fee")
        {
            Visible = false;
        }
        modify("Additional Fee per Line")
        {
            Visible = false;
        }
        modify("View Additional Fee Chart")
        {
            Visible = false;
        }
    }
}

