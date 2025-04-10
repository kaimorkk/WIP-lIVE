

page 75256 "Bid Personnel Compliance"
{
    PageType = List;
    SourceTable = "Bid Personnel Compliance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Minimum No. of Required Staff"; Rec."Minimum No. of Required Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum No. of Required Staff field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Actual No. of Proposed Staff"; Rec."Actual No. of Proposed Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Proposed Staff field.';
                }
                field("Compliance Check"; Rec."Compliance Check")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Check field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

