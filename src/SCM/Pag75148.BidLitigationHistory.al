

page 75148 "Bid Litigation History"
{
    PageType = List;
    SourceTable = "Bid Litigation History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Dispute Matter"; Rec."Dispute Matter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dispute Matter field.';
                }
                field("Other Dispute Party"; Rec."Other Dispute Party")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Dispute Party field.';
                }
                field("Dispute Amount LCY"; Rec."Dispute Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dispute Amount LCY field.';
                }
                field("Category of Matter"; Rec."Category of Matter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category of Matter field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

