

page 75142 "Bid Key Staff Experience"
{
    PageType = List;
    SourceTable = "Bid Key Staff Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
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
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Category field.';
                }
                field("Years of Experience"; Rec."Years of Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years of Experience field.';
                }
                field("Experience Summary"; Rec."Experience Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Qualification Requirements field.';
                }
                field("Sample Assignments/Projects"; Rec."Sample Assignments/Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sample Assignments/Projects field.';
                }
                field("Experience From Year"; Rec."Experience From Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience From Year field.';
                }
                field("Experience To Year"; Rec."Experience To Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience To Year field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

