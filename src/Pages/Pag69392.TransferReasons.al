page 69392 "Transfer Reasons"
{
    ApplicationArea = All;
    Caption = 'Transfer Reasons';
    PageType = List;
    SourceTable = "Transfer Reasons";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Applicable Area"; Rec."Applicable Area")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applicable Area field.';
                }
            }
        }
    }
}
