

page 75141 "Bid Key Staff Qualification"
{
    PageType = List;
    SourceTable = "Bid Key Staff Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Proposed Project Role ID"; Rec."Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposed Project Role ID field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Qualification Requirements field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Year field.';
                }
                field("End Year"; Rec."End Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Year field.';
                }
                field("Outstanding Achievements"; Rec."Outstanding Achievements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outstanding Achievements field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

