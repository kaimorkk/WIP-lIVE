

page 95122 "Audit Locations"
{
    CardPageID = "Audit Location";
    PageType = List;
    SourceTable = "Audit Location1";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center ID field.';
                }
                field("Audit Site Type"; Rec."Audit Site Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Site Type field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Email field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field("No. of Audit Projects"; Rec."No. of Audit Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Projects field.';
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

