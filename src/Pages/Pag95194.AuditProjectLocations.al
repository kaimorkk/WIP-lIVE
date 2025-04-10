

page 95194 "Audit Project Locations"
{
    CardPageID = "Audit Project Location";
    PageType = List;
    SourceTable = "Audit ProjectLocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Location ID"; Rec."Audit Location ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Location ID field.';
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

