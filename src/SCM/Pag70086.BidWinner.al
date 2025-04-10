

page 70086 "Bid Winner"
{
    PageType = List;
    SourceTable = Bidders;
    SourceTableView = where("Failed Mandatory" = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ref No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Recommended Winner"; Rec."Recommended Winner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Winner field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

