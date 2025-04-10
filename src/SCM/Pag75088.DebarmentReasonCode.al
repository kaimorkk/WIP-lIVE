

page 75088 "Debarment Reason Code"
{
    PageType = List;
    SourceTable = "Debarment Reason Code";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Reason Category"; Rec."Reason Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Vendors"; Rec."No. of Vendors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Vendors field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

