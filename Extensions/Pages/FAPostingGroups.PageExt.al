PageExtension 52193583 pageextension52193583 extends "FA Posting Groups" 
{
    Caption = 'FA Posting Groups';
    layout
    {
        addafter("Allocated Maintenance %")
        {
            field("Straight-Line %";"Straight-Line %")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        
    }
}

