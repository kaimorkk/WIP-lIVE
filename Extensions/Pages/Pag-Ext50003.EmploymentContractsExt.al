pageextension 50003 "Employment Contracts Ext" extends "Employment Contracts"
{
    layout
    {
        addlast(Control1)
        {

            field("Has Gratuity"; Rec."Has Gratuity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Has Gratuity field.';
            }
            field("Has Pension"; Rec."Has Pension")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Has Pension field.', Comment = '%';
            }
        }
    }
}
