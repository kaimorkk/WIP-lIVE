PageExtension 52193579 pageextension52193579 extends "Fixed Asset List" 
{
    layout
    {
        modify("FA Location Code")
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("FA Location";"FA Location Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Vendor No.")
        {
            field("FA Posting Group";"FA Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Budgeted Asset")
        {
            
        }
    }
}

